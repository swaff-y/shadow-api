class LeadEntitiesController < ApplicationController
  before_action :set_lead_entity, only: %i[ show update destroy ]

  # GET /lead_entities
  def index
    @lead_entities = LeadEntity.all

    render json: @lead_entities
  end

  # GET /lead_entities/1
  def show
    render json: @lead_entity
  end

  # POST /lead_entities
  def create
    @lead_entity = LeadEntity.new(lead_entity_params)

    if @lead_entity.save
      render json: @lead_entity, status: :created, location: @lead_entity
    else
      render json: @lead_entity.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /lead_entities/1
  def update
    if @lead_entity.update(lead_entity_params)
      render json: @lead_entity
    else
      render json: @lead_entity.errors, status: :unprocessable_content
    end
  end

  # DELETE /lead_entities/1
  def destroy
    @lead_entity.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead_entity
      @lead_entity = LeadEntity.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lead_entity_params
      params.expect(lead_entity: [ :entity_type, :status ])
    end
end
