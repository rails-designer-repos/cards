class CreateBoardColumns < ActiveRecord::Migration[8.0]
  def change
    create_table :board_columns do |t|
      t.belongs_to :board, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :position, null: false

      t.timestamps
    end

    add_index :board_columns, [:board_id, :position], unique: true
  end
end
