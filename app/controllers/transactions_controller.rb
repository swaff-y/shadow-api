class TransactionsController < ApplicationController
  before_action :set_transaction, only: [ :show, :update, :destroy ]

  def index
    render json: Transaction.all
  end

  def show
    render json: @transaction
  end

  def create
    transaction = Transaction.new(transaction_params)
    if transaction.save
      render json: transaction, status: :created
    else
      render json: { errors: transaction.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: { errors: @transaction.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @transaction.destroy
    head :no_content
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.expect(transaction: [ :type, :status, :user_id, :partyable_type, :partyable_id, :property_address ])
  end
end
