class CreateBloodSugarLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :blood_sugar_levels do |t|
      t.datetime :checked_at
      t.decimal  :blood_sugar
      t.string   :reference_method
      t.boolean  :fasting
      t.boolean  :before_meal
      t.boolean  :after_meal
      t.boolean  :logbook
      t.boolean  :deleted
      t.boolean  :control
      t.boolean  :manual
      t.decimal  :a1c_percentage
      t.decimal  :a1c_measurement
      t.integer  :insulin
      t.string   :insulin_type
      t.integer  :carb_grams
      t.integer  :carb_points
      t.string   :carb_choices
      t.string   :comment
      t.timestamps
    end
  end
end
