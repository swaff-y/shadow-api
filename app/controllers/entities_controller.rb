class EntitiesController < ApplicationController
  before_action :set_entity, only: [ :show, :update, :destroy ]

  def index
    render json: Entity.all
  end

  def show
    render json: @entity
  end

  def create
    entity = Entity.new(entity_params)
    if entity.save
      render json: entity, status: :created
    else
      render json: { errors: entity.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @entity.update(entity_params)
      render json: @entity
    else
      render json: { errors: @entity.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @entity.destroy
    head :no_content
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.expect(entity: [ :type, :name, :status, :risk_rating, :first_name, :last_name, :date_of_birth, :abn, :registration_number, :trust_type ])
  end
end
