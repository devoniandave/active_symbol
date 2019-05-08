module ActiveRecord
  class PredicateBuilder
    class BasicObjectHandler # :nodoc:
      alias :__original_call__ :call
      def call(attribute, value)
        if attribute.name.is_a?(ActiveSymbol::Base)
          fyi = nil 
          case attribute.name.predicate_method.to_s
          when "like"
            fyi=attribute.send("matches", value)
          when "ilike"
            fyi=attribute.send("matches", value)
          else
            fyi=attribute.send(attribute.name.predicate_method, value)
            fyi.left.name=attribute.name.sanitized_string        
          end
          return fyi
        else
          original_output=__original_call__(attribute,value)
        end 
      end
    end
  end
end
