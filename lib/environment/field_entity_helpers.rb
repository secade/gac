module Environment
  module FieldEntityHelpers
    def collidables
      all_entities.select(&:collidable?)
    end

    def gravitizables
      all_entities.select(&:gravity?)
    end
  end
end
