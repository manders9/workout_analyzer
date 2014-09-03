class Workout
	def initialize(id, workout_data)
		@id = id
		@date = workout_data[:date]
		@exercises = workout_data[:exercises]
	end

	def id
		@id
	end

	def date
		@date
	end

	def type
		if exercise_percentage("cardio") >= 0.50
			"cardio"
		elsif exercise_percentage("strength") >= 0.50
			"strength" 
		else
			"other"
		end
	end

	def duration
		total = 0.0

		@exercises.each do |exercise|
			total += exercise[:duration_in_min]
		end

		total
	end

	def calories_burned
		calories = 0.0

		@exercises.each do |exercise|
			if exercise[:category] == "cardio"
				if exercise[:intensity] == "high"
					calories += (exercise[:duration_in_min] * 10.0)
				elsif exercise[:intensity] == "medium"
					calories += (exercise[:duration_in_min] * 8.0)
				elsif exercise[:intensity] == "low"
					calories += (exercise[:duration_in_min] * 5.0)
				end
			else
				calories += exercise[:duration_in_min] * 6.0
			end
		end

		calories
	end

	private

	def exercise_percentage(exercise_type)
		exercise_count = 0

		@exercises.each do |exercise|
			if exercise[:category] == exercise_type
				exercise_count += 1
			end
		end

		exercise_count.to_f / @exercises.length
	end
end
