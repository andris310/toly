base_url = "http://www.treeoflifespinetherapy.com/"
xml.instruct! :xml, :version=>'1.0'
xml.tag! 'urlset', 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  @static_pages.each do |page|
    xml.url {
      xml.loc("http://www.treeoflifespinetherapy.com/#{page}")
      xml.changefreq("weekly")
      xml.priority(0.5)
    }
    <% binding.pry %>
  end
end