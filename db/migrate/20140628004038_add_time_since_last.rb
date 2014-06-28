class AddTimeSinceLast < ActiveRecord::Migration
  def change
    add_column :punches, :time_since_last, :integer
  end
end
