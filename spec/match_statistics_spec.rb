require 'spec_helper'

describe OptaSD::Soccer::MatchStatistics do

  before do
    @valid_match_id   = "bsu6pjne1eqz2hs8r3685vbhl"
  end

  it "get statistics by resource" do
    match = OptaSD::Soccer::MatchStatistics.new.resource(@valid_match_id).get
    expect(match.data).to include("matchInfo")
    expect(match.data).to include("liveData")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

  it "get statistics by fixture" do
    match = OptaSD::Soccer::MatchStatistics.new.fixture(@valid_match_id).get

    expect(match.data).to include("liveData")
    expect(match.data['liveData']).to include("matchDetails")
    expect(match.data['liveData']).to include("goal")
    expect(match.data['liveData']).to include("missedPen")
    expect(match.data['liveData']).to include("missedPen")
    expect(match.data['liveData']).to include("card")
    expect(match.data['liveData']).to include("substitute")
    expect(match.data['liveData']).to include("lineUp")
    expect(match.data['liveData']).to include("matchDetailsExtra")

    expect(match.data).to include("matchInfo")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

  it "gets detailed statistics" do
    detailed     = OptaSD::Soccer::MatchStatistics.new.fixture(@valid_match_id).detailed.get
    not_detailed = OptaSD::Soccer::MatchStatistics.new.fixture(@valid_match_id).get

    detailed_player = detailed.data['liveData']['lineUp'][0]['player'][0]
    not_detailed_player = not_detailed.data['liveData']['lineUp'][0]['player'][0]

    expect(detailed_player['stat'].size).to be > not_detailed_player['stat'].size
  end

end
