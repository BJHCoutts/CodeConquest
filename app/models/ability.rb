class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      can :read, :all
    end
 
    can(:manage, DrillGroup) do |drill_group|
      drill_group.user == user
    end

    can :manage, User do |u|
      user == u
    end

  end
end
