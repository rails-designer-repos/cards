class Board::Column < ApplicationRecord
  belongs_to :board

  has_many :cards, -> { order(position: :asc) }, class_name: "Board::Card", foreign_key: "board_column_id", dependent: :destroy

  positioned on: :board

  def to_partial_path = "boards/column"
end
