class HomeController < ApplicationController
	def create
		if Tag.find_by(name: params[:search])
			params[:@tags] = Tag.find_by(name: params[:search]) 
			params[:@taggings] = Tagging.find_by(tag_id: params[:@tags]).recipe_id
			@recipes = Recipe.find_by(id: params[:@taggings])
		end
	end

end
