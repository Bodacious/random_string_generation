# frozen_string_literal: true

require_relative 'order'

@order = Order.create!(price_cents: 10_00)

puts @order.ref.inspect
