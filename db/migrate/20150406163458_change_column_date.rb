class ChangeColumnDate < ActiveRecord::Migration
  def change
    rename_column :appointments, :appointment_date, :date
  end
end
