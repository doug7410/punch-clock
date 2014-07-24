class AddPuchOutToPunches < ActiveRecord::Migration
  def change
    add_column :punches, :punch_out, :timestamp
  end
end
