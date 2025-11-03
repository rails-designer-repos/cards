class CardsController < ApplicationController
  def create
    @card = Board::Card.create board_column_id: params[:column_id], resource: Message.create(title: "New message")
  end

  def destroy
    @card = Board::Card.find(params[:id])
    @card.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end
end
