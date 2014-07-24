module ApplicationHelper
  
  def format_datetime(dt)
    if dt
      dt.strftime("%l:%M:%S%p %Z on %B %d, %Y")
    end
  end

  def punch_in_date(punch_created_at)
    punch_created_at.strftime("%B %d, %Y")
  end

  def punch_in_time(punch_created_at)
    punch_created_at.strftime("%l:%M:%S%p")
  end

  def punch_out_time(punch_out_at)
    punch_out_at.strftime("%l:%M:%S%p") if punch_out_at
  end

  def total_time_on_job(job)
    @total_time = 0 # set up the total time variable

    job.punches.each do |punch|
      
        @total_time
      
    end

    seconds = @total_time % 60
    minutes = (@total_time / 60) % 60
    hours = @total_time / (60 * 60)

    format("%04d:%02d:%02d", hours, minutes, seconds)
  end

  def format_total_time(time)
    seconds = time % 60
    minutes = (time / 60) % 60
    hours = time / (60 * 60)

    format("%04d:%02d:%02d", hours, minutes, seconds)

  end

end
