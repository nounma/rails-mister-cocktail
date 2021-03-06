class DosesController < ApplicationController
      before_action :set_cocktail, only: [:create, :new, :show, :edit, :update]

  def index
    @doses = Dose.all
  end

  def show
    # @dose = Dose.find(params[:id])

  end

  def new
    @dose = Dose.new
    @ingredient = Ingredient.new
    @dose.ingredient = @ingredient
  end

  def create
    # create new ingredient
    @dose = @cocktail.doses.build(dose_params)
    # link dose with ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])

    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      # params == { dose: {description: "blql", ingredient: {name: "hello"} }

      params.require(:dose).permit(:description, ingredient_attributes: [:id, :name] )
    end
end
