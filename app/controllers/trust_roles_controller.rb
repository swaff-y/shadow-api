class TrustRolesController < ApplicationController
  before_action :set_trust_role, only: [ :show, :update, :destroy ]

  def index
    render json: TrustRole.all
  end

  def show
    render json: @trust_role
  end

  def create
    trust_role = TrustRole.new(trust_role_params)
    if trust_role.save
      render json: trust_role, status: :created
    else
      render json: { errors: trust_role.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @trust_role.update(trust_role_params)
      render json: @trust_role
    else
      render json: { errors: @trust_role.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @trust_role.destroy
    head :no_content
  end

  private

  def set_trust_role
    @trust_role = TrustRole.find(params[:id])
  end

  def trust_role_params
    params.expect(trust_role: [ :trust_id, :individual_id, :role ])
  end
end
