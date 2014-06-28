class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @punch = Punch.new
  end

  def show
    @job = Job.find(params[:id])
    @punch = Punch.new
  end 

  def new
    @job = Job.new
  end

  def create
    
    @job = Job.new(job_params)

    if @job.save
      flash[:notice] = "A new job has been added"
      redirect_to jobs_path
    else
      render 'new'
    end

  end


  private

  def job_params
    params.require(:job).permit(:name, :description, :notes)
  end

end