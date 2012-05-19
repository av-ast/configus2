require 'spec_helper'

describe Configus2 do
  it "init with key" do
    configus2 = Configus2.build :test do
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
    configus2[:key_top].should == "key_top"
    configus2[:level1][:level2][:level2_key1].should == ["level2_key1"]
    configus2[:level1][:level1_key1].should == ["value","value1"]
  end
end
