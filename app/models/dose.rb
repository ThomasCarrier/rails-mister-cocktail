class Dose < ActiveRecord::Base
  belongs_to :Cocktail
  belongs_to :Ingredient
end
