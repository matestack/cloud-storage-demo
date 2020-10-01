class DataItemsController < ApplicationController

  matestack_app DataItemManager::App

  def index
    render DataItemManager::Pages::Index
  end

  def show
    render DataItemManager::Pages::Show
  end

  def create
    @data_item = DataItem.new
    @data_item.name = data_items_params[:attached_file].original_filename
    @data_item.attached_file = data_items_params[:attached_file]

    @data_item.save

    if @data_item.errors.any?
      render json: { errors: @data_item.errors }, status: :unprocessable_entity
    else
      broadcast "data_items_changed"
      render json: { }, status: :created
    end
  end

  def destroy
    @data_item = DataItem.find(params[:id])

    if @data_item.destroy
      broadcast "data_items_changed"
      render json: { }, status: :ok
    else
      render json: { errors: @data_item.errors }, status: :unprocessable_entity
    end
  end

  def update
    @data_item = DataItem.find(params[:id])

    if @data_item.update(data_items_params)
      render json: { }, status: :ok
    else
      render json: { errors: @data_item.errors }, status: :unprocessable_entity
    end
  end

  protected

  def data_items_params
    params.require(:data_item).permit(:attached_file, :name)
  end

  def broadcast message
    ActionCable.server.broadcast("matestack_ui_core", {
      message: message
    })
  end

end
