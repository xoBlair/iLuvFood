class HomeController < ApplicationController
	def create
		@tag = Tag.find_by(name: params[:search])
		@result = @tag.recipes
	end
end
