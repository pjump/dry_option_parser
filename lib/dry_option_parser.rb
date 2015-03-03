# -*- coding: utf-8 -*-

require "dry_option_parser/version"

require 'optparse'
require 'delegate'


module DryOptionParser
  class DryOptionParser < SimpleDelegator

    attr_accessor :options

    def initialize(options={},&blk)
      @options = options
      super(OptionParser.new)
      instance_eval(&blk)
    end

    def assign(*args)
      attribute = args.shift
      on(*args) {|val| @options[attribute.to_sym]=val}
    end

  end  # class OptparseExample
end
