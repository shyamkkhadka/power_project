class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :supp_company_name
      t.string :supp_company_address
      t.string :supp_company_phone
      t.string :supp_company_fax
      t.text :supp_remarks
      t.string :curr_local_agent_name
      t.string :local_agent_contact_person
      t.integer :local_agent_mobile
      t.string :local_agent_office_phone
      t.string :local_agent_office_fax
      t.string :equipment_code

      t.timestamps
    end
  end
end
