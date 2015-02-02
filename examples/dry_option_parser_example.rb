#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'dry_option_parser'
require 'ostruct'
require 'optparse/time'
include DryOptionParser

options = OpenStruct.new
options.library = []
options.inplace = false
options.encoding = "utf8"
options.transfer_type = :auto
options.verbose = false

opt_parser = cli_options(options)  do
  codes = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
  code_aliases = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

  self.banner = "Usage: example.rb [options]"

  separator ""
  separator "Specific options:"

  # Mandatory argument.
  on("-r", "--require LIBRARY",
         "Require the LIBRARY before executing your script") do |lib|
    options.library << lib
  end

  # Optional argument; multi-line description.
  on("-i", "--inplace [EXTENSION]",
     "Edit ARGV files in place",
     "  (make backup if EXTENSION supplied)") do |ext|
       options.inplace = true
       options.extension = ext || ''
       options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
     end

     # Cast 'delay' argument to a Float.
     assign("delay", "--delay N", Float, "Delay N seconds before executing")
     # Cast 'time' argument to a Time object.
     assign("time", "-t", "--time [TIME]", Time, "Begin execution at given time")

     # Cast to octal integer.
     assign("record_separator","-F", "--irs [OCTAL]", OptionParser::OctalInteger,
            "Specify record separator (default \\0)")

     # List of arguments.
     assign("list","--list x,y,z", Array, "Example 'list' of arguments")

     # Keyword completion.  We are specifying a specific set of arguments (codes
     # and code_aliases - notice the latter is a Hash), and the user may provide
     # the shortest unambiguous text.
     code_list = (code_aliases.keys + codes).join(',')
     assign("encoding","--code CODE", codes, code_aliases, "Select encoding",
            "  (#{code_list})")

     # Optional argument with keyword completion.
     on("--type [TYPE]", [:text, :binary, :auto],
        "Select transfer type (text, binary, auto)","transfer_type")

     # Boolean switch.
     on("-v", "--[no-]verbose", "Run verbosely", "verbose")

     separator ""
     separator "Common options:"

     # No argument, shows at tail.  This will print an options summary.
     # Try it and see!
     on_tail("-h", "--help", "Show this message") do
       puts options
       exit
     end

     # Another typical switch to print the version.
     on_tail("--version", "Show version") do
       puts ::Version.join('.')
       exit
     end
end

opt_parser.parse!(ARGV)
options = opt_parser.options
p options
p ARGV

