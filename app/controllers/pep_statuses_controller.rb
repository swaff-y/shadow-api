class PepStatusesController < ApplicationController
  before_action :set_pep_status, only: [ :show, :update, :destroy ]

  def index
    render json: PepStatus.all
  end

  def show
    render json: @pep_status
  end

  def create
    pep_status = PepStatus.new(pep_status_params)
    if pep_status.save
      render json: pep_status, status: :created
    else
      render json: { errors: pep_status.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @pep_status.update(pep_status_params)
      render json: @pep_status
    else
      render json: { errors: @pep_status.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @pep_status.destroy
    head :no_content
  end

  private

  def set_pep_status
    @pep_status = PepStatus.find(params[:id])
  end

  def pep_status_params
    params.expect(pep_status: [ :entity_id ])
  end
end
