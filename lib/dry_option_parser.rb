# -*- coding: utf-8 -*-

require "dry_option_parser/version"

require 'optparse'
require 'delegate'


module DryOptionParser
  class DryOptionParser < SimpleDelegator

    def initialize(options={},&blk)
      super(OptionParser.new)
      instance_eval &blk
      @options = options
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
