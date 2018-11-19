class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :body
      t.float :rating
      t.references :user, foreign_key: true
      t.references :client, index: true, foreign_key:{ to_table: :users }
      t.timestamps
    end
  end
end
