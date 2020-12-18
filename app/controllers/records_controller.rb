class RecordsController < ApplicationController
  before_action :get_folder_id, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :get_record_id, only: [:show, :edit, :update]

  def index
    @records = @folder.records
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      # get_id ここでfolder.idを取得すると、saveしたものをfolderプラス、redirectで指定したrecordのindexに表示されるので、結果写真が2枚出てくる
      redirect_to folder_records_path(@folder.id)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @record.update(record_params)
      redirect_to folder_records_path(@folder.id)
    else
      render :edit
    end
  end

  def destroy
    record = Record.find(params[:id])
    record.destroy
    redirect_to folder_records_path(@folder.id)
  end


  private
  def get_folder_id
    @folder = Folder.find(params[:folder_id])
  end

  def get_record_id
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:title, :caption, :image).merge(folder_id: params[:folder_id])
  end
end
