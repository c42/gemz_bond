require 'net/http'

class DownloadsController < ApplicationController
  caches_page :gem, :list, :gemspecrz

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
    response = get("#{Settings.rubygems}/#{params[:specs]}.4.8.gz")
    send_data FilterGems.from_gzipped_source(response.body)
  end

  def gemspecrz
    forward_response get("#{Settings.rubygems}/quick/Marshal.4.8/#{params[:gem_name]}.gemspec.rz")
  end
end
