class CreateRegionalDirectorates < ActiveRecord::Migration
  def change
    create_table :regional_directorates do |t|
      t.string :code
      t.string :name
      t.string :city
      t.string :zone
      t.string :district

      t.timestamps
    end
  end
end
