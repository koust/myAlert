Pod::Spec.new do |s|
s.name         = "myAlert"
s.version      = "1.0.0"
s.summary      = "MyAlert is an alertview. Shortly , show notifications in the app. It is simple to use and easy to develop."
s.license      = { :type => 'MIT License', :file => 'LICENSE' }
s.homepage     = "https://github.com/koust/myAlert"
s.screenshots  = "https://github.com/koust/myAlert/raw/master/gorsel.gif"
s.author       = { "koust" => "https://github.com/koust" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/koust/myAlert.git", :tag => s.version }
s.source_files  = "myAlert/MyAlertController.swift"
s.requires_arc = true
end
