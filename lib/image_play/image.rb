require 'mini_magick'
require 'open3'
require 'rtesseract'

module ImagePlay
  class Image
    def initialize(input_path)
      @input_path = input_path
    end

    def process
      image = MiniMagick::Image.new(@input_path)
      image.colorspace('Gray')
      image.write(@input_path)
      MiniMagick::Tool::Magick.new do |img|
        img << @input_path
        img.negate
        img.threshold("001%")
        img.negate
        img << @input_path
      end

      # text, _,  _ =
      # Open3.capture3("tesseract #{@input_path} stdout -l eng --oem 0 --psm 3")
      # text.strip


      text = RTesseract.new(@input_path)
      text.to_s.downcase.gsub(/[[:punct:]]/, ' ').split.join('-')
    end
  end
end


