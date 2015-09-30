class TagsController < ApplicationController
	def show
  		@tag = Tag.find(user_params[:id])
	end

	def index 
		@tag = Tag.all
	end
end
