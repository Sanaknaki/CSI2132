# company controller
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render('index')
  end

  def fetch_company
    @company = Company.find(params[:id])
    render('company_details')
end
