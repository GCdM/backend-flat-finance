class Api::V1::HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :update, :destroy]

  def create
    @household = Household.new(household_params)

    if @household.save
      render json: @household
    else
      render json: @household.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @household
  end

  def update
    if @household.update(household_params)
      render json: @household
    else
      render json: @household.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @household.destroy
  end

  private

  def set_household
    @household = Household.find(params[:id])
  end

  def household_params
    params.require(:household).permit(:name)
  end
end