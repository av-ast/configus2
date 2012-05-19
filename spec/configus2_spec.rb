require 'spec_helper'

describe Configus2 do
  it "init with key" do
    configus2 = Configus2.build :test do
      env :test do
        key "value"
      end
    end
    configus2[:key].should == "value"
  end
end
