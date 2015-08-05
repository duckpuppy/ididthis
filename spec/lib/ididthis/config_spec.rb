require 'spec_helper'

describe Ididthis::Config do
  it "defaults to the user's home directory" do
    expect(subject::PATH).to eq(File.join(ENV['HOME'], '.ididthis.yml'))
  end
end
