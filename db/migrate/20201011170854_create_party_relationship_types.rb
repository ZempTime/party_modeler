class CreatePartyRelationshipTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :party_relationship_types do |t|
      t.references :from_role, null: false, foreign_key: { to_table: :role_types }
      t.references :to_role, null: false, foreign_key: { to_table: :role_types }
      t.string :description
      t.string :name

      t.timestamps
    end
  end
end
