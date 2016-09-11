module Environment
  class MapMeta
    def self.factory(window, args)
      args.map do |klass, value|
        obj = "Environment::#{klass}".constantize
        obj.new(window, value)
      end
    end
  end
end
