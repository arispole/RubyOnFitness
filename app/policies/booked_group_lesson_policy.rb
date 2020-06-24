class BookedGroupLessonPolicy < ApplicationPolicy
  
  def book?
    user.user_role?
  end
  
  def destroy?
	user.user_role? && @record.user_id == user.id
  end
  
  def showbooked?
	user.user_role?
  end
  
end
