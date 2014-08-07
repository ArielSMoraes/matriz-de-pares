class Matrix < ActiveRecord::Base

	def initialize
		@persons = Person.all
		@reversed_persons_matrix = Person.all.order(name: :desc)
		@reversed_persons_matrix.pop

		@persons_for_matrix = Person.all.order(name: :asc)
		@persons_for_matrix.pop
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