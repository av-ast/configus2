module Configus2
  class Builder
    attr_reader :envs

    def initialize(env, &block)
      @envs = {}
      instance_eval(&block)
    end

    def env(env_name, options={}, &block)
      p = Proxy.new(&block)
      @envs[env_name] = p.get_config
    end

    class << self
      def build(env, &block)
        b = new(env, &block)
        b.envs[env]
      end
    end

  end
end
