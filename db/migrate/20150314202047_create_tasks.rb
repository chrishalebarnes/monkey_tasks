class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.timestamps null: false
      t.string :name
      t.boolean :completed
      t.belongs_to :user, index:true
    end
  end
end
