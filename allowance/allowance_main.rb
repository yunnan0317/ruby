# coding: utf-8
require './command_line_argument_parser.rb'
require 'roo'
require 'roo-xls'

argument_parser = CommandLineArgumentParser.new
argument_parser.parse_arguments
p argument_parser.allowance_type






def traverse_dir(file_path)
  xls_file_names = []
  xlsx_file_names = []
  if File.directory? file_path
    Dir.foreach(file_path) do |file|
      if file != "." and file != ".." and
        case File.extname(file).to_s
        when ".xls"
          xls_file_names << File.basename(file)
        when ".xlsx"
          xlsx_file_names << File.basename(file)
        end
      end
    end
  end
  return xls_file_names, xlsx_file_names
end

p file_names = traverse_dir('.')




def summarize(file_names, allowance_type)
  xlss = []
  xlsxs = []
  file_names[1].each do |f|
    xlsxs << Roo::Excelx.new("./#{f}")
  end

  file_names[0].each do |f|
    xlss << Roo::Excel.new("./#{f}")
  end
  return xlss, xlsxs
end


# input: object of Roo, one name of the title
# output: row of title
def find_row_of_title(xls, name)
  xls.each do |xls|
    xls.each_with_index do |x, index|
      if x.include?(name)
        return index
      end
    end
  end
end

summarize(file_names, argument_parser.allowance_type).each do |f|
  p find_row_of_title(f, "人员编码")
end
