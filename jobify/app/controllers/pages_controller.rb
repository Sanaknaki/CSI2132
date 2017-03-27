# personal website controller
class PagesController < ApplicationController
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
