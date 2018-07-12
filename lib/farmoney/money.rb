# frozen_string_literal: true

module Farmoney
  class Money
    attr_reader :pence

    # required for money_converter
    # in method to_ruby, the value.to_i is called twice
    # the second time, it comes as a string and needs to call the pence as to_i
    alias to_i pence

    def initialize(pence)
      @pence = BigDecimal(pence)
    end

    def to_s
      pounds = @pence / 100
      pence = @pence % 100

      format("£%.1i.%.2i", pounds, pence)
    end

    def +(other)
      Money.new(pence + other.pence)
    end

    def -(other)
      Money.new(pence - other.pence)
    end

    def /(other)
      divisor = other.respond_to?(:pence) ? other.pence : other
      Money.new(pence / BigDecimal(divisor, 2))
    end

    def *(other)
      Money.new(pence * other)
    end
  end
end

