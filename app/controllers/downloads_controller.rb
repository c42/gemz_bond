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

  def redirect_to_gem
    redirect_to gem_path(:gem_name => params[:gem_name])
  end

  def other
    redirect_to "http://rubygems.org/#{params[:any_other_url]}"
  end
end