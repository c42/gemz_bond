class Settings < SettingsLogic
  source "#{Rails.root}/config/gem_settings.yml"
  namespace Rails.env
end
