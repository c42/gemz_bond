class RedirectsController < ApplicationController
  def redirect_to_gem
    redirect_to gem_path(:gem_name => params[:gem_name])
  end

  def other
    redirect_to "http://rubygems.org/#{params[:any_other_url]}"
  end
end