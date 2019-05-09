module ActiveRecord
  class Relation
    class WhereClauseFactory # :nodoc:
      def remove_active_symbol_keys!(atts)
        out = {}
        atts.each do |k,v|
          if k.is_a?(ActiveSymbol::Base)
            out[k] = atts.delete(k)
          end
        end
        return out
      end

      alias mp_old_build_method build
      def build(opts, other)
        case opts
        when Hash
          attributes = predicate_builder.resolve_column_aliases(opts)
          attributes = klass.send(:expand_hash_conditions_for_aggregates, attributes)
          as_attributes = remove_active_symbol_keys!(attributes)
          attributes.stringify_keys!
          attributes.merge!(as_attributes)
          parts = predicate_builder.build_from_hash(attributes)
          WhereClause.new(parts)
        else
          mp_old_build_method(opts,other)
        end
      end
    end
  end
end
