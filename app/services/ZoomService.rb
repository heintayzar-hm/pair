require 'net/http'
require 'json'

class ZoomService
  BASE_URL = 'https://api.zoom.us/v2'
  MAX_RETRY_COUNT = 3
  def initialize(access_token, refresh_token)
    @access_token = access_token
    @refresh_token = refresh_token
    @retry_count = 0
  end

  def create_meeting(topic, start_time, duration, timezone, agenda)
    uri = URI("#{BASE_URL}/users/me/meetings")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(uri.path)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = "Bearer #{@access_token}"

    request.body = {
      topic: topic,
      type: 2,
      start_time: start_time,
      duration: duration,
      timezone: timezone,
      agenda: agenda,
      settings: {
        host_video: true,
        participant_video: true
      }
    }.to_json

    response = http.request(request)

    if response.code.to_i == 201
      JSON.parse(response.body)
    elsif response.code.to_i == 124 || response.code.to_i == 401 # Expired access token
      @retry_count ||= 0
      if @retry_count < MAX_RETRY_COUNT
        refresh_access_token
        @retry_count += 1
        create_meeting(topic, start_time, duration, timezone, agenda) # Retry the request
      else
        raise "Failed to create Zoom meeting: maximum retry attempts reached."
      end
    else
      raise "Failed to create Zoom meeting: #{response.body}"
    end
  end

  private

  def refresh_access_token
    refresh_url = "#{BASE_URL}/oauth/token"
    params = {
      grant_type: 'refresh_token',
      refresh_token: @refresh_token
    }

    response = Net::HTTP.post_form(URI(refresh_url), params)
    if response.code.to_i == 200
      data = JSON.parse(response.body)
      @access_token = data['access_token']
      @refresh_token = data['refresh_token'] unless data['refresh_token'].nil?
      puts 'Access token refreshed successfully.'
    else
      raise "Failed to refresh the access token: #{response.body}"
    end
  end
end
