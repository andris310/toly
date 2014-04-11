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

  def sitemap
    path = Rails.root.join("public", "sitemaps", current_site.key, "sitemap.xml")
    if File.exists?(path)
      render xml: open(path).read
    else
      render text: "Sitemap not found.", status: :not_found
    end
  end

  def robots
    robots = File.read(Rails.root + "config/robots.#{Rails.env}.txt")
    render :text => robots, :layout => false, :content_type => "text/plain"
  end

end
