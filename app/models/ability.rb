class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
        can :access, :rails_admin   # grant access to rails_admin
        can :manage, :all
        can :dashboard # grant access to the dashboard
    else
        can :read, :all
    end
  end
end
