require 'minitest'
require 'minitest/autorun'
# require 'minitest/unit'
require './command_line_argument_parser.rb'


# class TestCommandLineArgumentParser < MiniTest::Test

#   def setup
#     @test_argv = %w(-c web -d 3 -p 200 -f url1.txt)
#     ARGV.replace @test_argv
#     @com_line_args = CommandLineArgumentParser.new.parse_arguments
#   end

#   def test_get_the_right_args
#     assert_equal @test_argv[@test_argv.index("-c")+1], @com_line_args.crawl_type
#     assert_equal @test_argv[@test_argv.index("-d")+1], @com_line_args.crawl_depth.to_s
#     assert_equal @test_argv[@test_argv.index("-p")+1], @com_line_args.page_limit.to_s
#     assert_equal @test_argv[@test_argv.index("-f")+1], @com_line_args.url_file
#   end
# end


describe CommandLineArgumentParser do
  before do
    @test_argv = %w(-c web -d 3 -p 200 -f url1.txt)
    ARGV.replace @test_argv
    @com_line_args = CommandLineArgumentParser.new.parse_arguments
  end

  describe "when input crawl type" do
    it "should get crawl_type" do
      @com_line_args.crawl_type.must_equal @test_argv[@test_argv.index("-c")+1]
    end
  end
end
