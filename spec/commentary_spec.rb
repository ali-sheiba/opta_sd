require 'spec_helper'

describe OptaSD::Soccer::Commentary do

  before do
    @valid_match_id   = "bsu6pjne1eqz2hs8r3685vbhl"
  end

  it "gets all commentary" do
    match = OptaSD::Soccer::Commentary.new.resource(@valid_match_id).get

    expect(match.data).to include("message")
  end

  it "build commentary with type manual" do
    match = OptaSD::Soccer::Commentary.new.resource(@valid_match_id).manual.get

    url = match.send(:build_uri).to_s
    expect(url).to include('type=manual')
    expect(match.data).to include("message")
  end

  it "build commentary with type fallback" do
    match = OptaSD::Soccer::Commentary.new.resource(@valid_match_id).fallback.get

    url = match.send(:build_uri).to_s
    expect(url).to include('type=fallback')
    expect(match.data).to include("message")
  end

  it "build commentary with type auto" do
    match = OptaSD::Soccer::Commentary.new.resource(@valid_match_id).auto.get

    url = match.send(:build_uri).to_s
    expect(url).to include('type=auto')
    expect(match.data).to include("message")
  end

end
