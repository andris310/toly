class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == 'admin'
        can :manage, :all
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
