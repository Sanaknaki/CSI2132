# personal website controller
class PagesController < ApplicationController
  layout 'index_layout', only: [:main]
  before_filter :authorize, only: [:home]
  def home
    @list_all_companies = Company.order(created_at: :desc)
    @recently_added_companies = Company.order(created_at: :desc).limit(5)
    @recently_added_companies = Company.all
    @best_ranked_company = Company.order(rating: :desc).limit(1)
    @worst_ranked_company = Company.order(:rating).limit(1)
    render('index')
  end

  def about
    render('about')
  end

  def tos
    render('tos')
  end

  def main
    render('main')
  end
end
