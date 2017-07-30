class MoviesController < ApplicationController
	def index
		@movies = Movie.all
	end
	def show
		@movie = Movie.find(params[:id])
	end
	def edit
		@movie = Movie.find(params[:id])
	end
	def update
		@movie = Movie.find(params[:id])   # crucial! think if this obj. creation is necessary?
		#@movie = Movie.update(params[:movie])  # ActiveModel::ForbiddenAttributesError (hacker may fake)
		#@movie.update(params.require(:movie).permit!)  # updating all params
		#movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
		@movie.update(movie_params)
		#render {ENTER PATH name here..}  # check by running this...
		redirect_to @movie
	end
	def new
		@movie = Movie.new
	end
	def create
		#@movie = Movie.new(params[:movie]) #ActiveModel::ForbiddenAttributesError (mass assigning of hash vaules not allowed)
		#movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
		@movie = Movie.new(movie_params)
		@movie.save
		redirect_to @movie
	end
	def destroy
		@movie = Movie.find(params[:id])
		@movie.destroy
		redirect_to movies_url
	end
end

private

def movie_params
	movie_params = params.require(:movie).permit(:title, :description, :rating, :released_on, :total_gross)
end
