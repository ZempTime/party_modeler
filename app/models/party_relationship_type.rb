class PartyRelationshipType < ApplicationRecord
  belongs_to :from_role, foreign_key: "from_role_id", class: "RoleType"
  belongs_to :to_role, foreign_key: "to_role_id", class: "RoleType"
end
