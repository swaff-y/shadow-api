class TrustRole < ApplicationRecord
  belongs_to :trust, class_name: "Trust", foreign_key: :trust_id
  belongs_to :individual, class_name: "Individual", foreign_key: :individual_id
end
