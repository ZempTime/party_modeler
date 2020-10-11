# Party Modeler

This is an exploratory application intended to explore one specific area: how blend the often-duplicated logic and storage which emerges when representing individuals & organizations.

## Data Model

Maybe a pretty visual later. There are two key ideas here:
* A 'Party' is a human concept which provides a blended way of referring to "a single person" or "a group of persons." This is a higher-scale idea than either people or organizations (both of which can "belong to" a party), and allows us to consolidate logic which is often duplicated between orgs & individuals.
* A 'relationship' is different than a 'role.' There could be multiple kinds of relationships between two parties. For example, someone might _both_ be a customer of an organization, as well as an employee. In this respect, relationship answers "what is it" and role answers the question "what does it do."

**Areas to be explored later:*
* Approvals (aka friend requests)
* Adding `persons` table, and `organizations` table, then pointing these at `parties`

Here's a semantic walkthrough of the [tables](https://github.com/ZempTime/party_modeler/blob/main/db/schema.rb):

**Party** - a person or organization.
- id
- name
- has_many :party_roles
- has_many :party_relationships, through: :party_roles

**Party Relationship**
- has_one from_role
- has_one to_role
- belongs_to :party_relationship_tpye
- thru_date

**Party Role**
- belongs_to :role_type
- belongs_to :party

**Party Relationship Type** - specifies categorizations and meaning for a configuration of other relationships. Ex: employment, family friend, family member, etc
- valid_from_role
- valid_to_role
- name
- description

**Role Type** (wondering if this shouldn't just be an `enum` on another table...)
- description
