require 'spec_helper'

describe OptaSD::Soccer::Venues do

  before do
    @valid_venue_id      = "bdkmbkf8yi951wrjraknp9wad"
    @valid_tournament_id = "9xjsbe05up1jqycf7no90as4p"
    @valid_contestant_id = "c8h9bw1l82s06h77xxrelzhur"
  end

  it "gets venues based on venue id" do
    venues = OptaSD::Soccer::Venues.new.venue(@valid_venue_id).get
    expect(venues.data).to include("venue")
  end

  it "gets venues based on tournament" do
    venues = OptaSD::Soccer::Venues.new.tournament(@valid_tournament_id).get
    expect(venues.data).to include("venue")
  end

  it "gets venues based on contestant" do
    venues = OptaSD::Soccer::Venues.new.contestant(@valid_contestant_id).get
    expect(venues.data).to include("venue")
  end
end
