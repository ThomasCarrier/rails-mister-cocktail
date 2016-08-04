class DosesController < ApplicationController
  def new
    @cocktail= Cocktail.find(params[:cocktail_id])
    @dose= Dose.new
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
    @cocktail= Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
  end

end
