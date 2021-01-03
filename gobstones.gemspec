lib = File.expand_path 'lib', __dir__
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'gobstones'
  spec.version = '0.0.4'
  spec.licenses = ['GPLv3']
  spec.authors = ['Nahuel Garbezza']
  spec.email = ['n.garbezza@gmail.com']
  spec.homepage = 'https://github.com/ngarbezza/gobstones-rb'
  spec.summary = 'Ruby implementation of the Gobstones programming language'
  spec.description = 'Ruby implementation of the Gobstones programming language'

  spec.required_ruby_version = '>= 2.7.2'
  spec.required_rubygems_version = '>= 2.7.6'

  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_dependency 'treetop', '~> 1.6'

  spec.files = `git ls-files`.split $INPUT_RECORD_SEPARATOR
  spec.test_files = spec.files.grep %r{^spec/}

  spec.executables = %w[gobstones]
  spec.require_paths = %w[lib]
end
