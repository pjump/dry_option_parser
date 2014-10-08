DRY OPTION PARSER
=================

*Makes OptionParser less verbose.*

Instead of

```ruby
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

p options
p ARGV
```

do

```ruby
require 'dry_option_parser'
include DryOptionParser

opt_parser = DryOptionParsers.new({}) do
  self.banner = "Usage: example.rb [options]"
  assign(:verbose,"-v", "--[no-]verbose", "Run verbosely") 
end.parse!

p opt_parses.options
p ARGV
```

Basically, an `DryOptionParser` manages an `OptionParser` instance to which it delegates all instance method calls. Additionally it manages its own `options` object accessible via `:options` accessor methods.
(A total of 2 instance variables). Block arguments to new are `instance_eval`ed within the new `DryOptionParser` instance. `DryOptionParsers` also provides the `assign` private method, which simplifies option specs that simply do:
      
```ruby
opts.on(...) do |value|
  options[:attribute] = value
end
```

allowing you to replace them with:

```ruby
assign(:attribute,...) 
```

Otherwise, all `OptionParser` documentation applies.

**Note:**
  By including `DryOptionParser` you also get the `cli_options` helper method which simplifies calling `DryOptionParser.new() {}`


