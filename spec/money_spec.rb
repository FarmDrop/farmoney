# frozen_string_literal: true

require "bigdecimal"

RSpec.describe Farmoney::Money do
  describe "comparators" do
    let(:subject) { described_class.new(100) }
    let(:other) { subject }

    context "when subject is less than other" do
      let(:other) { described_class.new(subject.pence + 1) }

      methods = {
        lt: true,
        gt: false,
        eq: false,
        lteq: true,
        gteq: false
      }

      methods.each do |name, value|
        it "##{name} should return #{value}" do
          expect(subject.public_send(name, other)).to eq(value)
        end
      end
    end

    context "when subject is greater than other" do
      let(:other) { described_class.new(subject.pence - 1) }

      methods = {
        lt: false,
        gt: true,
        eq: false,
        lteq: false,
        gteq: true
      }

      methods.each do |name, value|
        it "##{name} should return #{value}" do
          expect(subject.public_send(name, other)).to eq(value)
        end
      end
    end

    context "when subject is equal to other" do
      let(:other) { described_class.new(subject.pence) }

      methods = {
        lt: false,
        gt: false,
        eq: true,
        lteq: true,
        gteq: true
      }

      methods.each do |name, value|
        it "##{name} should return #{value}" do
          expect(subject.public_send(name, other)).to eq(value)
        end
      end
    end
  end
end
