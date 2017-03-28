# company controller
class CompaniesController < ApplicationController
  def index
    @companies = Company.all
    render('index')
  end
end
