class Business < Entity
  has_one :ubo, dependent: :destroy
  has_one :kyb, dependent: :destroy
end
