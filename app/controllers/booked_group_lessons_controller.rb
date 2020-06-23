class BookedGroupLessonsController < ApplicationController

	def book
		grouplesson_id = params[:id]
		@bookedgrouplesson = current_user.booked_group_lessons.new
		@bookedgrouplesson.group_lesson_id = grouplesson_id
		if @bookedgrouplesson.save
			posti = @bookedgrouplesson.group_lesson.posti_disponibili - 1
			@bookedgrouplesson.group_lesson.update_attribute(:posti_disponibili, posti)
			flash[:notice] = "Lezione prenotata"
		else
			flash[:notice] = @bookedprivatelesson.errors.full_messages
		end
		redirect_to showall_group_lessons_path
	end

	def destroy
		id = params[:id]
		@bookedgrouplesson = BookedGroupLesson.find(id)
		posti = @bookedgrouplesson.group_lesson.posti_disponibili + 1
		@bookedgrouplesson.group_lesson.update_attribute(:posti_disponibili, posti)
		@bookedgrouplesson.destroy
		redirect_to show_booked_group_path
	end
	
	def showbooked
		@bookedgrouplessons = current_user.booked_group_lessons
	end
	
end
