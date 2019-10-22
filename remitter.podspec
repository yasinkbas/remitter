Pod::Spec.new do |s|
  s.name             = 'remitter'
  s.version          = '0.1.1'
  s.summary          = 'Maker rain emitter in a line code'

  s.description      = <<-DESC
'Remitter is an simple pod for creating rain, snow or something you like. it is really easy and you can create animation in a line, if you want to it you can easily configure remitter'
                       DESC

  s.homepage         = 'https://github.com/yasinkbas/remitter'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yasinkbas' => 'yasin.kbas12@gmail.com' }
  s.source           = { :git => 'https://github.com/yasinkbas/remitter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "11.0"
  }
end
