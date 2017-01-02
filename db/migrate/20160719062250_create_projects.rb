class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.references :user, index: true, foreign_key: true
    	t.string :name
      t.string :description
      t.timestamps null: false
    end
  end
end
