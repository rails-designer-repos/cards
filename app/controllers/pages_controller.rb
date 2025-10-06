class PagesController < ApplicationController
  def show
    @board = Board.first
  end
end
