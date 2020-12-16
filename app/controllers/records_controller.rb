class RecordsController < ApplicationController
  def index
    @folder = Folder.find(params[:folder_id])
    @records = Record.includes(:folder)
  end

  def new
    @record = Record.new
  end

  def create
    @folder = Folder.find(params[:folder_id])
    @record = Record.new(record_params)
    if @record.save
      render :index
    else
      render :new
    end
  end

  private
  def record_params
    params.require(:record).permit(:title, :caption, :image).merge(folder_id: params[:folder_id])
  end
end
