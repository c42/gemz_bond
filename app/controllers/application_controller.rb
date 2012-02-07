class ApplicationController < ActionController::Base
  protect_from_forgery

  def get(uri_str)
    Rails.logger.warn("Fetching #{uri_str}")
    HttpHelper.get(uri_str)
  end
end
