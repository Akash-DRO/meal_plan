class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
    	t.string :name, null: false
    	t.text :description, null: false
    	t.belongs_to :user, null: false, foreign_key: true

    	t.timestamp null: false
    end

    add_index :recipes, [:user_id, :names]
  end
end
