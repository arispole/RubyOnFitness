class ExerciseRoutinePolicy < ApplicationPolicy

  def new?
    user.user_role?
  end
  
  def create?
    user.user_role?
  end
  
  def edit?
	user.user_role? && @record.user_id == user.id
  end
  
  def update?
	user.user_role? && @record.user_id == user.id
  end
  
  def destroy?
	user.user_role? && @record.user_id == user.id
  end
 
end
