class MatrixController < ApplicationController

	def index
		@persons = Person.all
	end

end