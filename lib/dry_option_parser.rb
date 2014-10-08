#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'optparse'
require 'delegate'

module DryOptionParser
  class DryOptionParser < SimpleDelegator

    private 
    def assign(*args)
      attribute = args.shift
      on(*args) {|val| @options[attribute]=val}
    end

    public
    attr_accessor :options
    def initialize(options={},&blk)
      super(OptionParser.new)
      instance_eval &blk
      @options = options
    end
    #
  end  # class OptparseExample

  def cli_options(options={},&blk)
    DryOptionParser.new(options,&blk)
  end
end
