class CreateDreamCategories < ActiveRecord::Migration
  def change
    create_table :dream_categories do |t|
      t.integer :dream_id
      t.integer :category_id
    end
  end
end
