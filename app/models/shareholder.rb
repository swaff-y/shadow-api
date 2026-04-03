class Shareholder < ApplicationRecord
  belongs_to :ubo
  belongs_to :shareholdable, polymorphic: true
end
