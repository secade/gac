module Utils
  module ConstantHelpers
    def includes?(sym)
      self.constants.include?(sym.upcase)
    end

    def get(sym)
      "#{self}::#{sym.upcase}".constantize
    end
  end
end
