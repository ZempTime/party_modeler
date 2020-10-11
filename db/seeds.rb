# Rails-specific potential optimization ideas given a known/limited scope:
# condense `RoleType` to an enum on `PartyRole`, remove from or duplicate to `PartyRelationshipType`
# condense `PartyRelationshipType` to an enum on `PartyRelationship` with hardcoded validations

# A consideration: ordering from/to vs validation concerns

# Goals:
# - Individual/Individual
# - Ind/Group (Family, Friend, Professional)

# 12 people, 3 organizations, 1 of each type

def party(str)
  Party.where(name: str).first
end

# 15 parties total
(1..12).each do |num|
  Party.where(name: "Person#{num}").first_or_create!
end


Party.where(name: "Family").first_or_create!
Party.where(name: "Friend Group").first_or_create!
Party.where(name: "Professional Group").first_or_create!

# Role Types
member = RoleType.where(description: "member").first_or_create!
friend = RoleType.where(description: "friend").first_or_create!
admin = RoleType.where(description: "admin").first_or_create!
family = RoleType.where(description: "family").first_or_create!
crew = RoleType.where(description: "crew").first_or_create!
association = RoleType.where(description: "association").first_or_create!


# Party Relationship Types

family_member = PartyRelationshipType.where(
  name: "Family Member",
  description: "A member of a family",
  valid_from_role: family,
  valid_to_role: member,
).first_or_create!

family_friend = PartyRelationshipType.where(
  name: "Family Friend",
  description: "A friend of the family",
  valid_from_role: family,
  valid_to_role: friend,
).first_or_create!

crew_member = PartyRelationshipType.where(
  name: "Crew Member",
  description: "Part of an informal friend group",
  valid_from_role: crew,
  valid_to_role: member,
).first_or_create!

association_admin = PartyRelationshipType.where(
  name: "Association Admin",
  description: "Managing member of a professional organization",
  valid_from_role: association,
  valid_to_role: admin,
).first_or_create!

association_member = PartyRelationshipType.where(
  name: "Association Member",
  description: "A member of a professional organization",
  valid_from_role: association,
  valid_to_role: member,
).first_or_create!

friendship = PartyRelationshipType.where(
  name: "Friendship",
  description: "Relationship between two individuals",
  valid_from_role: friend,
  valid_to_role: friend,
).first_or_create!

# Friendship
PartyRelationship.where(
  party_relationship_type: friendship,
  from_role: PartyRole.where(party: party("Person1"), role_type: friend).first_or_create!,
  to_role: PartyRole.where(party: party("Person2"), role_type: friend).first_or_create!
).first_or_create!

# People 1,2,3 part of "Family"
PartyRelationship.where(
  party_relationship_type: family_member,
  from_role: PartyRole.where(party: party("Family"), role_type: family).first_or_create!,
  to_role: PartyRole.where(party: party("Person1"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: family_member,
  from_role: PartyRole.where(party: party("Family"), role_type: family).first_or_create!,
  to_role: PartyRole.where(party: party("Person2"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: family_member,
  from_role: PartyRole.where(party: party("Family"), role_type: family).first_or_create!,
  to_role: PartyRole.where(party: party("Person3"), role_type: member).first_or_create!
).first_or_create!

# People 4,5,6 are friends of family
PartyRelationship.where(
  party_relationship_type: family_friend,
  from_role: PartyRole.where(party: party("Family"), role_type: family).first_or_create!,
  to_role: PartyRole.where(party: party("Person4"), role_type: friend).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: family_friend,
  from_role: PartyRole.where(party: party("Family"), role_type: family).first_or_create!,
  to_role: PartyRole.where(party: party("Person5"), role_type: friend).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: family_friend,
  from_role: PartyRole.where(party: party("Family"), role_type: family).first_or_create!,
  to_role: PartyRole.where(party: party("Person6"), role_type: friend).first_or_create!
).first_or_create!

# People 7,8,9 are all part of the same "crew"
PartyRelationship.where(
  party_relationship_type: crew_member,
  from_role: PartyRole.where(party: party("Friend Group"), role_type: crew).first_or_create!,
  to_role: PartyRole.where(party: party("Person7"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: crew_member,
  from_role: PartyRole.where(party: party("Friend Group"), role_type: crew).first_or_create!,
  to_role: PartyRole.where(party: party("Person8"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: crew_member,
  from_role: PartyRole.where(party: party("Friend Group"), role_type: crew).first_or_create!,
  to_role: PartyRole.where(party: party("Person9"), role_type: member).first_or_create!
).first_or_create!

# People 10,11,12 all part of same "association", and 10 is admin
PartyRelationship.where(
  party_relationship_type: association_member,
  from_role: PartyRole.where(party: party("Professional Group"), role_type: association).first_or_create!,
  to_role: PartyRole.where(party: party("Person10"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: association_member,
  from_role: PartyRole.where(party: party("Professional Group"), role_type: association).first_or_create!,
  to_role: PartyRole.where(party: party("Person11"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: association_member,
  from_role: PartyRole.where(party: party("Professional Group"), role_type: association).first_or_create!,
  to_role: PartyRole.where(party: party("Person12"), role_type: member).first_or_create!
).first_or_create!
PartyRelationship.where(
  party_relationship_type: association_admin,
  from_role: PartyRole.where(party: party("Professional Group"), role_type: association).first_or_create!,
  to_role: PartyRole.where(party: party("Person10"), role_type: admin).first_or_create!
).first_or_create!

pp PartyRelationship.all.map(&:summary)