require 'application_controller'
require 'movie'
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    id = params[:id] # retrieve movie ID from URI
    @movie = Movie.find(id) #lookup movie by unique ID
    #will render app/views/movies/show.html.haml by default
  end
  def new
    #default: render 'new' template
	@movie = Movie.create!(params[:movie])
	flash[:notice] = "#{movie.title} was successfully created."
	redirect_to movies_path
  end
end
