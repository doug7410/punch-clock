class PunchesController < ApplicationController
  before_action :get_job

  def punch_in
    #binding.pry
    

      #time_since_last_punch = Time.now.getutc - last_punch

    @punch = Punch.create(job: @job)		

    if @punch.save
      flash[:notice] = "You have punched in to #{@job.name}"
      redirect_to :back  
    else
        render 'jobs/index'
    end
  end

  def punch_out
    #binding.pry
    punch = @job.current_punch_in
    

    if @job.current_punch_in && punch.update(punch_out: Time.now)
      flash[:notice] = "You have punched out of #{@job.name}"
      redirect_to :back  
    else
        flash[:error] = "You are not punched in to #{@job.name}, so you can't punch out."
        redirect_to job_path(@job)
    end


  end

  private

  def get_job
    @job = Job.find(params[:id])
  end

end