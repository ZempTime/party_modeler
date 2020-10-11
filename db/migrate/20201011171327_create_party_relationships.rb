class CreatePartyRelationships < ActiveRecord::Migration[6.0]
  def change
    create_table :party_relationships do |t|
      t.references :from_role, null: false, foreign_key: { to_table: :party_roles }
      t.references :to_role, null: false, foreign_key: {to_table: :party_roles }
      t.date :thru_date

      t.timestamps
    end
  end
end
