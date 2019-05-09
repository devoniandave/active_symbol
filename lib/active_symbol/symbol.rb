class Symbol
  def eq(bind)
    byebug
  end

  def like
    ActiveSymbol::Base.new(self, :like)
  end

  def ilike
    ActiveSymbol::Base.new(self, :ilike)
  end

  def not_like
    ActiveSymbol::Base.new(self, :not_like)
  end

  def not_ilike
    ActiveSymbol::Base.new(self, :not_ilike)
  end
  
  def not_eq
    ActiveSymbol::Base.new(self, :not_eq)
  end
  alias :ne :not_eq

  def gteq
    ActiveSymbol::Base.new(self, :gteq)
  end
  alias :gte :gteq
  
  def gt
    ActiveSymbol::Base.new(self, :gt)
  end

  def lt
    ActiveSymbol::Base.new(self, :lt)
  end

  def lteq
    ActiveSymbol::Base.new(self, :lteq)
  end
  alias :lte :lteq

  def in
    ActiveSymbol::Base.new(self, :within)
  end
  alias :within :in


#     def not_eq_any others
#       grouping_any :not_eq, others
#     end

#     def not_eq_all others
#       grouping_all :not_eq, others
#     end

#     def eq other
#       Nodes::Equality.new self, quoted_node(other)
#     end

#     def eq_any others
#       grouping_any :eq, others
#     end

#     def eq_all others
#       grouping_all :eq, quoted_array(others)
#     end

#     def between other
#       if equals_quoted?(other.begin, -Float::INFINITY)
#         if equals_quoted?(other.end, Float::INFINITY)
#           not_in([])
#         elsif other.exclude_end?
#           lt(other.end)
#         else
#           lteq(other.end)
#         end
#       elsif equals_quoted?(other.end, Float::INFINITY)
#         gteq(other.begin)
#       elsif other.exclude_end?
#         gteq(other.begin).and(lt(other.end))
#       else
#         left = quoted_node(other.begin)
#         right = quoted_node(other.end)
#         Nodes::Between.new(self, left.and(right))
#       end
#     end

#     def in other
#       case other
#       when Arel::SelectManager
#         Arel::Nodes::In.new(self, other.ast)
#       when Range
#         if $VERBOSE
#           warn <<-eowarn
# Passing a range to `#in` is deprecated. Call `#between`, instead.
#           eowarn
#         end
#         between(other)
#       when Enumerable
#         Nodes::In.new self, quoted_array(other)
#       else
#         Nodes::In.new self, quoted_node(other)
#       end
#     end

#     def in_any others
#       grouping_any :in, others
#     end

#     def in_all others
#       grouping_all :in, others
#     end

#     def not_between other
#       if equals_quoted?(other.begin, -Float::INFINITY)
#         if equals_quoted?(other.end, Float::INFINITY)
#           self.in([])
#         elsif other.exclude_end?
#           gteq(other.end)
#         else
#           gt(other.end)
#         end
#       elsif equals_quoted?(other.end, Float::INFINITY)
#         lt(other.begin)
#       else
#         left = lt(other.begin)
#         right = if other.exclude_end?
#           gteq(other.end)
#         else
#           gt(other.end)
#         end
#         left.or(right)
#       end
#     end

#     def not_in other
#       case other
#       when Arel::SelectManager
#         Arel::Nodes::NotIn.new(self, other.ast)
#       when Range
#         if $VERBOSE
#           warn <<-eowarn
# Passing a range to `#not_in` is deprecated. Call `#not_between`, instead.
#           eowarn
#         end
#         not_between(other)
#       when Enumerable
#         Nodes::NotIn.new self, quoted_array(other)
#       else
#         Nodes::NotIn.new self, quoted_node(other)
#       end
#     end

#     def not_in_any others
#       grouping_any :not_in, others
#     end

#     def not_in_all others
#       grouping_all :not_in, others
#     end

#     def matches other, escape = nil, case_sensitive = false
#       Nodes::Matches.new self, quoted_node(other), escape, case_sensitive
#     end

#     def matches_regexp other, case_sensitive = true
#       Nodes::Regexp.new self, quoted_node(other), case_sensitive
#     end

#     def matches_any others, escape = nil, case_sensitive = false
#       grouping_any :matches, others, escape, case_sensitive
#     end

#     def matches_all others, escape = nil, case_sensitive = false
#       grouping_all :matches, others, escape, case_sensitive
#     end

#     def does_not_match other, escape = nil, case_sensitive = false
#       Nodes::DoesNotMatch.new self, quoted_node(other), escape, case_sensitive
#     end

#     def does_not_match_regexp other, case_sensitive = true
#       Nodes::NotRegexp.new self, quoted_node(other), case_sensitive
#     end

#     def does_not_match_any others, escape = nil
#       grouping_any :does_not_match, others, escape
#     end

#     def does_not_match_all others, escape = nil
#       grouping_all :does_not_match, others, escape
#     end


#     def gteq_any others
#       grouping_any :gteq, others
#     end

#     def gteq_all others
#       grouping_all :gteq, others
#     end

#     def gt right
#       Nodes::GreaterThan.new self, quoted_node(right)
#     end

#     def gt_any others
#       grouping_any :gt, others
#     end

#     def gt_all others
#       grouping_all :gt, others
#     end

#     def lt right
#       Nodes::LessThan.new self, quoted_node(right)
#     end

#     def lt_any others
#       grouping_any :lt, others
#     end

#     def lt_all others
#       grouping_all :lt, others
#     end

#     def lteq right
#       Nodes::LessThanOrEqual.new self, quoted_node(right)
#     end

#     def lteq_any others
#       grouping_any :lteq, others
#     end

#     def lteq_all others
#       grouping_all :lteq, others
#     end

#     def when right
#       Nodes::Case.new(self).when quoted_node(right)
#     end

#     def concat other
#       Nodes::Concat.new self, other
#     end
end 