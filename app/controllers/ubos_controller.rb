class UbosController < ApplicationController
  before_action :set_ubo, only: [ :show, :update, :destroy ]

  def index
    render json: Ubo.all
  end

  def show
    render json: @ubo
  end

  def create
    ubo = Ubo.new(ubo_params)
    if ubo.save
      render json: ubo, status: :created
    else
      render json: { errors: ubo.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @ubo.update(ubo_params)
      render json: @ubo
    else
      render json: { errors: @ubo.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @ubo.destroy
    head :no_content
  end

  private

  def set_ubo
    @ubo = Ubo.find(params[:id])
  end

  def ubo_params
    params.expect(ubo: [ :entity_id ])
  end
end
