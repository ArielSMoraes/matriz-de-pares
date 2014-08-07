class MatrixController < ApplicationController

	def index
		@matrix = Matrix.new
	end

end