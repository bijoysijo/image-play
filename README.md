# ImagePlay

Welcome to your ImagePlay! A Ruby gem to extract text from images. ImagePlay uses Rtesseract and MiniMagick to extract text from images. ImagePlay requires Imagemagick and Tesseract to be installed on your system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'image_play'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install image_play

## Usage

You can provide an image or a image url as input to the function.

text = ImagePlay::Image.extract('input_path')

The extracted text will be returned to you.

This works best for images with white text on it. The image is processed using minimagick before extracting text using rtesseract. I'm trying to increase the accuracy and the ability to extract text with non-white colors.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bijoysijo/image_play.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
