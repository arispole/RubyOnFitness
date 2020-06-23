class BookedPrivateLessonsController < ApplicationController

	def book
		privatelesson_id = params[:id]
		@bookedprivatelesson = current_user.booked_private_lessons.new
		@bookedprivatelesson.private_lesson_id = privatelesson_id
		if @bookedprivatelesson.save
			@bookedprivatelesson.private_lesson.update_attribute(:booked, true)
			flash[:notice] = "Lezione prenotata"
        else
			flash[:notice] = @bookedprivatelesson.errors.full_messages
        end
        redirect_to showall_private_lessons_path
	end

	def destroy
		id = params[:id]
		@bookedprivatelesson = BookedPrivateLesson.find(id)
		@bookedprivatelesson.private_lesson.update_attribute(:booked, false)
		@bookedprivatelesson.destroy
		redirect_to show_booked_private_path
	end
	
	def showbooked
		@bookedprivatelessons = current_user.booked_private_lessons
	end
	
end
