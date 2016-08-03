require 'minitest'
require 'minitest/autorun'
require './spider.rb'

describe Spider do
  before do
    @test_spider = Spider.new
    @urls = ["http://www.ebay.com"]
    @depth = 2
    @page_limit = 50
  end

  # describe "call instance method crawl_web should reutrn" do
  #   it "should with a non nil next_urls" do
  #     p @test_spider.crawl_web(@urls, @depth, @page_limit)
  #   end
  # end

  describe "call instance method crawl_domain should reutrn" do
    it "should with a non nil next_urls" do
      p @test_spider.crawl_domain(@urls[0], @page_limit)
    end
  end
end
