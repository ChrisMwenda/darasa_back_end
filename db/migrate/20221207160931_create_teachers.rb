class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :subject
      t.string :image_url
      t.timestamps
    end
  end
end
