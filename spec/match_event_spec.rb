require 'spec_helper'

describe OptaSD::Soccer::MatchEvent do

  before do
    @valid_match_id   = "bsu6pjne1eqz2hs8r3685vbhl"
  end

  it "get match_event by resource" do
    match = OptaSD::Soccer::MatchEvent.new.resource(@valid_match_id).get
    expect(match.data).to include("matchInfo")
    expect(match.data).to include("liveData")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

  it "get match_event by fixture" do
    match = OptaSD::Soccer::MatchEvent.new.fixture(@valid_match_id).get
    expect(match.data).to include("matchInfo")
    expect(match.data).to include("liveData")
    expect(match.data['liveData']).to include("matchDetails")
    expect(match.data['liveData']).to include("event")
    expect(match.data['liveData']['event'][0]).to include("qualifier")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

end
