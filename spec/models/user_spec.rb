#coding: utf-8
require 'spec_helper'

describe User do

  before do
    @user = User.new(name:'akiinyo')
  end

  subject { @user }

  it { should respond_to(:name) }
end
