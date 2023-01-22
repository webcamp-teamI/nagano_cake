class Admin::GenresController < ApplicationController
def index
end

def new
end

def create
  @genre = Genre.new(genre_params)
  @genre.save
  redirect_to admin_genres_path
end

def index
  @genres = Genre.all
end

def edit
  @genre = Genre.find(params[:id])
end

def update
  @genre = Genre.find(params[:id])
  @genre.update(genre_params)
   flash[:notice] = "ジャンルの更新は成功したよ🙃"
   redirect_to admin_genres_path
end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end

end
