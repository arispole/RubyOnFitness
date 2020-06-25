class PrivateLessonPolicy < ApplicationPolicy
  
  def new?
    user.trainer_role?
  end
  
  def create?
    user.trainer_role?
  end
  
  def index?
    user.trainer_role?
  end
  
  def edit?
	user.trainer_role? && @record.user_id == user.id && @record.booked == false
  end
  
  def update?
	user.trainer_role? && @record.user_id == user.id && @record.booked == false
  end
  
  def destroy?
	user.trainer_role? && @record.user_id == user.id
  end
  
  def show?
	user.trainer_role? && @record.user_id == user.id
  end  
  
  def showall?
	user.user_role?
  end
  
end
