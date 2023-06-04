class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :meeting

  def pending?
    status == "pending"
  end

  def accepted?
    status == "accepted"
  end

  def rejected?
    status == "rejected"
  end

  def accept
    update(status: "accepted")
  end

  def reject
    update(status: "rejected")
  end
end
