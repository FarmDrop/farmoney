# frozen_string_literal: true

module Farmoney
  class Vat < SimpleDelegator
    def self.from_decimal(rate)
      new(100 * rate)
    end

    def self.from_thousandth(rate)
      new(BigDecimal(rate) / 10)
    end

    def initialize(rate, precision: 2)
      @rate = BigDecimal.new(rate, precision)
      super(@rate)
    end

    def to_s
      "#{@rate}%"
    end

    def multiplier
      1 + as_decimal
    end

    def as_decimal
      @rate / 100
    end

    def per_thousand
      (10 * @rate).to_i
    end
  end
end
