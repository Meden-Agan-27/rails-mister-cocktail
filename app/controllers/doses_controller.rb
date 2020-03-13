class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to @dose, notice: "dose created"
    else
      render :new
    end
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params['cocktail_id'])
  end

  def dose_params
    params.require(:doses).permit(:description, :ingredient_id)
  end
end
