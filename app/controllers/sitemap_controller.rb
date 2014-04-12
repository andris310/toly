class SitemapController < ApplicationController
  def index
    @static_pages = ['/', '/spine-health-videos', '/spine-therapy', '/real-stories', '/contact', '/other-products']
    respond_to do |format|
      format.xml
    end
  end
end