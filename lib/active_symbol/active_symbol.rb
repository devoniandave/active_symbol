# frozen_string_literal: true

require 'byebug'
require 'awesome_print'

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
      self
    end 
    
    def singularize 
      self
    end

    def include?(*args)
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
  end 
end 

