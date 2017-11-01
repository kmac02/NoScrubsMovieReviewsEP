class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string  :content
      t.integer :commenter_id
      t.integer :review_id

      t.timestamps
    end
  end
end
