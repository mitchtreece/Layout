Pod::Spec.new do |s|
  
  s.name             = 'Layout-Swift'
  s.module_name      = 'Layout'
  s.version          = '1.0.0'
  s.summary          = 'Swift Autolayout DSL for iOS & macOS'
  s.description      = <<-DESC
  Swift Autolayout DSL for iOS & macOS.
  DESC

  s.homepage         = 'https://github.com/mitchtreece/Layout'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mitch Treece' => 'mitchtreece@me.com' }
  s.source           = { :git => 'https://github.com/mitchtreece/Layout.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|

    core.source_files = 'Layout/Classes/Core/**/*'
    
  end

  s.subspec 'Shorthand' do |sh|

    sh.dependency       'Layout-Swift/Core'
    sh.source_files     = 'Layout/Classes/Shorthand/**/*'

  end

  s.subspec 'All' do |all|

    all.dependency      'Layout-Swift/Core'
    all.dependency      'Layout-Swift/Shorthand'

  end
  
end
