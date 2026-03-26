class DocumentsController < ApplicationController
  before_action :set_document, only: [ :show, :update, :destroy ]

  def index
    render json: Document.all
  end

  def show
    render json: @document
  end

  def create
    document = Document.new(document_params)
    if document.save
      render json: document, status: :created
    else
      render json: { errors: document.errors }, status: :unprocessable_entity
    end
  end

  def update
    if @document.update(document_params)
      render json: @document
    else
      render json: { errors: @document.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @document.destroy
    head :no_content
  end

  private

  def set_document
    @document = Document.find(params[:id])
  end

  def document_params
    params.expect(document: [ :entity_id ])
  end
end
