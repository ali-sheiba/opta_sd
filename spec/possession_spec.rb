require 'spec_helper'

describe OptaSD::Soccer::Possession do

  before do
    @valid_match_id   = "bsu6pjne1eqz2hs8r3685vbhl"
  end

  it "get possession by resource" do
    match = OptaSD::Soccer::Possession.new.resource(@valid_match_id).get
    expect(match.data).to include("matchInfo")
    expect(match.data).to include("liveData")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

  it "get possession by fixture" do
    match = OptaSD::Soccer::Possession.new.fixture(@valid_match_id).get
    expect(match.data).to include("matchInfo")
    expect(match.data).to include("liveData")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

end
