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
end
