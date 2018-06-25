Gem::Specification.new do |s|
  s.name          = 'braze_api'
  s.version       = '1.0.3'
  s.date          = '2018-06-07'
  s.summary       = 'Braze API Wrapper'
  s.description   = 'Simple API Wrapper for basic Braze API Functions'
  s.authors       = ['Jessica Burns']
  s.email         = 'jessburnsm@gmail.com'
  s.files         = ['lib/braze_api.rb', 'lib/braze/api.rb', 'lib/braze/email.rb', 'lib/braze/transactional_email.rb', 'lib/braze/users.rb', 'lib/braze/models/profile.rb']
  s.license       = 'MIT'
  s.add_dependency('httparty')
  s.add_dependency('rake')
  s.add_dependency('rspec')
end
