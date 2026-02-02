class NaturalPeopleController < ApplicationController
  before_action :set_natural_person, only: %i[ show update destroy ]

  # GET /natural_people
  def index
    @natural_people = NaturalPerson.all

    render json: @natural_people
  end

  # GET /natural_people/1
  def show
    render json: @natural_person
  end

  # POST /natural_people
  def create
    @natural_person = NaturalPerson.new(natural_person_params)

    if @natural_person.save
      render json: @natural_person, status: :created, location: @natural_person
    else
      render json: @natural_person.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /natural_people/1
  def update
    if @natural_person.update(natural_person_params)
      render json: @natural_person
    else
      render json: @natural_person.errors, status: :unprocessable_content
    end
  end

  # DELETE /natural_people/1
  def destroy
    @natural_person.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_natural_person
      @natural_person = NaturalPerson.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def natural_person_params
      params.expect(natural_person: [ :first_name, :last_name, :dob, :docs_s3_folder ])
    end
end
