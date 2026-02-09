module Api
  class TransactionSessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [ :create ]
    before_action :verify_api_key, only: [ :create ]

    # POST /api/transaction_sessions
    # Create a new session and return the session ID
    def create
      session = TransactionSession.create_session(
        transaction_type: session_params[:transaction_type],
        data: session_params[:data],
        source_app: request.headers["X-Source-App"]
      )

      frontend_url = "#{ENV.fetch("FRONTEND_URL", "http://localhost:3000")}/transaction?session=#{session.id}"

      render json: {
        session_id: session.id,
        url: frontend_url,
        expires_at: session.expires_at
      }, status: :created
    rescue ActiveRecord::RecordInvalid => e
      render json: { error: e.message }, status: :unprocessable_content
    end

    # GET /api/transaction_sessions/:id
    # Retrieve and consume the session data
    def show
      session = TransactionSession.find_by(id: params[:id])

      if session.nil?
        render json: { error: "Session not found" }, status: :not_found
        return
      end

      if session.expired?
        render json: { error: "Session has expired" }, status: :gone
        return
      end

      if session.used
        render json: { error: "Session already used" }, status: :gone
        return
      end

      # Consume the session and return data
      data = session.consume!

      render json: {
        transaction_type: session.transaction_type,
        data: data
      }
    end

    private

    def session_params
      params.require(:transaction_session).permit(
        :transaction_type,
        data: {}
      )
    end

    def verify_api_key
      # Implement your API key verification
      # For now, allowing all requests in development
      # TODO: Add proper API key verification for production
      return if Rails.env.development?

      api_key = request.headers["X-API-Key"]
      head :unauthorized unless valid_api_key?(api_key)
    end

    def valid_api_key?(key)
      # TODO: Implement proper API key validation
      # Example: key.present? && key == ENV['API_KEY']
      false
    end
  end
end
