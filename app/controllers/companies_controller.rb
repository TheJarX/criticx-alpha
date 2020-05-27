class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.create!(company_params)
    render :new unless @company
    redirect_to company_path(@company)
  end

  def show
    render plain: "Company doesn't exists!", status: 400 unless Company.exists?(params[:id])
    @company = Company.find(params[:id])
    render :show
  end

  private
  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country)
  end
end
