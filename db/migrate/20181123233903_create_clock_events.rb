class CreateClockEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :clock_events do |t|
      t.datetime :start_at, null: false
      t.datetime :stop_at
      t.belongs_to :user, null: false
    end
  end
end
