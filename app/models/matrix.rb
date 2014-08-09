class Matrix < ActiveRecord::Base

	def paired_today person, pair
		person_db = Person.find(person)
		pair_db = Person.find(pair)

		person_db.paired_today_with(pair_db)
	end

	def remove_pair person, pair
		person_db = Person.find(person)
		pair_db = Person.find(pair)
				
		person_db.delete_last_day(pair_db)
	end

	def average person, pair
		days_paired = person.days_paired_with(pair)

		average = "regular"
		if days_paired < self.min
			average = "below"
		elsif days_paired > self.max
			average = "above"				
		end

		average
	end

	def reversed_persons_matrix
		@reversed_persons_matrix = Person.all.order(name: :desc)
		@reversed_persons_matrix.pop
		@reversed_persons_matrix
	end

	def persons_for_matrix
		@persons_for_matrix = Person.all.order(name: :asc)
		@persons_for_matrix.pop
		@persons_for_matrix
	end

	def persons
		Person.all
	end

end