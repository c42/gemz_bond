GemzBond::Application.routes.draw do
  get "/downloads/:gem_name.gem" => "redirects#redirect_to_gem", :constraints => {:gem_name => /.*/}
  get "/gems/:gem_name.gem" => "downloads#gem", :constraints => {:gem_name => /.*/}, :as => :gem
  get "/:any_other_url" => "redirects#other", :constraints => {:any_other_url => /.*/}
end
