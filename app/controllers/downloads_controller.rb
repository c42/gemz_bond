require 'net/http'

class DownloadsController < ApplicationController
  caches_page :gem

  def gem
    response = get("http://rubygems.org/gems/#{params[:gem_name]}.gem")
    case response
    when Net::HTTPSuccess
      send_data response.body
    else
      head :status => :not_found
    end
  end
end
