require 'spec_helper'

describe OptaSD::Soccer::Rankings do

  before do
    @tournament_id = "bnni2f2e6ii20b1wmzcsbpj2o"
  end

  it "get match_facts by resource" do
    ranking = OptaSD::Soccer::Rankings.new.resource(@tournament_id)#.get
    # sdapidocumentation Account not Authorised for this request
    # expect(match.data["matchInfo"]).to include("id" => @valid_match_id)
  end
end
