require 'mini_magick'
require 'open3'
require 'rtesseract'

module ImagePlay
  class Image
    attr_reader :image_path

    def self.extract(*args)
      new(*args).process
    end

    def initialize(input_path)
      @image_path = input_path
    end

    def process
      grayscale(image_path)
      negate(image_path)
      extract_text(image_path)
    end

    private

    def grayscale(path)
      image = MiniMagick::Image.new(path)
      image.colorspace('Gray')
      image.write(path)
    end

    def negate(path)
      MiniMagick::Tool::Magick.new do |img|
        img << path
        img.negate
        img.threshold("001%")
        img.negate
        img << path
      end
    end

    def extract_text(path)
      RTesseract.new(path).to_s.downcase.gsub(/[[:punct:]]/, ' ')
    end
  end
end


