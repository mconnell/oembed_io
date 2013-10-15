require 'uri'
require 'open-uri'

class OEmbed

  def initialize(uri_string)
    @uri_string = uri_string
  end

  def uri
    URI.parse "http://oembed.io/api?url=#{@uri_string}"
  end

  def valid?
    !!(valid_uri_string? && uri_object.open)
  rescue OpenURI::HTTPError
    false
  end

  private
  def valid_uri_string?
    !!@uri_string.slice(URI.regexp)
  end

  def uri_object
    URI.parse(@uri_string)
  end

end
