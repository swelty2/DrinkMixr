class DrinksMixers < ApplicationController
    def create
        @drink = Drink.find(params[:drink_id])
        @mixer = @drink.drinks_mixers.create(drinks_mixers_params)
        redirect_to drink_path(@drink)
    end
    
        def destroy
        @drink = Drink.find(params[:drink_id])
        @drinks_mixers = @drink.drinks_mixers.find(params[:id])
        @drinks_mixers.destroy
        redirect_to article_path(@drink)
    end

    private
      def drinks_mixers_params
            params.require(:mixers).permit(:name, :unit)
      end
end
