module ActiveRecord
  class PredicateBuilder
    class BasicObjectHandler # :nodoc:
      # alias :original_call :call
      def call(attribute, value)
        if attribute.name.is_a?(ActiveSymbol::Base)
  # raise 'got to ActiveSymbolHandler'
  STDOUT.puts 'got to ActiveSymbolHandler'
  STDOUT.puts [attribute,value].inspect
          bind = @predicate_builder.build_bind_attribute(attribute.name, value)
  STDOUT.puts bind.inspect
  STDOUT.puts attribute.inspect
    "jj=>ff"
          # attribute.name is where the ActiveSymbol instance is stored
          fyi=attribute.send(attribute.name.predicate_method , bind)
  STDOUT.puts "fyi: " + fyi.inspect
          fyi.left.name=attribute.name.sanitized_string        
  STDOUT.puts "fyi b: " + fyi.inspect
          fyi
      
        else 
          bind = @predicate_builder.build_bind_attribute(attribute.name, value)
          attribute.eq(bind)
        end 
      end

    end
  end
end
