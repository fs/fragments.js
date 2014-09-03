require "fragments.js/version"

module FragmentsJs
end

if defined?(Rails)
  class FragmentsJs::Engine < ::Rails::Engine
  end
end
