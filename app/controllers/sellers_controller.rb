class SellersController < ApplicationController
  before_action :set_seller, only: [ :show, :update, :destroy ]

  def index
    render json: Seller.all
  end

  def show
    render json: @seller
  end

  def create
    seller = Seller.new(seller_params)
    if seller.save
      render json: seller, status: :created
    else
      render json: { errors: seller.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @seller.update(seller_params)
      render json: @seller
    else
      render json: { errors: @seller.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @seller.destroy
    head :no_content
  end

  private

  def set_seller
    @seller = Seller.find(params[:id])
  end

  def seller_params
    params.expect(seller: [ :property_transaction_id, :partyable_type, :partyable_id ])
  end
end
