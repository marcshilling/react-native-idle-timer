require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name           = package['name']
  s.version        = package['version']
  s.summary        = package['description']
  s.description    = package['description']
  s.license        = package['license']
  s.author         = package['author']
  s.homepage       = package['repository']['url']
  s.source         = { :git => 'https://github.com/marcshilling/react-native-idle-timer.git', :tag => s.version }

  s.requires_arc   = true
  s.platforms      = { ios: '7.0', tvos: '9.0' }

  s.preserve_paths = 'README.md', 'package.json', 'index.js'
  s.source_files   = 'ios/RNIdleTimer/*.{h,m}'

  s.dependency 'React-Core'
end
