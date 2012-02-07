GemzBond::Application.routes.draw do
  get "/downloads/:gem_name.gem" => "downloads#redirect_to_gem", :constraints => {:gem_name => /.*/}
  get "/gems/:gem_name.gem" => "downloads#gem", :constraints => {:gem_name => /.*/}, :as => :gem
end
