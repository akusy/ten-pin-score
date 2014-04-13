require 'spec_helper'

describe Frame do
  let(:game) { Fabricate(:game) }
  let(:ball1) { Fabricate(:ball, pins: 7) }
  let(:ball2) { Fabricate(:ball, pins: 2) }

  it { should have_many(:balls).dependent(:destroy) }
  it { should belong_to(:game) }
  it { should validate_numericality_of(:number).only_integer }
  it { should validate_numericality_of(:number).is_greater_than(0) }
  it { should validate_numericality_of(:number).is_less_than(11) }

  describe "#calculate_points!" do
    subject { described_class.create(points: 0, balls: [ball1, ball2], game: game) }

    context "Call method without param score" do
      it "updates points from balls" do
        subject.calculate_points!
        expect(subject.points).to eq 9
      end
    end

    context "Call method with param score" do
      it "updates points from parameter" do
        subject.update_attribute(:points, 8)
        subject.calculate_points! 9
        expect(subject.reload.points).to eq 17
      end
    end
  end

  describe "#tenth" do
    context "Frame has number ten" do
      subject { described_class.new(number: 10, game: game) }

      it "returns true" do
        expect(subject.tenth?).to be_true
      end
    end

    context "Frame has number less than ten" do
      subject { described_class.new(number: 12, game: game) }

      it "returns true" do
        expect(subject.tenth?).to be_false
      end
    end

  end
end
