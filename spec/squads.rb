require 'spec_helper'

describe OptaSD::Soccer::Squads do

  before do
    @valid_tournament_id = "408bfjw6uz5k19zk4am50ykmh"
    @valid_contestant_id = "884uzyf1wosc7ykji6e18gifp"
  end

  it "gets squads based on tournament" do
    squads = OptaSD::Soccer::Squads.new.tournament(@valid_tournament_id).get
    expect(squads.data).to include("squad")
  end

  it "gets squads based on contestant" do
    squads = OptaSD::Soccer::Squads.new.contestant(@valid_contestant_id).get
    expect(squads.data).to include("squad")
  end

  it "gets detailed squads" do
    squads = OptaSD::Soccer::Squads.new.tournament(@valid_tournament_id).detailed.get
    expect(squads.data).to include("squad")
    expect(squads.data['squad'][0]['type']).to eq("squad")
    expect(squads.data['squad'][0]['person'][0]).to include("dateOfBirth")
  end

  it "gets people squads" do
    squads = OptaSD::Soccer::Squads.new.tournament(@valid_tournament_id).people.get
    expect(squads.data).to include("squad")
    expect(squads.data['squad'][0]).to_not include("type")
    expect(squads.data['squad'][0]['person'][0]).to_not include("dateOfBirth")
  end

  it "raise exception on using detailed abd people params togather" do
    expect{
      squads = OptaSD::Soccer::Squads.new.tournament(@valid_tournament_id).detailed.people.get
    }.to raise_error(OptaSD::Error, "Ambiguous/Invalid request parameters")
  end

end
