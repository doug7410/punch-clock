class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.integer :job_id
      t.string :notes
      t.timestamps
    end
  end
end
