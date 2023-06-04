require 'net/http'
require 'json'

class ZoomService
  BASE_URL = 'https://api.zoom.us/v2'

  def initialize(access_token)
    @access_token = access_token
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
    else
      raise "Failed to create Zoom meeting: #{response.body}"
    end
  end
end
