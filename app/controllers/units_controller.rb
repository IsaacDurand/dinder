class UnitsController < ApplicationController
  def index
    @units = Unit.a_to_z
  end

  def create
    @unit = Unit.new(unit_params)
    if @unit.save
      flash[:notice] = "New unit (#{@unit.name}) successfully created"
    else
      flash[:warning] = "Could not create new unit called #{@unit.name}. #{@unit.errors.full_messages.join('. ')}."
    end
    redirect_to units_url
  end

private
  def unit_params
    params.require(:unit).permit(:name)
  end
end
