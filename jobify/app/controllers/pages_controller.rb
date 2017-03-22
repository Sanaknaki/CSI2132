# personal website controller
class PagesController < ApplicationController
  def home
    render('index')
  end
end
