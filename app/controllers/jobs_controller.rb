class JobsController < ApplicationController

  before_action :find_job, only: [:edit, :show, :update]

  def index

    if !logged_in?
      redirect_to login_path
    else
      @user = User.find(current_user)
      @punch = Punch.new
    end
  end

  def show
    @punch = Punch.new
  end 

  def new
    @job = Job.new
  end

  def create
    
    @job = Job.new(job_params)
    @job.creator = current_user
    if @job.save
      flash[:notice] = "A new job has been added"
      redirect_to jobs_path
    else
      render 'new'
    end

  end

  def edit; end

  def update



    if @job.update(job_params)
      flash[:notice] = "#{@job.name} has been updated"
      redirect_to job_path(@job)
    else
      render :edit
    end

  end


  private

  def job_params
    params.require(:job).permit(:name, :description, :notes, :status)
  end

  def find_job
    @job = Job.find(params[:id])
  end

end