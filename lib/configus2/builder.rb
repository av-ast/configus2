module Configus2
  class Builder

    attr_reader :hash_tree

    def initialize(env, &block)
      @hash_tree = {}
      instance_eval(&block)
    end

    def env(env_name, options={}, &block)
      p = Proxy.new(&block)
      @hash_tree[env_name] = p.parsed_data
    end

    class << self
      def build(env, &block)
        b = new(env, &block)
        b.hash_tree[env]
      end

    end

  end
end
