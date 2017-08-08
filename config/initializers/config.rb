DreamJob::CONFIG = Figgy.build do |config|
  config.root = Rails.root.join('config')
  config.add_root Rails.root.join('config/etc/local')
  config.add_root Rails.root.join('config/etc')

  # config.foo is read from etc/foo.yml
  config.define_overlay :default, nil

  # config.foo is then updated with values from etc/production/foo.yml
  config.define_overlay(:environment) { Rails.env }
end
