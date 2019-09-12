class CreateYoga < ActiveRecord::Migration[5.2]
  def change
    create_table :yogas do |t|
      t.string :time
      t.string :specialty
      t.integer :student_id
      t.integer :teacher_id

    end
  end
end
