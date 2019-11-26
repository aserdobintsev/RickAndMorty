platform :ios, '13.0'

inhibit_all_warnings!

def utils
    pod 'SwiftLint', '~> 0.30.1'
end

def common_pods
    utils
end

target 'RickAndMorty' do
    use_frameworks!
    common_pods
end

target 'RickAndMortyAPI' do
    use_frameworks!
    pod 'Alamofire', '~> 4.9'
end