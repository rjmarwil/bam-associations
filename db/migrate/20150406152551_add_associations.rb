class AddAssociations < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :doctor, index: true
      t.belongs_to :user, index: true
      t.datetime :appointment_date
    end
  end
end
