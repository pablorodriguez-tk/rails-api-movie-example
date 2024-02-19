class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.where(gender: params[:gender]) if params[:gender].present?
    render json: @movies.to_json(include: :director)
  end

  def show
    render json: movie.to_json(include: :director)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def edit
    render json: movie
  end

  def update
    if movie.update(movie_params)
      render json: movie, status: :ok
    else
      render json: movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    movie.destroy
    head :no_content
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :gender, :release_date, :qualification, :director_id)
  end

  def movie
    @movie = Movie.find(params[:id])
  end
end
