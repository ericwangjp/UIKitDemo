# 依赖库文件仓库链接
source 'https://github.com/CocoaPods/Specs.git'
# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

# 要求生成的是framework而不是.a静态库
use_frameworks!
# 不显示所引用的库中的警告信息
inhibit_all_warnings!
# OC组件库Module化
use_modular_headers!

# 基础公共组件
def basePod
  # 拉取最新版本
  pod 'SnapKit'
  pod 'JXBanner'

  # 拉取指定版本
  pod 'Alamofire', '5.4.4'
  
  # 通过仓库的podspec引入
  pod 'developmentPod1', :git=>'https://github.com/author/developmentPod1.git',:branch=>'feature/0.0.1',:dev=>'..'
  # 使用本地库
  pod 'AFNetworking', :path => '~/Documents/AFNetworking'
  
  # 从外部podspec引入
  pod 'JSONKit', :podspec => 'https://example.com/JSONKit.podspec'

end


target 'UIKitDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for UIKitDemo
  pod 'SnapKit', '~> 5.7.0'


end
