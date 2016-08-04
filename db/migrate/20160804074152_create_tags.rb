class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :kind, null: false
      t.text :value
      t.references :page, foreign_key: true

      t.timestamps
    end
  end
end
