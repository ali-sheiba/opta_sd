require 'spec_helper'

describe OptaSD::Soccer::PlayerCareer do

  before do
    @player_uuid   = "1c4gmhsc0mfjl2or3oxggg6hh"
    @contestant_id = "apoawtpvac4zqlancmvw4nk4o"
  end

  it "get player career by resource" do
    match = OptaSD::Soccer::PlayerCareer.new.resource(@player_uuid).get
    expect(match.data).to include("person")
    expect(match.data['person'][0]['id']).to eq(@player_uuid)
  end

  it "get player career by person params" do
    match = OptaSD::Soccer::PlayerCareer.new.person(@player_uuid).get
    expect(match.data).to include("person")
    expect(match.data['person'][0]['id']).to eq(@player_uuid)
  end

  it "gets players career of contestant" do
    match = OptaSD::Soccer::PlayerCareer.new.contestant(@contestant_id).get
    expect(match.data).to include("person")
    expect(match.data['person'].count).to be > 1
  end

  it "gets players career of contestant" do
    active       = OptaSD::Soccer::PlayerCareer.new.contestant(@contestant_id).active(true).get
    active_url   = active.send(:build_uri).to_s
    expect(active_url).to include("active=yes")

    inactive     = OptaSD::Soccer::PlayerCareer.new.contestant(@contestant_id).active(false).get
    inactive_url = inactive.send(:build_uri).to_s
    expect(inactive_url).to include("active=no")
  end

end
