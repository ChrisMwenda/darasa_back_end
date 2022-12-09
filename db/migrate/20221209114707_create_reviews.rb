class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :teacher_name
      t.string :title
      t.string :image_url
      t.text :comment

      t.timestamps
    end
  end
end
