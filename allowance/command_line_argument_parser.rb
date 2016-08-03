# coding: utf-8
require 'getoptlong'

class CommandLineArgumentParser
  ENV_ALLWANCE = '环保'
  DRI_BENEFITS = '司机'
  REMOTE_ALLOWANCE = '艰苦边远'
  NIGHT_ALLOWANCE = '夜餐'

  attr_reader :allowance_type

  def initialize
    unless ARGV.length >= 1
      display_usage
      exit
    end

    @opts = GetoptLong.new(
      ["--allowance-type", "-a", GetoptLong::REQUIRED_ARGUMENT]
    )

    @allowance_type = ""
  end

  def display_usage
    p '使用方法:'
    p '1. 请将所有需要汇总的文件放入本文件夹'
    p '2. 使用参数 "-a 环保/司机/艰苦边远/夜餐" 确定汇总津贴类型 '

  end

  def parse_arguments
#    p @opts
    @opts.each do |opt, arg|
      case opt
      when '--allowance-type'
        ensure_allowance_type_correct(arg)
      end
    end
    self
  end

  def ensure_allowance_type_correct(value)
    if value != ENV_ALLWANCE && value != DRI_BENEFITS && value != REMOTE_ALLOWANCE && value != NIGHT_ALLOWANCE
      p "错误津贴名称"
    else
      @allowance_type = value
    end
  end
end
