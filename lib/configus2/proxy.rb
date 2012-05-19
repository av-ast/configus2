module Configus2
  class Proxy
    attr_reader :hash_data, :config

    def initialize(&block)
      @hash_data = {}
      instance_eval(&block)
    end

    def method_missing(method_sym, *arguments, &block)
      if block_given?
        p = Proxy.new(&block)
        @hash_data[method_sym] = p.hash_data
      else
        @hash_data[method_sym] = arguments.first
      end
    end

    def get_config
      config = Config.new(@hash_data)
      config.get
    end

  end
end
