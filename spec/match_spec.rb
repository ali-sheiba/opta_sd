require 'spec_helper'

describe OptaSD::Soccer::Match do

  before do
    @valid_match_id   = "bsu6pjne1eqz2hs8r3685vbhl"
    @invalid_match_id = "invalid_match_id"
  end

  it "get match by response_id" do
    match = OptaSD::Soccer::Match.new.resource(@valid_match_id).get

    expect(match.data).to include("matchInfo")
    expect(match.data).to_not include("liveData")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end

  it "get a match details by resource id" do
    match = OptaSD::Soccer::Match.new.resource(@valid_match_id).live.get

    expect(match.data).to include("matchInfo")
    expect(match.data).to include("liveData")
  end

  it "raise exceptions" do
    expect{
      match = OptaSD::Soccer::Match.new.resource(@invalid_match_id).get
    }.to raise_error(OptaSD::Error, "User not Authorised") # this message should change once we get valid account
  end


end
