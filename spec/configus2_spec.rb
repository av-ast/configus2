require 'spec_helper'

describe Configus2 do
  before do
    @configus2 = Configus2.build :development do
      env :production do
        level1 do
          level2 do
            level2_key1 ["level2_key1"]
          end
          level1_key1 ["value","value1"]
        end
        key_top "key_top"
      end

      env :development, :parent => :production do
        level1 do
          another_level2 do
            arr ["one", "two"]
            level3 do
              dev_key "key_dev"
            end
          end
        end
      end
    end
  end

  it "should return value for key" do
    @configus2.key_top.should == "key_top"
    @configus2.level1.another_level2.level3.dev_key.should == "key_dev"
    @configus2.level1.another_level2.arr.should == ["one", "two"]
    @configus2.level1[:another_level2].arr.should == ["one", "two"]
  end

  it "should return hash" do
    @configus2.level1.to_hash.should == {
      :another_level2 => {
        :arr => ["one", "two"],
        :level3 => {
          :dev_key => "key_dev"
        }
      }
    }
  end

  it "shouldn't return parent's overridden values" do
    @configus2.level1.to_hash[:level1_key].should be_nil
  end

end
