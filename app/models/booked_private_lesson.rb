class BookedPrivateLesson < ApplicationRecord

	belongs_to :user
	
	belongs_to :private_lesson 
	
end
