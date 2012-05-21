require 'spec_helper'

describe Configus2 do
  before do
    @configus2 = Configus2.build :test do
      env :test do
        level1 do
          level2 do
            level2_key1 ["level2_key1"]
          end
          level1_key1 ["value","value1"]
        end
        key_top "key_top"
      end
    end
  end

  it "should return value for key" do
    @configus2.key_top.should == "key_top"
    @configus2.level1.level2.level2_key1.should == ["level2_key1"]
    @configus2[:level1].level2.level2_key1.should == ["level2_key1"]
    @configus2.level1.level1_key1 == ["value","value1"]
  end

  it "should return hash" do
    @configus2.level1.to_hash.should == {
      :level2 => { :level2_key1 => ["level2_key1"] },
      :level1_key1 => ["value", "value1"]
    }
  end
end
