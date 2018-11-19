class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
