# oembed_io

This is a simple rubygem for interacting with the website http://oembed.io

## install

    gem install oembed_io

## how to use

    require 'oembed_io'

    oembed = OEmbed.new('http://www.youtube.com/watch?v=5zey8567bcg')

    oembed.valid?
    #=> true

    # generate a URI object
    oembed.uri.to_s
    #=> "http://oembed.io/api?url=http://www.youtube.com/watch?v=5zey8567bcg"

The `#valid?` method will not prevent you from calling `#uri`, but is a friendly guard to help prevent bad strings.

Valid will sanity check the input uri and attempt to open the oembed uri to verify with the oembed.io endpoint.

## Contributing

Feel free to fork the repository and make pull requests :)