Pod::Spec.new do |s|
  s.name             = "RxBindNext"
  s.version          = "0.0.1"
  s.summary          = "-"
  s.homepage         = "https://github.com/taewan0530/RxBindNext"
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "taewan kim" => "taewan0530@daum.net" }
  s.source           = { :git => "https://github.com/taewan0530/RxBindNext.git",
                         :tag => s.version.to_s }
  s.source_files     = "Sources/*.swift"
  s.requires_arc     = true

  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"
  s.tvos.deployment_target = "9.0"
end