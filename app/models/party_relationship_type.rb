class PartyRelationshipType < ApplicationRecord
  has_many :party_relationships
  belongs_to :valid_from_role, foreign_key: "valid_from_role_id", class_name: "RoleType"
  belongs_to :valid_to_role, foreign_key: "valid_to_role_id", class_name: "RoleType"
end
