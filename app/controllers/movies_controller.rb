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
  def create 
	  @movie = Movie.create!(params[:movie])
	  flash[:notice] = "#{@movie.title} was successfully created."
	  redirect_to movies_path
  end
  def edit
    @movie = Movie.find params[:id]
  end
  def update
    @movie =  Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end
