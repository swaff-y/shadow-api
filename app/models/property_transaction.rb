class PropertyTransaction < Transaction
  has_one :seller, dependent: :destroy
  has_many :buyers, dependent: :destroy
end
