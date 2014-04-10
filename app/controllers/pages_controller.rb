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

  def robots
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

end
