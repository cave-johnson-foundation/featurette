require 'spec_helper'

describe App do
  it { should respond_to :name }
  it { should respond_to :url }
end
