class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.integer :rating
      t.text :comment
      t.integer :student_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
