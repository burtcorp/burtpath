# BurtPath

A fork of [jmespath.rb](https://github.com/jmespath/jmespath.rb), which is an implementation of [JMESPath](https://github.com/boto/jmespath) for Ruby. This implementation supports searching JSON documents as well as native Ruby data structures.

This fork aims to be a drop in replacement for `jmespath.rb` and all uses of "burtpath" and "BurtPath" are just aliases for the equivalents in `jmespath.rb`. The interpreter has been completely rewritten to increase performance by orders of magnitude.

## Installation

```
$ gem install burtpath
```

## Basic Usage

Call `BurtPath.search` with a valid JMESPath search expression and data to search. It will return the extracted values.

```ruby
require 'burtpath'

BurtPath.search('foo.bar', { foo: { bar: { baz: "value" }}})
#=> {baz: "value"}
```

In addition to accessing nested values, you can exact values from arrays.

```ruby
BurtPath.search('foo.bar[0]', { foo: { bar: ["one", "two"] }})
#=> "one"

BurtPath.search('foo.bar[-1]', { foo: { bar: ["one", "two"] }})
#=> "two"

BurtPath.search('foo[*].name', {foo: [{name: "one"}, {name: "two"}]})
#=> ["one", "two"]
```

If you search for keys no present in the data, then `nil` is returned.

```ruby
BurtPath.search('foo.bar', { abc: "mno" })
#=> nil
```

**[See the JMESPath specification for a full list of supported search expressions.](http://jmespath.org/specification.html)**

## Indifferent Access

The examples above show JMESPath expressions used to search over hashes with symbolized keys. You can use search also for hashes with string keys or Struct objects.

```ruby
BurtPath.search('foo.bar', { "foo" => { "bar" => "value" }})
#=> "value"

data = Struct.new(:foo).new(
  Struct.new(:bar).new("value")
)
BurtPath.search('foo.bar', data)
#=> "value"
```

## JSON Documents

If you have JSON documents on disk, or IO objects that contain JSON documents, you can pass them as the data argument.

```ruby
BurtPath.search(expression, Pathname.new('/path/to/data.json'))

File.open('/path/to/data.json', 'r', encoding:'UTF-8') do |file|
  BurtPath.search(expression, file)
end
```

## Links of Interest

* [Release Notes](https://github.com/burtcorp/burtpath/releases)
* [License](http://www.apache.org/licenses/LICENSE-2.0)
* [JMESPath Tutorial](http://jmespath.org/tutorial.html)
* [JMESPath Specification](http://jmespath.org/specification.html)

## License

This library is distributed under the apache license, version 2.0

> Copyright 2014 Trevor Rowe; All rights reserved.
> Copyright 2015 Burt AB; All rights reserved.
>
> Licensed under the apache license, version 2.0 (the "license");
> You may not use this library except in compliance with the license.
> You may obtain a copy of the license at:
>
> http://www.apache.org/licenses/license-2.0
>
> Unless required by applicable law or agreed to in writing, software
> distributed under the license is distributed on an "as is" basis,
> without warranties or conditions of any kind, either express or
> implied.
>
> See the license for the specific language governing permissions and
> limitations under the license.
