require 'csv'

class BloodSugarLevel < ApplicationRecord

  def self.import_from_csv(file_path)
    CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
      checked_at = DateTime.strptime("#{row[:date]} #{row[:time]}", "%m/%d/%Y %H:%M:%S")
      bsl = BloodSugarLevel.create checked_at: checked_at,
                             blood_sugar: row[:blood_sugar],
                             reference_method: row[:reference_method],
                             fasting: row[:fasting],
                             before_meal: row[:before_meal],
                             after_meal: row[:after_meal],
                             logbook: row[:logbook],
                             deleted: row[:deleted],
                             control: row[:control],
                             manual: row[:manual],
                             a1c_percentage: row[:a1c_percentage],
                             a1c_measurement: row[:a1c_measurement],
                             insulin: row[:insulin],
                             insulin_type: row[:insulin_type],
                             carb_grams: row[:carb_grams],
                             carb_points: row[:carb_points],
                             carb_choices: row[:carb_choices],
                             comment: row[:comment]
      if bsl.valid?
        Rails.logger.debug "Created Blood Sugar Level record (#{bsl.id})"
      else
        Rails.logger.debug "Failed to create Blood Sugar Level record (#{row.checked_at})"
      end
    end
  end
end
