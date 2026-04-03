class Director < ApplicationRecord
  belongs_to :ubo
  belongs_to :individual, class_name: "Individual", foreign_key: :individual_id
end
