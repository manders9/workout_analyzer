class Workout
	def initialize(id, workout_data)
		@id = id
		@date = workout_data[:date]
		@exercises = workout_data[:exercises]
		binding.pry
	end

	def id
		@id
	end

	def date
		@date
	end

	def type
		if cardio_exercise_percentage >= 0.50
			"cardio"
		elsif 
			"strength" strength_exercise_percentage >= 0.50
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
			else
				calories += (exercise[:duration_in_min] * 6.0)
			end
		calories
	end

	private

	def cardio_exercise_percentage
		cardio_exercises = 0

		@exercises.each do |exercise|
			if exercise[:category] == "cardio"
				cardio_exercises += 1
			end

			cardio_exercises.to_f / @exercises.length
	end

	def strength_exercise_percentage
		strength_exercise = 0

		@exercises.each do |exercise|
			if exercise[:category] == "strength"
				strength_exercises += 1
			end

			strength_exercises.to_f / @exercises.length
	end

end