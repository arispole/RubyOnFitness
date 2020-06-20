class PrivateLesson < ApplicationRecord

	validates :inizio, uniqueness: {scope: :user_id, message: "Hai già inserito questo slot di tempo"}
	
	belongs_to :user
	
	has_one :booked_private_lesson, dependent: :destroy

end
