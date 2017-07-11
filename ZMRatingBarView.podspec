Pod::Spec.new do |s|
  s.name             = 'ZMRatingBarView'
  s.version          = '0.1.0'
  s.summary          = 'A simple Rating Bar library by Swift'
  s.homepage         = 'https://github.com/nanjingboy/ZMRatingBarView'
  s.license          = { :type => 'MIT' }
  s.author           = { 'Tom.Huang' => 'hzlhu.dargon@gmail.com' }
  s.source           = { :git => 'https://github.com/nanjingboy/ZMRatingBarView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.source_files = "Source/*.swift"
end