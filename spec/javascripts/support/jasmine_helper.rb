require "sprockets"
require "sprockets-gem-paths"

Jasmine.configure do |config|
  config.add_rack_path(config.spec_path, lambda {
    sprockets_spec_env = Sprockets::Environment.new
    sprockets_spec_env.append_path config.spec_dir
    sprockets_spec_env.append_gem_paths
    sprockets_spec_env
  })
end
