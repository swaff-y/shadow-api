class KycsController < ApplicationController
  before_action :set_kyc, only: [ :show, :update, :destroy ]

  def index
    render json: Kyc.all
  end

  def show
    render json: @kyc
  end

  def create
    kyc = Kyc.new(kyc_params)
    if kyc.save
      render json: kyc, status: :created
    else
      render json: { errors: kyc.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @kyc.update(kyc_params)
      render json: @kyc
    else
      render json: { errors: @kyc.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @kyc.destroy
    head :no_content
  end

  private

  def set_kyc
    @kyc = Kyc.find(params[:id])
  end

  def kyc_params
    params.expect(kyc: [ :entity_id ])
  end
end
