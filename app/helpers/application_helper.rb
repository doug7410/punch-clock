module ApplicationHelper
	
	def format_datetime(dt)
    if dt
    	dt.strftime("%l:%M:%S%p %Z on %B %d, %Y")
    end
  end

  def total_time_on_job(job)
  	@total_time = 0 # set up the total time variable

  	job.punches.each do |punch|
  		if punch.punch_type == 'out'
  			@total_time += punch.time_since_last
  		end
  	end

  	seconds = @total_time % 60
		minutes = (@total_time / 60) % 60
		hours = @total_time / (60 * 60)

		format("%04d:%02d:%02d", hours, minutes, seconds)
  end

  def time_on_punch(punch)  
  	seconds = punch.time_since_last % 60
		minutes = (punch.time_since_last / 60) % 60
		hours = punch.time_since_last / (60 * 60)

		format("%04d:%02d:%02d", hours, minutes, seconds)
  end

end
