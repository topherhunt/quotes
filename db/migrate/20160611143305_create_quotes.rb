class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :user_id
      t.text :quote
      t.string :source
      t.decimal :weight
      t.string :timestamps
      t.timestamps null: false
    end

    add_index :quotes, :user_id
  end
end
