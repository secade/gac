module Environment
  module BaseEntity
    def factory(window, args)
      new(window, args)
    end

    def attr_entity(input_attrs)
      attrs = {
        updateable:   false,
        drawable:     false,
        gravitizable: false,
        collidable:   false,
      }

      input_attrs.each do |attr|
        attrs[attr] = true
      end

      attrs.each do |attr, has|
        class_eval <<-RUBY
          def #{attr}?
            #{has}
          end
        RUBY
      end
    end
  end
end
