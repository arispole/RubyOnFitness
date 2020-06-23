class GroupLesson < ApplicationRecord

	belongs_to :user

	has_many :booked_group_lessons, dependent: :destroy
	
end
