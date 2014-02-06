class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :type
      t.string :periodicity
      t.text :description

      t.timestamps
    end
  end
end
