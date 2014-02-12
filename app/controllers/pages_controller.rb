class PagesController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def home
    @slides = Slide.all
  end

  def contact

  end

  def spine_therapy

  end

  def real_stories

  end

end
