require "spec_helper"
require 'order'

RSpec.describe Order do

  describe "#ref" do
    it "is set automatically before validation" do
      expect { subject.valid? }.to change(subject, :ref)
    end

    it "is invalid if not unique" do
      existing_ref = Order.create!.ref
      expect(Order.new(ref: existing_ref)).not_to be_valid
    end

    context "when automatically set" do
      before do
        subject.valid?
      end
      it "is 10 chars long" do
        expect(subject.ref.length).to eql(10)
      end

      it "is a combination of numbers and uppercase letters" do
        subject.valid?
        expect(subject.ref).to match(/[A-Z0-9]{10}/)
      end
    end
  end
end
