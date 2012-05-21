require "configus2/version"
require "core_ext/configus2"

module Configus2
  autoload :Builder, "configus2/builder"
  autoload :Proxy, "configus2/proxy"
  autoload :Config, "configus2/config"

  class << self
    def build(env, &block)
      @configus2 = Builder.build(env, &block)
    end

    def configus2
      @configus2
    end
  end

end
