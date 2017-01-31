require 'spec_helper'

describe OptaSD::Soccer::SeasonalStats do

  before do
    @valid_competition_id = "722fdbecxzcq9788l6jqclzlw"
    @valid_tournament_id  = "408bfjw6uz5k19zk4am50ykmh"
    @valid_contestant_id  = "884uzyf1wosc7ykji6e18gifp"
  end

  it "get seasonal stats by tournament and contestant" do
    match = OptaSD::Soccer::SeasonalStats.new.tournament(@valid_tournament_id).contestant(@valid_contestant_id).get

    expect(match.data).to include("contestant")
    expect(match.data).to include("player")
  end

  it "get seasonal stats by competition and contestant" do
    # match = OptaSD::Soccer::SeasonalStats.new.competition(@valid_competition_id).contestant(@valid_contestant_id).get

    # expect(match.data).to include("contestant")
    # expect(match.data).to include("player")
    # sdapidocumentation Account not Authorised for this request
  end

end
