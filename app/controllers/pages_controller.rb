class PagesController < ApplicationController
  def home
    @dishes = Dish.all # on récupére tous les plats
    @dish = Dish.new # on initialise un nouveau plat pour le formulaire
  end
end
