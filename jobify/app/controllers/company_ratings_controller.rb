class CompanyRatingsController < ApplicationController

 def add_company_rating
   @company = Company.find(params[:id])
   @company_rating = @company.company_rating.create(
      :rating => params[:company_rating][:rating],
      :student_id => session[:user_id]
      )

   @company.rating = @company.company_rating.average(:rating)
   @company.company_rating.average(:rating)
   @company.save

     redirect_to @company
  end

 end
