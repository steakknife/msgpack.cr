require "../spec_helper"

describe Msgpack do
  context "uint32" do
    it "Decodes 0" do
      Msgpack.decode([0xce_u8, 0_u8, 0_u8, 0_u8, 0_u8]).should eq(0)
    end

    it "Decodes 1" do
      Msgpack.decode([0xce_u8, 0_u8, 0_u8, 0_u8, 1_u8]).should eq(1)
    end

    it "Decodes 254" do
      Msgpack.decode([0xce_u8, 0_u8, 0_u8, 0_u8, 254_u8]).should eq(254)
    end

    it "Decodes 255" do
      Msgpack.decode([0xce_u8, 0_u8, 0_u8, 0_u8, 255_u8]).should eq(255)
    end

    it "Decodes 256" do
      Msgpack.decode([0xce_u8, 0_u8, 0_u8, 1_u8, 0_u8]).should eq(256)
    end

    it "Decodes 65535" do
      Msgpack.decode([0xce_u8, 0_u8, 0_u8, 255_u8, 255_u8]).should eq(65535)
    end

    it "Decodes 65536" do
      Msgpack.decode([0xce_u8, 0_u8, 1_u8, 0_u8, 0_u8]).should eq(65536)
    end

    it "Decodes 4294967295" do
      Msgpack.decode([0xce_u8, 255_u8, 255_u8, 255_u8, 255_u8]).should eq(4294967295)
    end
  end
end
