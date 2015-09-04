Gem::Specification.new do |spec|
  spec.name          = 'burtpath'
  spec.version       = File.read(File.expand_path('../VERSION', __FILE__)).strip
  spec.summary       = 'JMESPath - Optimized Ruby Edition'
  spec.description   = 'Implements JMESPath for Ruby'
  spec.authors       = ['Trevor Rowe', 'Burt Platform Team']
  spec.email         = ['trevorrowe@gmail.com']
  spec.homepage      = 'http://github.com/burtcorp/burtpath'
  spec.license       = 'Apache 2.0'
  spec.require_paths = ['lib']
  spec.files         = Dir['lib/**/*.rb'] + ['LICENSE.txt']
  spec.add_dependency('json', '~> 1.8')
end
