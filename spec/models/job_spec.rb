require 'rails_helper'

describe Job do
  
  describe "current_punch_in" do

    it "returns the last punch for the job order by created_at" do
      job = Job.create(name: 'test job', description: 'test description')
      punch1 = Punch.create(job: job)
      punch2 = Punch.create(job: job)
      expect(job.current_punch_in).to eq(punch2)
    end

    it "returns the last punch where punch_out is nill" do
      job = Job.create(name: 'test job', description: 'test description')
      punch1 = Punch.create(job: job, punch_out: 1.day.ago)
      punch2 = Punch.create(job: job)
      punch3 = Punch.create(job: job, punch_out: 1.day.ago)
      expect(job.current_punch_in).to eq(punch2)
    end

    it "returns nill if punch_out is not nill for the last punch" do
      job = Job.create(name: 'test job', description: 'test description')
      punch1 = Punch.create(job: job, punch_out: 1.day.ago)
      punch2 = Punch.create(job: job, punch_out: 1.day.ago)
      expect(job.current_punch_in).to eq(nil)
    end

    it "returns nill if the job has no punches" do
      job = Job.create(name: 'test job', description: 'test description')
      expect(job.current_punch_in).to eq(nil)
    end

  end
  
end