module Configus2
  class Proxy
    attr_reader :parsed_data

    def initialize(&block)
      @parsed_data = {}
      instance_eval(&block)
    end

    def method_missing(method_sym, *arguments, &block)
      if block_given?
      else
        @parsed_data[method_sym] = arguments.first
      end
    end

  end
end
