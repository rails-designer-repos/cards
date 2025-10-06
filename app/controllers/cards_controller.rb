class CardsController < ApplicationController
  def update
    Board::Card.find(params[:id]).update board_column_id: board_column_id, position: new_position
  end

  private

  def board_column_id = params[:new_list_id]

  def new_position = params[:new_position]
end
