require 'minitest'
require 'minitest/autorun'
require './url_store.rb'


describe UrlStore do
  before do
    @url_store = UrlStore.new("urls.txt")
    p @url_store
  end

  describe "when input file name dan create a new UrlStore instace object" do
    it "should return a url array" do
      p @url_store
    end
  end

end
