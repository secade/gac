module Utils
  module ConstantHelpers
    def self.include?(sym)
      self.constants.include?(sym.upcase)
    end

    def self.get(str)
    end
  end
end
