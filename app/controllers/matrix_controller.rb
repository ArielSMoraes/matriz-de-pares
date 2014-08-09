class MatrixController < ApplicationController

	def index
		@matrix = Matrix.first
	end

	def edit
		@matrix = Matrix.first
	end

	def update
		@matrix = Matrix.first
		@matrix.update(article_params)
		render "index"
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

	private
	  def article_params
	    params.require(:matrix).permit(:max, :min)
	  end

end