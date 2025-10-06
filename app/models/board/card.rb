class Board::Card < ApplicationRecord
  belongs_to :column, class_name: "Board::Column", foreign_key: "board_column_id"
  belongs_to :resource, polymorphic: true

  positioned on: :column

  def to_partial_path = "boards/card"
end
