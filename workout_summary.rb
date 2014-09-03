require_relative 'workout'
require 'csv'


# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end

  workouts
end

workouts = load_workout_data('workouts.csv')

workouts.each do |id, workout_data|
  workout = Workout.new(id, workout_data)

  puts "id: #{workout.id}"
  puts "date: #{workout.date}"
  puts "type: #{workout.type}"
  puts "duration: #{workout.duration}"
  puts "calories_burned: #{workout.calories_burned}"
end

