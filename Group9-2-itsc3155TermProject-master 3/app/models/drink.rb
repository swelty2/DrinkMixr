class Drink < ApplicationRecord
    has_many :drink_liquors, dependent: :destroy
    has_many :liquors, through: :drink_liquors
    has_many :drink_mixers, dependent: :destroy
    has_many :mixers, through: :drink_mixers
    
    enum flavor: { Frozen: 0, Fruity: 1, Hot: 2, Savory: 3, Sour: 4, Spicy: 5, Sweet: 6 }

    
    validates :name, presence: true, length: { minimum: 3 }
    validates :alcoholPerVolume, presence: true, numericality: { greater_than_or_equal_to: 0.00, less_than_or_equal_to: 100.00}
    
    def liquor_names
        DrinkLiquor.where(drink_id: self.id).collect {
            |dl| Liquor.find(dl.liquor_id).name
        }
    end
    
    def mixer_names
        DrinkMixer.where(drink_id: self.id).collect { 
            |dm| Mixer.find(dm.mixer_id).name
        }
    end
    
    def self.search(name, liquors, mixers, flavor)
        if name
            drink = Drink.find_by(name: name)
            if drink
                drinksScored = { drink => 9999 }
                search_match(liquors, mixers, flavor, drinksScored)
                
            else
                search_match(liquors, mixers, flavor)
            end
            
        else
            search_match(liquors, mixers, flavor)
        end
    end
    
    private
        def self.search_match(liquors, mixers, flavor, drinksScored=nil)
            if liquors then liquors = liquors[:Liquor_ids] else liquors = nil end
            if mixers then mixers = mixers[:Mixer_ids] else mixers = nil end
            
            if liquors or mixers or flavor
                if drinksScored then drinksScored = drinksScored else drinksScored = {} end
                    
                if not liquors.empty?
                    liquors[1..-1].each do |liquor|
                        add_result(DrinkLiquor.where(liquor_id: liquor), drinksScored)
                    end
                end
                
                if not mixers.empty?
                    mixers[1..-1].each do |mixer|
                        add_result(DrinkMixer.where(mixer_id: mixer), drinksScored)
                    end
                end
                
                if not flavor.empty?
                    drinks = Drink.where(flavor: flavor)
                    if not drinks.empty?
                        drinks.to_a.each do |drink|
                            if drinksScored[drink] 
                                drinksScored[drink] += 1 
                            else 
                                drinksScored[drink] = 1 
                            end
                        end
                    end
                end
                
                drinksScored.sort_by { |k, v| v }.collect(&:first).reverse
                
            elsif drinksScored
                drinksScored.keys[0]
                
            else
                Drink.all
                
            end
        end
        
        def self.add_result(ingreds, drinksScored)
            if not ingreds.empty?
                ingreds.to_a.each do |ingred|
                    drink = Drink.find(ingred.drink_id)
                    if drinksScored[drink] 
                        drinksScored[drink] += 1 
                    else 
                        drinksScored[drink] = 1 
                    end
                end
            end
        end
end
