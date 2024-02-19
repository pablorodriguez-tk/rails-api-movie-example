class SourcesController < ApplicationController
  def index
    @sources = Source.all
    render json: @sources.to_json(include: { movie: { include: :director } })
  end

  def show
    render json: source.to_json(include: { movie: { include: :director } })
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)
    if @source.save
      render json: @source, status: :created
    else
      render json: @source.errors, status: :unprocessable_entity
    end
  end

  def edit
    render json: source
  end

  def update
    if source.update(source_params)
      render json: source, status: :ok
    else
      render json: source.errors, status: :unprocessable_entity
    end
  end

  def destroy
    source.destroy
    head :no_content
  end

  private

  def source_params
    params.require(:source).permit(:format, :path, :duration, :movie_id)
  end

  def source
    @source = Source.find(params[:id])
  end
end
