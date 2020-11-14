# frozen_string_literal: true

require 'active_record'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection(database: ':memory:', adapter: 'sqlite3')
end

ActiveRecord::Schema.define(version: Time.now.to_i) do
  create_table 'orders', force: :cascade do |t|
    t.string 'ref'
    t.integer 'price_cents'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
