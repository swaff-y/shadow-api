class CleanupExpiredSessionsJob < ApplicationJob
  queue_as :default

  def perform
    # Delete all expired transaction sessions
    deleted_count = TransactionSession.expired.destroy_all.count
    Rails.logger.info "Cleaned up #{deleted_count} expired transaction sessions"
  end
end
