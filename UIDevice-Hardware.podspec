Pod::Spec.new do |s|
  s.name         = 'UIDeviceHardware'
  s.version      = '0.1.5'
  s.license      = { :type => 'BSD' }
  s.platform     = :ios
  s.summary      = 'Category on UIDevice to distinguish between platforms and provide human-readable device names e.g. "iPad Mini 2G (Cellular)".'
  s.homepage     = 'https://github.com/monospacecollective/UIDevice-Hardware'
  s.authors      = { 'Erica Sadun' => 'erica@ericasadun.com', 'Eric Horacek' => 'eric@monospacecollective.com' }
  s.source       = { :git => 'https://github.com/hyperconnect/UIDevice-Hardware.git', :branch => 'hpcnt' }
  s.source_files = 'UIDeviceHardware.{h,m}'
  s.requires_arc = true
end
