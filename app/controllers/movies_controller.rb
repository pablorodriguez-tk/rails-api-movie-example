class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @movies = @movies.where(gender: params[:gender]) if params[:gender].present?
    render json: @movies
  end
end
