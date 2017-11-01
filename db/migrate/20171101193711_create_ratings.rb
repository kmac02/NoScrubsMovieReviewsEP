class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :star_rating
      t.integer :rater_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
