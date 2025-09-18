class ReservationsController < ApplicationController
  before_action :set_reservation # Callback pour définir la réservation avant certaines actions
  before_action :authenticate_user!, only: [:index] # S'assure que l'utilisateur est authentifié pour accéder à l'index

  # GET /reservations
  def index
    @reservations = Reservation.all.order(:date, :time)
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "✅ Votre réservation a été enregistrée !"
      cookies.permanent[:reservation_token] = @reservation.token
      redirect_to root_path
    else
      # On initialise les variables nécessaires pour la home
      @dishes = Dish.all
      @dish = Dish.new
      if cookies[:reservation_token].present?
        @user_reservation = Reservation.find_by(token: cookies[:reservation_token])
      end

      flash.now[:alert] = "❌ Une erreur est survenue, veuillez réessayer."
      render "pages/home", status: :unprocessable_entity
    end
  end

  # DELETE /reservations/:id
  def destroy
    @reservation.destroy
    cookies.delete(:reservation_token) unless user_signed_in?
    if user_signed_in?
      redirect_to reservations_path, notice: 'La réservation a été supprimée.'
    else
      redirect_to root_path, notice: 'Votre réservation a été annulée.'
    end
  end

  private

  # Strong parameters pour reservation
  def reservation_params
    params.require(:reservation).permit(:date, :time, :people, :first_name, :last_name, :email, :phone)
  end

  # Callback pour définir la réservation avant certaines actions
  def set_reservation
    if user_signed_in?
      @reservation = Reservation.find_by(id: params[:id]) || Reservation.find_by(token: params[:token])
    else
      @reservation = Reservation.find_by(token: params[:token])
    end
  end
end
