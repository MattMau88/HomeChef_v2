class WeeklyIngredientListsController < ApplicationController
    def new
        @weeklyingredientlist = WeeklyIngredientList.new
        @ingredient = Ingredient.find(params[:ingredient_id])
    end
    
    def create
        @weeklyingredientlist = WeeklyIngredientList.new(weeklyingredient_params)
        @ingredient = Ingredient.find(params[:ingredient_id])
        @weeklyingredientlist.ingredient = @ingredient
    
        if @weeklyingredientlist.save
            redirect_to ingredient_path(@ingredient)
        else
            render :new
        end
    end
    
    def destroy
        @weeklyingredientlist = WeeklyIngredientList.find(params[:id])
        @weeklyingredientlist.destroy
        redirect_to root_path(@ingredient)
    end
    
    private
    
    def weeklyingredientlist_params
        params.require(:weeklyingredientlist).permit(:date, :published)
    end
      
end
