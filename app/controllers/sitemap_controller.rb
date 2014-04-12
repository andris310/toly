class SitemapController < ApplicationController
  def index
    @static_pages = [root_url, '/spine-health-videos', '/spine-therapy', '/real-stories', '/contact', '/other-products']
    respond_to do |format|
      format.xml
    end
  end
end