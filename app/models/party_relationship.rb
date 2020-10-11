class PartyRelationship < ApplicationRecord
  belongs_to :from_role, class: "PartyRole"
  belongs_to :to_role, class: "PartyRole"
  has_one :from_party, through: :from_role
  has_one :to_party, through: :to_role
end
