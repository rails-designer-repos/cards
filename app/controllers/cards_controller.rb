class CardsController < ApplicationController
  def create
    @card = Board::Card.create board_column_id: params[:column_id], resource: Message.create(title: "New message")
  end
end
