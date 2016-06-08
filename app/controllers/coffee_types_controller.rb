class CoffeeTypesController < ApplicationController

  before_action :set_coffee_type, only: [:edit, :show, :update, :destroy]
  def index
    @coffee_types = CoffeeType.order(name: :asc)
  end

  def show
  end

  def new
    @coffee_type_form = CoffeeTypesForm.new
  end

  def edit
    @coffee_type_form = CoffeeTypesForms.populate_edit_form(@coffee_type)
  end

  def create
    @coffee_type_form = CoffeeTypesForm.new(coffee_type_params)
    if @coffee_type_form.save_form(params[:coffee_type_form])
      redirect_to coffee_types_path, notice: "New Coffee Type created"
    else
      render :new
    end
  end

  private

  def set_coffee_type
    @coffee_type = CoffeeType.find(params[:id])
  end

  def coffee_type_params
    params.require(:coffee_type).permit(:id, :name, :recipe)
  end

end
