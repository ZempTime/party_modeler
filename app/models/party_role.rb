class PartyRole < ApplicationRecord
  belongs_to :party
  belongs_to :role_type
end
