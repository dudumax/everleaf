class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :inquiry
      t.text :title

      t.timestamps
    end
  end
end
