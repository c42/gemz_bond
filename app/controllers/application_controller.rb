class ApplicationController < ActionController::Base
  protect_from_forgery

  def get(uri_str, limit = 10)
    raise ArgumentError, 'too many HTTP redirects' if limit == 0

    Rails.logger.warn("Fetching #{uri_str}")
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
