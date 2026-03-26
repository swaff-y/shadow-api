class RiskAssessmentsController < ApplicationController
  before_action :set_risk_assessment, only: [ :show, :update, :destroy ]

  def index
    render json: RiskAssessment.all
  end

  def show
    render json: @risk_assessment
  end

  def create
    risk_assessment = RiskAssessment.new(risk_assessment_params)
    if risk_assessment.save
      render json: risk_assessment, status: :created
    else
      render json: { errors: risk_assessment.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @risk_assessment.update(risk_assessment_params)
      render json: @risk_assessment
    else
      render json: { errors: @risk_assessment.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @risk_assessment.destroy
    head :no_content
  end

  private

  def set_risk_assessment
    @risk_assessment = RiskAssessment.find(params[:id])
  end

  def risk_assessment_params
    params.expect(risk_assessment: [ :entity_id ])
  end
end
