class RecipesController < ApplicationController
    before_action :find_set, only: [:edit,:update,:destroy,:show]
   def index
       @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
   end
   def show
      
   end
   
   def new
      @recipe = Recipe.new
   end
   
   def create
      @recipe = Recipe.new(set_params)
      
      if @recipe.save
         flash[:success] = "Recipe was successfully created"
         redirect_to recipes_path
      else
         render "new"
      end
      
   end
   
   
   def edit
   end
   
   def update
      if @recipe.update(set_params)
         flash[:success] = "Recipe was successfully updated"
         redirect_to recipes_path
      else
         render "edit"
      end
   end
   
   def destroy
      @recipe.destroy
      redirect_to recipes_path
      flash[:danger]= 'Recipe was successfully deleted.'
   end
   
   def like
      
      @recipe = Recipe.find(params[:id])
      like = Like.create(like: params[:like],chef: Chef.first,recipe: @recipe)
      if like.valid?
         flash[:success] = "Your selections successfully"
         redirect_to :back
      else
         flash[:danger] = "You can only like/dislike a recipe once"
         redirect_to :back
      end
      
   end
   
   
   
   
   
   private
  
   
   def set_params
       params.require(:recipe).permit(:name,:summary,:description,:picture)
   end
   
   def find_set
      @recipe = Recipe.find(params[:id])
   end
end