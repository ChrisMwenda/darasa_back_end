class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :user_name
      t.string :name
      t.string :email
      t.integer :year

      t.timestamps
    end
  end
end
