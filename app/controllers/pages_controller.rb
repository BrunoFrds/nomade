class PagesController < ApplicationController
  # GET /
  def home
    @dishes = Dish.all # on récupére tous les plats
  end
end
