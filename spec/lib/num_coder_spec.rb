# -*- coding: utf-8 -*-
require './spec/spec_helper'
require './lib/num_coder'

describe NumCoder do

  it "should encode and decode on the default bases" do
    NumCoder.encode95(12345678901234567890).should eq("3Wvh@TZMqf")
    NumCoder.decode95("Hadoken!").should eq(2841662827835761)
    NumCoder.encode64(12345678901234567890).should eq("KtUqYzrHwrS")
    NumCoder.decode64("Google+").should eq(455946164158)
    NumCoder.encode16(12345678901234567890).should eq("ab54a98ceb1f0ad2")
    NumCoder.decode16("b00b5").should eq(721077)
  end

  it "should reject characters outside the default bases" do
    expect { NumCoder.decode95("Hádoken!") }.to raise_error
    expect { NumCoder.decode64("Hádoken!") }.to raise_error
    expect { NumCoder.decode64("Hádoken!") }.to raise_error
  end

  it "should encode to fixed size on the default bases" do
    NumCoder.fixed_encode95(1234567890, 5).size.should eq(5)
    NumCoder.fixed_encode95(12, 5).size.should eq(5)
    NumCoder.fixed_encode64(1234567890, 6).size.should eq(6)
    NumCoder.fixed_encode64(12, 6).size.should eq(6)
    NumCoder.fixed_encode16(1234567890, 8).size.should eq(8)
    NumCoder.fixed_encode16(12, 8).size.should eq(8)
  end

  it "should encode arrays to fixed size on base 95" do
    numbers = [1234567890, 2345678901, 3456789012]
    encoded_95 = NumCoder.fixed_encode95(numbers, 5)
    encoded_95.should eq("/.y5M<kt!qJInch")
  end

  it "should reject to fix encode numbers too large to fit" do
    expect { NumCoder.fixed_encode95(1234567890, 4) }.to raise_error
    expect { NumCoder.fixed_encode64(1234567890, 5) }.to raise_error
    expect { NumCoder.fixed_encode16(1234567890, 7) }.to raise_error
  end

  it "should decode strings as arrays of numbers on fix decode 95" do
    decoded_95 = NumCoder.fixed_decode95("/.y5M<kt!qJInch", 5)
    decoded_95.size.should eq(3)
    decoded_95[0].should eq(1234567890)
    decoded_95[1].should eq(2345678901)
    decoded_95[2].should eq(3456789012)
  end

  it "should reject to fix decode strings not multiple of limit" do
    expect { NumCoder.fixed_decode95("abcdef", 5) }.to raise_error
    expect { NumCoder.fixed_decode64("abcdef", 5) }.to raise_error
    expect { NumCoder.fixed_decode16("abcdef", 5) }.to raise_error
  end

end
