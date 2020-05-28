require 'mini_magick'
require 'open3'
require 'rtesseract'
require 'tempfile'

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
      processed_img_path = grayscale(image_path)
      negate(processed_img_path)
      extract_text(processed_img_path)
    end

    private

    def grayscale(path)
      image = MiniMagick::Image.open(path)
      image.colorspace('Gray')
      processed_image_path = Tempfile.new('foo').path
      image.write(processed_image_path)
      processed_image_path
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
      RTesseract.new(path).to_s.downcase.split.join(' ')
    end
  end
end


