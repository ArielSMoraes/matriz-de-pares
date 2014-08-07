class Matrix < ActiveRecord::Base

	def initialize
		@persons = Person.all
		@reversed_persons_matrix = Person.all.order(name: :desc)
		@reversed_persons_matrix.pop

		@persons_for_matrix = Person.all.order(name: :asc)
		@persons_for_matrix.pop
	end

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

	def reversed_persons_matrix
		@reversed_persons_matrix
	end

	def persons_for_matrix
		@persons_for_matrix
	end

	def persons
		@persons
	end

end