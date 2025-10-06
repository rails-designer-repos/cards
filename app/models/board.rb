class Board < ApplicationRecord
  has_many :columns, -> { order(position: :asc) }, class_name: "Board::Column", dependent: :destroy
end
