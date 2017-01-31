require 'spec_helper'

describe OptaSD::Soccer::MatchFacts do

  before do
    @valid_match_id   = "bsu6pjne1eqz2hs8r3685vbhl"
  end

  it "get match_facts by resource" do
    match = OptaSD::Soccer::MatchFacts.new.resource(@valid_match_id).get
    expect(match.data).to include("message")
    expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end
end
