require 'net/http'

class HttpHelper
  def self.get(uri_str, limit = 10)
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    response = Net::HTTP.get_response(URI(uri_str))

    case response
    when Net::HTTPRedirection then
      location = response['location']
      get(location, limit - 1)
    else
      response
    end
  end
end