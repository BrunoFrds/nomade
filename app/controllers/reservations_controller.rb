class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index] # S'assure que l'utilisateur est authentifié pour accéder à l'index
  before_action :set_reservation, only: [:destroy] # Callback pour définir la réservation avant certaines actions

  # GET /reservations
  def index
    @reservations = Reservation.all.order(:date, :time)
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      cookies.permanent[:reservation_token] = @reservation.token
      redirect_to root_path
    else
      # Variables pour rendre la home
      @dishes = Dish.all
      @dish = Dish.new
      @user_reservation = nil
      flash.now[:alert] = "❌ Une erreur est survenue, veuillez réessayer."
      render "pages/home", status: :unprocessable_entity
    end
  end

  # DELETE /reservations/:id
  def destroy
    @reservation.destroy
    cookies.delete(:reservation_token) unless user_signed_in?
    redirect_to user_signed_in? ? reservations_path : root_path,
                notice: user_signed_in? ? "La réservation a été supprimée." : "Votre réservation a été annulée."
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :time, :people, :first_name, :last_name, :email, :phone)
  end

  def set_reservation
    @reservation = Reservation.find_by(token: params[:token])
    redirect_to root_path, alert: "Réservation introuvable" unless @reservation
  end
end
