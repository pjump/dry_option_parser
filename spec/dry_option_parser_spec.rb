#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
require 'dry_option_parser'

module DryOptionParser
  describe DryOptionParser do
    subject do
      DryOptionParser.new({}) do
      end
    end
    it { should_not be_nil }
    it "should respond to all OptionParser's public methods" do
      OptionParser.new.public_methods.each do |pubmeth|
        should respond_to(pubmeth) 
      end
    end
    it {should respond_to(:options) }
    it {should respond_to(:assign) }
  end
end
