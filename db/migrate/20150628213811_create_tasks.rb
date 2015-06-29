class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :notes
      t.string :priority
      t.string :due

      t.timestamps null: false
    end
  end
end
