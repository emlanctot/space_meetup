class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.text :description, null: false
      table.string :location, null: false
      table.date :date, null: false
      table.time :time, null: false
      table.text :picture, null: false

      table.timestamps null: false
    end
  end
end
