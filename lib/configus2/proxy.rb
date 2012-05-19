module Configus2
  class Proxy
    attr_reader :parsed_data

    def initialize(&block)
      @parsed_data = {}
      instance_eval(&block)
    end

    def method_missing(method_sym, *arguments, &block)
      if block_given?
        p = Proxy.new(&block)
        @parsed_data[method_sym] = p.parsed_data
      else
        @parsed_data[method_sym] = arguments.first
      end
    end
    
    def bm(data)
      build_methods(data)
    end
    
    def build_methods(data)
      data.each do |key, value|
        if value.is_a?(Hash)
          build_methods(value)
        else
          puts "define_method key=#{key} value=#{value}"
          define_method(key) { value }
        end
      end
    end

  end
end
