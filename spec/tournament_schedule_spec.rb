require 'spec_helper'

describe OptaSD::Soccer::TournamentSchedule do

  before do
    @tournament_id = "bnni2f2e6ii20b1wmzcsbpj2o"
  end

  it "get match_facts by resource" do
    ranking = OptaSD::Soccer::TournamentSchedule.new.resource(@tournament_id)#.get
    # sdapidocumentation Account not Authorised for this request
  end
end
