class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|

      t.string :name # to be replaced later by letting people/orgs point at this table
      t.timestamps
    end
  end
end
