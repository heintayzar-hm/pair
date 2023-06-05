# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :programming_language, optional: true

  has_many :invitations
  has_many :meetings, through: :invitations, source: :meeting

  # def invitations
  #   Invitation.includes(:meeting).where(user_id: id)
  # end
end
