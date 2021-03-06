require "../spec_helper"

describe Msgpack do
  context "Fixuint7" do
    it "Decodes 0" do
      ([0b0_000_0000_u8].from_msgpack).should eq(0)
    end

    it "Decodes 1" do
      ([0b0_000_0001_u8].from_msgpack).should eq(1)
    end

    it "Decodes 126" do
      ([0b0_111_1110_u8].from_msgpack).should eq(126)
    end

    it "Decodes 127" do
      ([0b0_111_1111_u8].from_msgpack).should eq(127)
    end
  end

  context "Fixint5" do
    it "Decodes -1" do
      ([0b111_11111_u8].from_msgpack).should eq(-1)
    end

    it "Decodes -2" do
      ([0b111_11110_u8].from_msgpack).should eq(-2)
    end

    it "Decodes -31" do
      ([0b111_00001_u8].from_msgpack).should eq(-31)
    end

    it "Decodes -32" do
      ([0b111_00000_u8].from_msgpack).should eq(-32)
    end
  end
end
