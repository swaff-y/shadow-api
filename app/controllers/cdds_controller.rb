class CddsController < ApplicationController
  before_action :set_cdd, only: [ :show, :update, :destroy ]

  def index
    render json: Cdd.all
  end

  def show
    render json: @cdd
  end

  def create
    cdd = Cdd.new(cdd_params)
    if cdd.save
      render json: cdd, status: :created
    else
      render json: { errors: cdd.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @cdd.update(cdd_params)
      render json: @cdd
    else
      render json: { errors: @cdd.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @cdd.destroy
    head :no_content
  end

  private

  def set_cdd
    @cdd = Cdd.find(params[:id])
  end

  def cdd_params
    params.expect(cdd: [ :entity_id ])
  end
end
