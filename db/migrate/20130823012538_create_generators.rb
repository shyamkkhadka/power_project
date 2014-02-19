class CreateGenerators < ActiveRecord::Migration
  def change
    create_table :generators do |t|
      t.string :company_name
      t.string :model_no
      t.string :type
      t.string :sound_level
      t.string :engine_manufacturer
      t.string :engine_model_no
      t.string :cooling_type
      t.string :alternator_manufacturer
      t.string :alternator_model_no
      t.string :engine_oil_type
      t.string :oil_sumo_capacity
      t.string :fuel_filter
      t.string :sec_fuel_filter
      t.string :air_filter
      t.string :water_filter
      t.integer :genset_length
      t.integer :genset_height
      t.integer :genset_weight
      t.string :starter_battery_capacity
      t.integer :control_panel_length
      t.integer :control_panel_width
      t.integer :control_panel_height
      t.string :engine_serial_no
      t.string :alternator_serial_no
      t.string :eqp_code
      t.integer :system_type_id
      t.integer :station_id
      t.string :installation_team
      t.date :first_installation_date

      t.timestamps
    end
  end
end
