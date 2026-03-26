class DirectorsController < ApplicationController
  before_action :set_director, only: [ :show, :update, :destroy ]

  def index
    render json: Director.all
  end

  def show
    render json: @director
  end

  def create
    director = Director.new(director_params)
    if director.save
      render json: director, status: :created
    else
      render json: { errors: director.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @director.update(director_params)
      render json: @director
    else
      render json: { errors: @director.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @director.destroy
    head :no_content
  end

  private

  def set_director
    @director = Director.find(params[:id])
  end

  def director_params
    params.expect(director: [ :ubo_id, :individual_id ])
  end
end
