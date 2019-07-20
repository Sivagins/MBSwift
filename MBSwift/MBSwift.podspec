Pod::Spec.new do |spec|

  spec.name         = "MBSwift"
  spec.version      = "0.0.1"
  spec.summary      = "Mbicycle development company pod"
  spec.description  = "Using for adding some extensions such as binding"
  spec.homepage     = "https://github.com/Sivagins/MBSwift"
  spec.license      = "MIT"
  spec.author       = { "Siarhei Sivahin" => "sivagins@gmail.com" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :git => "https://github.com/Sivagins/MBSwift.git", :tag => "#{spec.version}" }
  spec.source_files = "MBSwift", "MBSwift/**/*.{h,m}"
end
