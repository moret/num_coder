require './spec/spec_helper'
require './lib/num_coder'

describe NumCoder do
  it "should be better tested" do
    NumCoder.encode95(12345678901234567890).should eq("3Wvh@TZMqf")
    NumCoder.decode95("Hadoken!").should eq(2841662827835761)
    NumCoder.encode64(12345678901234567890).should eq("KtUqYzrHwrS")
    NumCoder.decode64("Google+").should eq(455946164158)
    NumCoder.encode16(12345678901234567890).should eq("ab54a98ceb1f0ad2")
    NumCoder.decode16("b00b5").should eq(721077)
  end
end
