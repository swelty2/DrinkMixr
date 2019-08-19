class DrinksLiquors < ApplicationController
    def create
        @drink = Drink.find(params[:drink_id])
        @drinks_liquors = @drink.drinks_liquors.create(drinks_liquors_params)
        redirect_to drink_path(@drink)
    end
    
        def destroy
        @drink = Drink.find(params[:drink_id])
        @drinks_liquors = @drink.drinks_liquors.find(params[:id])
        @drinks_liquors.destroy
        redirect_to article_path(@drink)
        end

    private
      def drinks_liquors_params
            params.require(:liquors).permit(:name, :unit)
      end
end