require "open3"
require "mini_magick"
require "rtesseract"

module ImagePlay
  class Image
    def initialize(input_path)
      @input_path = input_path
    end

    def read
      img = MiniMagick::Image.new(@input_path)
      img.path
      img.colorspace("Gray")
      img.write(@input_path)
    end

    def process
      MiniMagick::Tool::Magick.new do |magick|
        magick << @input_path
        magick.negate
        magick.threshold("007%")
        magick.negate
        magick << @input_path
      end
    end

    def text
      image = RTesseract.new(@input_path)
      image.to_s.downcase.gsub(/[[:punct:]]/, ' ').split.join('-') # Getting the value
    end
  end
end
