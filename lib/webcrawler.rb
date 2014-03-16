require 'webcrawler/version'
require 'anemone'

module Webcrawler
  class Spider
    attr_accessor :total_js, :total_css
    def initialize(url)
      @url = url
      @total_css = []
      @total_js = []
    end

    def run
      Anemone.crawl(@url) do |anemone|
        anemone.on_every_page do |page|
          css = page.doc.css('link')
          css.each do |c|
            @total_css << c.attributes['href'].value unless c.attributes['href'].nil?
          end
          scripts = page.doc.css('script').select{ |s| !s.attributes['src'].nil? }
          scripts.each do |s|
            @total_js << s.attributes['src'].value
          end
        end
      end
    end

  end

end

