require 'webcrawler/version'
require 'webcrawler/website'
require 'anemone'

module Webcrawler
  class Spider
    attr_accessor :total_js, :total_css, :children
    def initialize(url)
      @url = url
      @total_css = []
      @total_js = []
      @children = []
    end

    def run
      Anemone.crawl(@url) do |anemone|
        anemone.on_every_page do |page|
          web = Webcrawler::Website.new page.url
          css = page.doc.css('link')
          css.each do |c|
            web.css << c.attributes['href'].value unless c.attributes['href'].nil?
            @total_css << c.attributes['href'].value unless c.attributes['href'].nil?
          end
          scripts = page.doc.css('script').select{ |s| !s.attributes['src'].nil? }
          scripts.each do |s|
            web.js << s.attributes['src'].value
            @total_js << s.attributes['src'].value
          end
          @children << web
        end
      end
      @children.each do |ch|
        p "Coming from #{ch.url}"
        p 'Has the following css:'
        ch.css.each do |css|
          p css
        end
        p 'And the following js:'
        ch.js.each do |js|
          p js
        end
      end
    end

  end

end

