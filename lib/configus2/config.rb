module Configus2
  class Config
    attr_reader :config

    def initialize(data)
      @config = {}
      data.each do |k,v|
        @config[k] = v.is_a?(Hash) ? Config.new(v) : v
        # Ruby 1.8 old variant
        # singleton = class << self; self end
        # singleton.send (:define_method, k) do
        #   @config[k]
        # end
        define_singleton_method k do
          @config[k]
        end
      end
    end

    def get
      Config.new(@config)
    end

    def [](key)
      @config[key]
    end

    def to_hash
      res_hash = {}
      @config.to_hash.each do |k,v|
        res_hash[k] = v.instance_of?(Config) ? v.to_hash : v
      end
      res_hash
    end
  end
end
