class PagesController < ApplicationController
  def home
    @dishes = Dish.all # on récupére tous les plats
    @dish = Dish.new # on initialise un nouveau plat pour le formulaire

    # Formulaire de réservation
    @reservation = Reservation.new
    # On prépare une nouvelle réservation pour le formulaire
    if cookies[:reservation_token].present?
      @user_reservation = Reservation.find_by(token: cookies[:reservation_token])
    end
  end
end
