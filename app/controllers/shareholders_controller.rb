class ShareholdersController < ApplicationController
  before_action :set_shareholder, only: [ :show, :update, :destroy ]

  def index
    render json: Shareholder.all
  end

  def show
    render json: @shareholder
  end

  def create
    shareholder = Shareholder.new(shareholder_params)
    if shareholder.save
      render json: shareholder, status: :created
    else
      render json: { errors: shareholder.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @shareholder.update(shareholder_params)
      render json: @shareholder
    else
      render json: { errors: @shareholder.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @shareholder.destroy
    head :no_content
  end

  private

  def set_shareholder
    @shareholder = Shareholder.find(params[:id])
  end

  def shareholder_params
    params.expect(shareholder: [ :ubo_id, :shareholdable_type, :shareholdable_id, :percentage ])
  end
end
