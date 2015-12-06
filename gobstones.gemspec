lib = File.expand_path '../lib/', __FILE__
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'gobstones'
  spec.version = '0.0.2'
  spec.licenses = ['GPLv3']
  spec.authors = ['Nahuel Garbezza']
  spec.email = ['n.garbezza@gmail.com']
  spec.homepage = 'http://nahuelgarbezza.com.ar/gobstones-rb/'
  spec.summary = %q{Ruby implementation of the Gobstones programming language}
  spec.description = %q{Ruby implementation of the Gobstones programming language}

  spec.required_ruby_version = '>= 2.2.3'
  spec.required_rubygems_version = '>= 1.3.6'

  spec.add_development_dependency 'rspec', '~> 3'

  spec.files = `git ls-files`.split $/
  spec.test_files = spec.files.grep %r{^spec/}

  spec.executables = %w(gobstones)
  spec.require_paths = %w(lib)
end
