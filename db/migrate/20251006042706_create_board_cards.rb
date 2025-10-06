class CreateBoardCards < ActiveRecord::Migration[8.0]
  def change
    create_table :board_cards do |t|
      t.belongs_to :board_column, null: false, foreign_key: { to_table: :board_columns }
      t.belongs_to :resource, polymorphic: true, null: false
      t.integer :position, null: false

      t.timestamps
    end

    add_index :board_cards, [:board_column_id, :position], unique: true
  end
end
