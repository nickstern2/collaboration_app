class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # Anyone can view a restaurant
  end

  def create?
    true # Anyone can create a restaurant
  end

  def edit?
    true
    # record.user == user # Only restaurant creator can update it
  end

  def update?
    true
    # record.user == user  # Only restaurant creator can update it
  end

  def destroy?
    true  # Only restaurant creator can update it
  end
end
