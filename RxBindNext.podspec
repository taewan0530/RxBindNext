Pod::Spec.new do |s|
  s.name             = 'RxBindNext'
  s.version          = '0.0.1'
  s.summary          = 'weak bindNext.'
  s.homepage         = 'https://github.com/taewan0530/RxBindNext'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Taewan Kim' => 'taewan0530@daum.net' }
  s.source           = { :git => 'https://github.com/taewan0530/RxBindNext.git',
                         :tag => s.version.to_s }
  s.source_files     = 'Sources/**/*.{swift}'
  s.requires_arc     = true

  s.ios.deployment_target = '8.0'
end
