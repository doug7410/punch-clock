class AddPunchTypeToPunches < ActiveRecord::Migration
  def change
    add_column :punches, :punch_type, :string
  end
end
