class Settings < Settingslogic
  source "#{Rails.root}/config/gem_server.yml"
  namespace Rails.env
end
