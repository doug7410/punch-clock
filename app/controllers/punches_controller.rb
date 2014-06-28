class PunchesController < ApplicationController

  def create
    @job = Job.find(params[:job_id])

    if @job.punches.any?
      last_punch = @job.punches.last.created_at
      time_since_last_punch = Time.now.getutc - last_punch
    end

    @punch = Punch.create(params.require(:punch).permit(:job_id, :punch_type, :notes))		
    @punch.time_since_last = time_since_last_punch

    if @punch.save
      flash[:notice] = "You have punched #{@job.punches.last.punch_type} to #{@job.name}"
        if params[:punch][:job_page]
          redirect_to job_path(@job)
        else
          redirect_to jobs_path
        end
    else
        render 'jobs/index'
    end
  end

end