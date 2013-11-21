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
        cannot :read, Product
        cannot :read, Order
        cannot :read, Coupon
        cannot :read, Video
        cannot :read, LineItem
        # cannot :read, Cart
    end
  end
end
