class DishesController < ApplicationController
  before_action :authenticate_user!

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to root_path, notice: 'Le plat a été créé.'
    else
      redirect_to root_path, alert: 'Erreur lors de la création du plat.'
    end
  end

  def update
    @dish = Dish.find(params[:id])
    if @dish.update(dish_params)
      redirect_to root_path, notice: 'Le plat a été mis à jour.'
    else
      redirect_to root_path, alert: 'Erreur lors de la mise à jour du plat.'
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to root_path, notice: 'Le plat a été supprimé.'
  end
  
  private

  def dish_params
    params.require(:dish).permit(:name, :category, :price, :description, :available)
  end
end
