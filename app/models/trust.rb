class Trust < Entity
  has_many :trust_roles, dependent: :destroy, foreign_key: :trust_id
  has_many :members, through: :trust_roles, source: :individual
end
