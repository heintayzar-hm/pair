# frozen_string_literal: true

class Meeting < ApplicationRecord
  belongs_to :user
  has_many :invitations, dependent: :destroy
  has_many :invitees, through: :invitations, source: :user

  # Validations
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates :is_public, inclusion: { in: [true, false] }
end
