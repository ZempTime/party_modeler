class PartyRelationship < ApplicationRecord
  belongs_to :party_relationship_type
  belongs_to :from_role, foreign_key: :from_role_id, class_name: "PartyRole"
  belongs_to :to_role, foreign_key: :to_role_id, class_name: "PartyRole"
  has_one :from_party, through: :from_role, source: :party
  has_one :to_party, through: :to_role, source: :party

  def summary
    "#{party_relationship_type.name} between \
#{from_party.name} (#{from_role.role_type.description}) and \
#{to_party.name} (#{to_role.role_type.description})"
  end
end
