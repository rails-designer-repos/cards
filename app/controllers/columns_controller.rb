class ColumnsController < ApplicationController
  def create
    @column = Board::Column.create board_id: params[:board_id], name: "New column"
  end

  def update
    Board::Column.find(params[:id]).update position: new_position
  end

  private

  def new_position = params[:new_position]
end
