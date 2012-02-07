GemzBond::Application.routes.draw do
  get "downloads/:gem_name.gem" => "redirects#redirect_to_gem", :constraints => {:gem_name => /.*/}
  get "gems/:gem_name.gem" => "downloads#gem", :constraints => {:gem_name => /.*/}, :as => :gem
  get "quick/Marshal.4.8/:gem_name.gemspec.rz" => "downloads#gemspecrz", :constraints => {:gem_name => /.*/}, :as => :gem
  get ":specs.4.8.gz" => "downloads#list"
  get ":any_other_url" => "redirects#other", :constraints => {:any_other_url => /.*/}
end
