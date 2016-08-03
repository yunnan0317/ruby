# coding: utf-8
require './spider'
require './command_line_argument_parser'
require './url_store'

# 解析参数
argument_parser = CommandLineArgumentParser.new
argument_parser.parse_arguments
spider = Spider.new
url_store = UrlStore.new(argument_parser.url_file)

if argument_parser.crawl_type == CommandLineArgumentParser::WEB_CRAWLER
  spider.crawl_web(
    url_store.get_urls,
    argument_parser.crawl_depth,
    argument_parser.page_limit
  )
else
  spider.crawl_domain(
    url_store.get_url,
    argument_parser.page_limit
  )
end
