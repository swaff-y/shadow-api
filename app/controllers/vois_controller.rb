class VoisController < ApplicationController
  before_action :set_voi, only: [ :show, :update, :destroy ]

  def index
    render json: Voi.all
  end

  def show
    render json: @voi
  end

  def create
    voi = Voi.new(voi_params)
    if voi.save
      render json: voi, status: :created
    else
      render json: { errors: voi.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @voi.update(voi_params)
      render json: @voi
    else
      render json: { errors: @voi.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @voi.destroy
    head :no_content
  end

  private

  def set_voi
    @voi = Voi.find(params[:id])
  end

  def voi_params
    params.expect(voi: [ :entity_id ])
  end
end
