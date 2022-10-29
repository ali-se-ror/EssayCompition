class CreateEssays < ActiveRecord::Migration[7.0]
  def change
    create_table :essays do |t|
      t.string :title
      t.text :body
      t.integer :length
      t.references :user, null: false, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
