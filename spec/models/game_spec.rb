require 'spec_helper'

describe Game do

  it { should have_many(:frames).dependent(:destroy) }

end
