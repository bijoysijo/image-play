require_relative 'lib/image_play/version'

Gem::Specification.new do |spec|
  spec.name          = "image_play"
  spec.version       = ImagePlay::VERSION
  spec.authors       = ["Bijoy Sijo"]
  spec.email         = ["bijoysijo21@gmail.com"]

  spec.summary       = %q{gem to extract text from images}
  spec.description   = %q{uses rtesseract, mini-magick to extract text from images.}
  spec.requirements << 'you must have Imagemagick installed.'
  spec.homepage      = "https://github.com/bijoysijo/image-play"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bijoysijo/image-play"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "coveralls"
  spec.add_dependency "mini_magick"
  spec.add_dependency "rtesseract"
  spec.add_development_dependency "minitest"
end
