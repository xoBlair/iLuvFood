module RecipesHelper
	def recipe_params
    	params.require(:recipe).permit(:title, :body, :tag_list)
  	end
end
