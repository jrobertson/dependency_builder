Gem::Specification.new do |s|
  s.name = 'dependency_builder'
  s.version = '0.1.0'
  s.summary = 'Builds a dependency tree (inside out) from clusters of '+ \
      'dependencies (outside in) in a string format with indented ' + \
      '(2 spaces) branches.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/dependency_builder.rb']
  s.add_runtime_dependency('line-tree', '~> 0.6', '>=0.6.1')
  s.signing_key = '../privatekeys/dependency_builder.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/dependency_builder'
end
