class MatrixController < ApplicationController

	def index
		@matrix = Matrix.first
	end

	def add_pair
		matrix = Matrix.new()
		matrix.paired_today(params["person"], params["pair"])

    redirect_to action: :index
	end

	def remove_pair
		matrix = Matrix.new()
		matrix.remove_pair(params["person"], params["pair"])

		redirect_to action: :index
	end

end