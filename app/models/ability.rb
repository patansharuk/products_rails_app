# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.dealer?
      can :read, Store, user_id: user.id
      can :store_products, Store, user: user
      can :store_analytics, Store, user: user
    else
      can :read, Product, user: user
    end
  end
end
