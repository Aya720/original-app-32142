class RecordsController < ApplicationController
  before_action :get_id, only: [:index, :show, :new, :create]

  def index
    @records = @folder.records
    # @record = Record.find(params[:folder_id])
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
    @record = Record.find(params[:id])
  end

  private
  def get_id
  @folder = Folder.find(params[:folder_id])
  end

  def record_params
    params.require(:record).permit(:title, :caption, :image).merge(folder_id: params[:folder_id])
  end
end
