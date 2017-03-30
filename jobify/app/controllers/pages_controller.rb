# personal website controller
class PagesController < ApplicationController
  layout 'index_layout', only: [:home]
  before_filter :authorize, only: [:home]
  def home
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
