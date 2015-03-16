class CreateShare < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.belongs_to :from_user, index:true, class_name: 'User'
      t.belongs_to :to_user, index:true, class_name: 'User'
    end
  end
end
