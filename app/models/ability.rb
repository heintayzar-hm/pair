# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Meeting, public: true

    return unless user.present?
    can :manage, Meeting, user: user

    return unless user.id == 1
    can :all, Meeting
  end

end
