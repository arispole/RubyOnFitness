class ExercisePolicy < ApplicationPolicy
  
  def index?
    user.user_role?
  end
  
  def show?
	user.user_role?
  end
  
end
