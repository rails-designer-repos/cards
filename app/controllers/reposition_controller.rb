class RepositionController < ApplicationController
  def update
    resources.each_with_index do |resource, index|
      resource.update!({
        board_column_id: params[:board_column_id],
        position: params[:new_position].to_i
      }.compact_blank)
    end
  end

  private

  def resources
    resource_class = params[:resource_name].singularize.classify.constantize

    resource_class.where(id: Array(params[:ids]))
  end
end
