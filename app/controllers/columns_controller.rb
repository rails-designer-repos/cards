class ColumnsController < ApplicationController
  def create
    @column = Board::Column.create board_id: params[:board_id], name: "New column"
  end
end
