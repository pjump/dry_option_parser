# -*- coding: utf-8 -*-

require "dry_option_parser/version"

require 'optparse'
require 'delegate'


module DryOptionParser
  class DryOptionParser < SimpleDelegator

    def initialize(options={},&blk)
      @options = options
      super(OptionParser.new)
      instance_eval &blk
    end

    def assign(*args)
      attribute = args.shift
      on(*args) {|val| @options[attribute]=val}
    end

    attr_accessor :options
    #
  end  # class OptparseExample

  def cli_options(options={},&blk)
    DryOptionParser.new(options,&blk)
  end
end
