require 'spec_helper'

describe Hash do
  context '#mash, the alias fo with_indfifferent_access' do
    let(:hash) do
      { foo: 'bar', hoge: {fuga: 'piyo'}}
    end

    specify {
      hash.mash['hoge']['fuga'].should == 'piyo'
    }

    specify 'can change destructive!' do
      hash.mash!
      hash['hoge']['fuga'].should == 'piyo'
    end
  end
end
