require 'rails_helper'

describe Photo do
	it { should respond_to(:user) }
  it { should respond_to(:property) }
end