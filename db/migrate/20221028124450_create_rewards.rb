class CreateRewards < ActiveRecord::Migration[7.0]
  def change
    create_table :rewards do |t|
      t.integer :points
      t.integer :position
      t.references :essay, null: false, foreign_key: true

      t.timestamps
    end
  end
end
