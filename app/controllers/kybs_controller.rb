class KybsController < ApplicationController
  before_action :set_kyb, only: [ :show, :update, :destroy ]

  def index
    render json: Kyb.all
  end

  def show
    render json: @kyb
  end

  def create
    kyb = Kyb.new(kyb_params)
    if kyb.save
      render json: kyb, status: :created
    else
      render json: { errors: kyb.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @kyb.update(kyb_params)
      render json: @kyb
    else
      render json: { errors: @kyb.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @kyb.destroy
    head :no_content
  end

  private

  def set_kyb
    @kyb = Kyb.find(params[:id])
  end

  def kyb_params
    params.expect(kyb: [ :entity_id ])
  end
end
