class Votes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :love_scrub
      t.integer :voter_id
      t.integer :review_id

      t.timestamps
    end
  end
end
