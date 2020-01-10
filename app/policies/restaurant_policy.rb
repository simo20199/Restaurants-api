# frozen_string_literal: true

class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
end

  def create?
    true
  end

  def update?
    record.user == user
  end
end
