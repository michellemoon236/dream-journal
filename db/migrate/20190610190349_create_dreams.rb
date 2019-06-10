class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.string :title
      t.string :date 
      t.text :content
      t.integer :user_id
    end
  end
end
