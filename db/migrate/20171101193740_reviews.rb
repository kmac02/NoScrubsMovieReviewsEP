class Reviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string  :content
      t.integer :reviewer_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
