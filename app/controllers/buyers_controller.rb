class BuyersController < ApplicationController
  before_action :set_buyer, only: [ :show, :update, :destroy ]

  def index
    render json: Buyer.all
  end

  def show
    render json: @buyer
  end

  def create
    buyer = Buyer.new(buyer_params)
    if buyer.save
      render json: buyer, status: :created
    else
      render json: { errors: buyer.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @buyer.update(buyer_params)
      render json: @buyer
    else
      render json: { errors: @buyer.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @buyer.destroy
    head :no_content
  end

  private

  def set_buyer
    @buyer = Buyer.find(params[:id])
  end

  def buyer_params
    params.expect(buyer: [ :property_transaction_id, :partyable_type, :partyable_id ])
  end
end
