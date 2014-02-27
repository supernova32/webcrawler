require 'webcrawler/version'
require 'anemone'

module Webcrawler
  class Spider
    def initialize(url)
      @url = url
    end

    def run
      Anemone.crawl(@url) do |anemone|
        anemone.on_every_page do |page|
          css = page.doc.css('link')
          css.each do |c|
            p css.attributes['href'].value
          end
        end
      end
    end

  end

end

