class CreatePartyRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :party_roles do |t|
      t.references :party, null: false, foreign_key: true
      t.references :role_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
