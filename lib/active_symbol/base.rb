# frozen_string_literal: true

unless defined?(Rails)
  require 'byebug'
  require 'awesome_print'
end

module ActiveSymbol
  class Base
    attr_reader :predicate_method, :sanitized_string
    def initialize(sym, predicate_method)
      @sanitized_string=sym.to_s
      @raw_string=sym.to_s
      @predicate_method=predicate_method
      @symbol=sym
    end 

    def to_s
      @symbol.to_s
    end 
    
    def singularize
      self
    end

    def include?(*args)
      true
      false
    end 
    
    def sanitized_string
      @sanitized_string || @raw_string
    end 

    def gsub(needle, replacement, *rest)
      @sanitized_string = @raw_string.gsub(needle,replacement)
      self  
    end 

    def to_sym
      self
    end

    def handle_attribute( attribute, value )
      fyi = nil 
      pms = predicate_method.to_s
      case pms
      when "like"
        # def matches other, escape = nil, case_sensitive = false
        fyi=attribute.send("matches", value, nil, true)
      when "ilike"
        fyi=attribute.send("matches", value, nil, false)
      when "not_like"
        fyi=attribute.send("does_not_match", value, nil, true)
      when "not_ilike"
        fyi=attribute.send("does_not_match", value, nil, false)
      else
        fyi=attribute.send(pms, value)
      end
      fyi.left.name = sanitized_string        
      return fyi
    end
    ##########

    #<Arel::Nodes::BindParam:0x00563b484adf38 @value=#<ActiveRecord::Relation::QueryAttribute:0x00563b484adf60 @name=#<ActiveSymbol:0x00563b48464298 @sanitized_string="author_id", @raw_string="author_id", @predicate_method=:lt, @symbol=:author_id>, @value_before_type_cast=38291, @type=#<ActiveModel::Type::Value:0x00563b4895ee38 @precision=nil, @scale=nil, @limit=nil>, @original_attribute=nil>>
    def build_bind_attribute(attribute,value)
     # 59        attr = Relation::QueryAttribute.new(column_name.to_s, value, table.type(column_name))
     # 60:       Arel::Nodes::BindParam.new(attr)
     
      attr = ActiveRecord::Relation::QueryAttribute.new(attribute.name.to_s, value, nil)
      # bind_param=Arel::Nodes::BindParam.new()
      # byebug
      bind_param=Arel::Nodes::BindParam.new()
    end 
  end 
end 

