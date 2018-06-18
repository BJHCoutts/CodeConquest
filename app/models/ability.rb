class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.admin?
      can :manage, :all
    end
 
    can(:manage, DrillGroup) do |drill_group|
      drill_group.user == user
    end

    can :manage, User do |u|
      u == user
    end

  end
end
