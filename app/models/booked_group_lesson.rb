class BookedGroupLesson < ApplicationRecord

	belongs_to :user
	
	belongs_to :group_lesson 
	
end
