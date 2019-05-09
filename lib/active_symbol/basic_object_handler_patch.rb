module ActiveRecord
  class PredicateBuilder
    class BasicObjectHandler # :nodoc:
      alias :__original_call__ :call
      def call(attribute, value)
        if attribute.name.is_a?(ActiveSymbol::Base)
          attribute.name.handle_attribute( attribute, value )
        else
          # def call(attribute, value)
          #   bind = predicate_builder.build_bind_attribute(attribute.name, value)
          #   attribute.eq(bind)
          # end
          original_output=__original_call__(attribute,value)
        end 
      end
    end
  end
end
