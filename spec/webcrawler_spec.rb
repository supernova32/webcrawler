require 'webcrawler'

describe Webcrawler do
  describe 'Spider' do
    before do
      @crawler = Webcrawler::Spider.new('https://freedomvpn.info')
      @crawler.run
    end
    it 'should count the number of css files' do
      @crawler.total_css.size.should eq 26
    end
    it 'should count the number of js files' do
      @crawler.total_js.size.should eq 13
    end
    it 'should fill children' do
      @crawler.children.size.should eq 14
    end
  end
end