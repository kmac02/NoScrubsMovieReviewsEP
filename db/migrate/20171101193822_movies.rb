class Movies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string  :title
      t.string  :tag_line
      t.string  :poster_url

      t.timestamps
    end
  end
end
