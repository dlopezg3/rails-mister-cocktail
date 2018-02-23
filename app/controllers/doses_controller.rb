
class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :create ]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    redirect_to @dose.cocktail
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

end
