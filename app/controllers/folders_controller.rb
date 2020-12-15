class FoldersController < ApplicationController
  def index
    @folders = Folder.all
  end

  def new
    @folder = Folder.new
  end

  def create
    @folder = Folder.new(folder_params)
    if @folder.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name, :image)
  end
end
