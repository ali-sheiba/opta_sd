require 'spec_helper'

describe OptaSD::Soccer::MatchPreview do

  before do
    @valid_match_id   = "cndzn1rr227qe4m9ozd6okba6"
  end

  it "get match_facts by resource" do
    # match = OptaSD::Soccer::MatchPreview.new.resource(@valid_match_id)#.get
    # sdapidocumentation Account not Authorised for this request
    # expect(match.data).to include("message")
    # expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end
end
