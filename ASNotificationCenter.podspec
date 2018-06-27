
Pod::Spec.new do |s|
  s.name             = 'ASNotificationCenter'
  s.version          = '1.0.1'
  s.summary          = 'Safe NotificationCenter for Application'

  s.description      = <<-DESC
Manage custom notification for application, thread safe notification, app secure notification
                       DESC

  s.homepage         = 'https://github.com/vkrotin/ASNotificationCenter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Aleksey Anisimov' => 'vkrotin.ios@gmail.com' }
  s.source           = { :git => 'https://github.com/vkrotin/ASNotificationCenter.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'core/*.{h,m}'
  s.frameworks = 'Foundation'

end
