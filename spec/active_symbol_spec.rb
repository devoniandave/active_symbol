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

require 'active_record'
require 'active_symbol'

#################################################################################
# 
#   DB setup code thanks to acts_as_tree gem 
#   https://github.com/amerine/acts_as_tree
# 
#################################################################################

ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

def setup_db(options = {})
  # AR keeps printing annoying schema statements
  capture_stdout do
  end
    ActiveRecord::Base.logger
    ActiveRecord::Schema.define(version: 1) do
      create_table :mixins, force: true do |t|
        t.column :type, :string
        t.column :parent_id, :integer
        t.column :external_id, :integer if options[:external_ids]
        t.column :external_parent_id, :integer if options[:external_ids]
        t.column :children_count, :integer, default: 0 if options[:counter_cache]
        t.timestamps null: false
      end

      create_table :level_mixins, force: true do |t|
        t.column :level, :string
        t.column :parent_id, :integer
        t.timestamps null: false
      end
    end

    # Fix broken reset_column_information in some activerecord versions.
    if ActiveRecord::VERSION::MAJOR == 3 && ActiveRecord::VERSION::MINOR == 2 ||
       ActiveRecord::VERSION::MAJOR == 4 && ActiveRecord::VERSION::MINOR == 1
      ActiveRecord::Base.connection.schema_cache.clear!
    end
end
class Mixin < ActiveRecord::Base
end 
Mixin.reset_column_information

setup_db

RSpec.describe ActiveSymbol do
  it "has a version number" do
    expect(ActiveSymbol::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end


  it "generates correct sql for :symbol.gt" do
    actual = Mixin.where( :children_count.gt => 38291 ).to_sql 
    expected = "SELECT \"mixins\".* FROM \"mixins\" WHERE \"mixins\".\"author_id\" > 38291"
    expect(actual).to eq(expected)
  end

end
