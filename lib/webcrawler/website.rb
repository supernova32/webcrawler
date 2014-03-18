
module Webcrawler
  class Website
    attr_accessor :css, :js, :url

    def initialize(url)
      @url = url
      @css = []
      @js = []
    end
  end
end