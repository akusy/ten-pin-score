require 'spec_helper'

class TestClass < Struct.new(:knock)
  include Tenpins
end

describe Tenpins do

  describe "#regular?" do
    subject { TestClass.new(TestClass::TYPES[:regular]) }

    it "returns true" do
      expect(subject.regular?).to be_true
    end

    context "Knock is strike or spare" do
      it "returns false" do
        subject.knock = TestClass::TYPES[:spare]
        expect(subject.regular?).to be_false
      end
    end 
  end

  describe "#spare?" do
    subject { TestClass.new(TestClass::TYPES[:spare]) }

    it "returns true" do
      expect(subject.spare?).to be_true
    end

    context "Knock is strike or regular" do
      it "returns false" do
        subject.knock = TestClass::TYPES[:regular]
        expect(subject.spare?).to be_false
      end
    end 
  end

  describe "#strike?" do
    subject { TestClass.new(TestClass::TYPES[:strike]) }

    it "returns true" do
      expect(subject.strike?).to be_true
    end

    context "Knock is spare or regular" do
      it "returns false" do
        subject.knock = TestClass::TYPES[:regular]
        expect(subject.strike?).to be_false
      end
    end 
  end
end
