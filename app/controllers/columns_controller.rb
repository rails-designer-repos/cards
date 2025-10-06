class ColumnsController < ApplicationController
  def update
    Board::Column.find(params[:id]).update position: new_position
  end

  private

  def new_position = params[:new_position]
end
