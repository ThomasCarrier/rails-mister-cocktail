class DosesController < ApplicationController
  def new
    @cocktail= Cocktail.find(params[:cocktail_id])
    @dose= Dose.new
    @ingredients = Ingredient.all
    10.times { @cocktail.doses.new }
  end

  def create
    @cocktail= Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    if @dose.valid?
      @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
  end

end
