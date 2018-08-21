class Api::V1::HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :update, :destroy]

  def create
    @household = Household.new(household_params)

    if @household.save
      User.find(params[:user_id]).update(household_id: @household.id)
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

  def expenses
    @household = Household.find(params[:household_id])
    @expenses = @household.expenses

    render json: @expenses, each_serializer: ExpensesSerializer
  end

  def payments
    @household = Household.find(params[:household_id])
    @payments = @household.payments

    render json: @payments, each_serializer: PaymentsSerializer
  end

  private

  def set_household
    @household = Household.find(params[:id])
  end

  def household_params
    params.require(:household).permit(:name)
  end
end
