class Individual < Entity
  has_one :voi, dependent: :destroy
  has_one :pep_status, dependent: :destroy
  has_one :kyc, dependent: :destroy

  has_many :trust_roles
  has_many :directorships, class_name: "Director", foreign_key: :individual_id
end
