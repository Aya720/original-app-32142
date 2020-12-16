class RecordsController < ApplicationController
  before_action :get_id, only: [:index, :create]

  def index
    @records = Record.includes(:folder)
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to folder_records_path(@folder.id)
    else
      render :new
    end
  end

  private
  def get_id
  @folder = Folder.find(params[:folder_id])
  end

  def record_params
    params.require(:record).permit(:title, :caption, :image).merge(folder_id: params[:folder_id])
  end
end
