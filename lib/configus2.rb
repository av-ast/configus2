require "configus2/version"

module Configus2
  autoload :Builder, "configus2/builder"
  autoload :Proxy, "configus2/proxy"
  autoload :Config, "configus2/config"

  def self.build(env, &block)
    builder = Builder.build(env, &block)
  end

end
