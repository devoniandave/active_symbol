# require "rails/cases/helper"
# require "models/author"
# require "models/binary"
# require "models/cake_designer"
# require "models/car"
# require "models/chef"
# require "models/post"
# require "models/comment"
# require "models/edge"
# require "models/essay"
# require "models/price_estimate"
# require "models/topic"
# require "models/treasure"
# require "models/vertex"

require 'active_symbol'


# MyCustomDateRange = Struct.new(:start, :end)
# handler = proc do |column, range|
#   Arel::Nodes::Between.new(column,
#     Arel::Nodes::And.new([range.start, range.end])
#   )
# end
# ActiveRecord::PredicateBuilder.new("mixins").register_handler(MyCustomDateRange, handler)


class Mixin < ActiveRecord::Base
end
Mixin.reset_column_information

# setup_db

RSpec.describe ActiveSymbol do
  it "has a version number" do
    expect(ActiveSymbol::VERSION).not_to be nil
  end

  it "does something useful" do
    # puts methods.sort.inspect
    expect(false).to_not eq(true)
  end



  it "generates correct sql for :symbol.gt" do
    actualw = Mixin.where( :children_count.gt => 38291 )
    actual = actualw.to_sql
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" > 38291"
    expect(actual).to eq(expected)
  end


  it "with multiple hash args, generates correct sql for :symbol.gt" do
    actual = Mixin.where( :children_count.gt => 38291, :children_count.gt => 234324 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" > 38291 AND \"mixins\".\"children_count\" > 234324"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.lt" do
    # byebug
    actual = Mixin.where( :children_count.lt => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" < 38291"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.in" do
    actual = Mixin.where( :children_count.in => (38291..789790) ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" BETWEEN 38291 AND 789790"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.in with inclusive range" do
    actual = Mixin.where( :children_count.in => (38291...789790) ).to_sql
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" >= 38291 AND \"mixins\".\"children_count\" < 789790"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.in with inclusive array" do
    actual = Mixin.where( :children_count.in => [38291,789790] ).to_sql
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" IN (38291, 789790)"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.ne" do
    # byebug
    actual = Mixin.where( :children_count.ne => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" != 38291"
    expect(actual).to eq(expected)
  end

  it "generates correct sql for :symbol.match" do
    actual = Mixin.where( :children_count.match => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"children_count\" != 38291"
    expect(actual).to eq(expected)
  end

end
