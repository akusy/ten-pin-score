require 'spec_helper'

describe Ball do
  let(:frame) { Fabricate(:frame) }

  it { should belong_to(:frame) }
  it { should validate_numericality_of(:number).only_integer }
  it { should validate_numericality_of(:number).is_greater_than(0) }
  it { should validate_numericality_of(:number).is_less_than(4) }

  describe "#update_ball" do
    context "strike ball" do
      subject { described_class.new(pins: 10, number: 1, frame_id: frame.id) }

      it "updates knock as strike" do
        expect(subject).to receive(:update_attribute).with(:knock, Ball::TYPES[:strike])
        subject.run_callbacks(:create)
      end
    end

    context "spare ball" do
      subject { described_class.new(pins: 10, number: 2, frame_id: frame.id) }

      it "updates knock as strike" do
        expect(subject).to receive(:update_attribute).with(:knock, Ball::TYPES[:spare])
        subject.run_callbacks(:create)
      end
    end    
  end

  describe "#update_frame" do
    context "strike ball" do
      subject { described_class.new(knock: Ball::TYPES[:strike], frame_id: frame.id) }

      it "updates self frame knock" do
        expect(subject.frame).to receive(:update_attribute).with(:knock, Ball::TYPES[:strike])
        subject.run_callbacks(:save)
      end

    context "spare ball" do
      subject { described_class.new(knock: Ball::TYPES[:spare], frame_id: frame.id) }

      it "updates self frame knock" do
        expect(subject.frame).to receive(:update_attribute).with(:knock, Ball::TYPES[:spare])
        subject.run_callbacks(:save)
      end
    end
    end
  end

end
