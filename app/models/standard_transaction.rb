class StandardTransaction < Transaction
  belongs_to :partyable, polymorphic: true
end
