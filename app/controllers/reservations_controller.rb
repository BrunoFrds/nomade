class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  # GET /reservations
  def index
    @reservations = Reservation.all.all.order(:date, :time)
  end

  # DELETE /reservations/:id
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: 'La réservation a été supprimée.'
  end

  # POST /reservations
  def create
    @reservation = Reservation.new(reservation_params) # on initialise une nouvelle réservation avec les paramètres autorisés
    if @reservation.save # on tente de sauvegarder la réservation
      flash[:notice] = "✅ Votre réservation a été enregistrée !" # message de succès
      redirect_to root_path # on redirige vers la page d'accueil
    else
      flash.now[:alert] = "❌ Une erreur est survenue, veuillez réessayer." # message d'erreur
      render "pages/home", status: :unprocessable_entity # on rend la vue de la page d'accueil
    end
  end

  private

  # Strong parameters pour reservation
  def reservation_params
    params.require(:reservation).permit(:date, :time, :people, :first_name, :last_name, :email, :phone)
  end
end
