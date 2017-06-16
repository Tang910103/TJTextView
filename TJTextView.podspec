Pod::Spec.new do |s|
	s.platform     = :ios
	s.name		= "TJTextView" #项目名称
	s.version	= "1.0.0"  #项目版本
	s.summary	= "TJTextView 支持动态高度、最大高度、最小高度、最大长度限制"
	s.homepage	= "https://github.com/Tang910103/TJTextView"
	s.license	= "MIT"
	s.author	= { "TangJie" => "tang910103@qq.com" }
	s.source	= { :git => "https://github.com/Tang910103/TJTextView.git", :tag => s.version}
	s.source_files  = "TJTextView/TJTextView/TextView/*.{h,m}"  #源文件
	s.requires_arc = true #是否支持ARC
end