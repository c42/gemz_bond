require 'net/http'

class DownloadsController < ApplicationController
  caches_page :gem

  def forward_response response
    case response
    when Net::HTTPSuccess
      send_data response.body
    else
      head :status => :not_found
    end
  end

  def gem
    forward_response get("#{Settings.rubygems}/gems/#{params[:gem_name]}.gem")
  end

  def list
    forward_response get("#{Settings.rubygems}/#{params[:specs]}.4.8.gz")
  end
end
