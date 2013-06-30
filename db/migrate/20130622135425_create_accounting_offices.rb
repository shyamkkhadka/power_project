class CreateAccountingOffices < ActiveRecord::Migration
  def change
    create_table :accounting_offices do |t|
      t.string :name
      t.integer :regional_directorate_id

      t.timestamps
    end
  end
end
