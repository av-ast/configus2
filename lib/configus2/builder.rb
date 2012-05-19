module Configus2
  class Builder

    attr_reader :hash_tree

    def initialize(env, &block)
      @hash_tree = {}
      @env = env
      instance_eval(&block)
    end

    def env(env_name, options={}, &block)
      p = Proxy.new(&block)
      #p.bm(p.parsed_data)
      @hash_tree[env_name] = p.parsed_data
    end

    def to_hash
      @hash_tree[@env]
    end
    
    class << self
      def build(env, &block)
        b = new(env, &block)
        b
      end

    end

  end
end
