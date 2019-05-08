module ActiveRecord
  class PredicateBuilder
    class BasicObjectHandler # :nodoc:
      alias :__original_call__ :call
      def call(attribute, value)
        if attribute.name.is_a?(ActiveSymbol::Base)
          fyi = nil 
          case attribute.name.predicate_method.to_s
          when "like"
            fyi=attribute.send("matches", value, nil, true)
          when "ilike"
            fyi=attribute.send("matches", value, nil, false)
          when "not_like"
            fyi=attribute.send("does_not_match", value, nil, true)
          when "not_ilike"
            fyi=attribute.send("does_not_match", value, nil, false)
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
