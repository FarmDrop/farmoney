RSpec.describe Farmoney::Money do
  let(:pence) { 545 }
  let(:subject) { described_class.new(pence) }

  describe "#initialize" do
    it "doesn't raise an error" do
      expect { subject }.to_not raise_error
    end
  end

  describe "#to_s" do
    let(:pounds) { pence.to_f / 100 }

    it "returns the correct string value" do
      expect(subject.to_s).to eq "£#{pounds}"
    end
  end

  describe "#attributes" do
    it "returns the class as a hash" do
      expect(subject.attributes.class).to be Hash
    end

    it "returns the attribute 'pence' in the has" do
      expect(subject.attributes).to eq pence: subject.pence
    end
  end

  describe "#to_hash" do
    it "returns the same as #attributes" do
      expect(subject.to_hash).to eq subject.attributes
    end
  end
end
