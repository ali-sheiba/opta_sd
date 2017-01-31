require 'spec_helper'

describe OptaSD::Soccer::TournamentCalendar do

  before do
    @valid_competition_id = "722fdbecxzcq9788l6jqclzlw"
  end

  it "gets all tournaments" do
    match = OptaSD::Soccer::TournamentCalendar.new.get

    url = match.send(:build_uri).to_s
    expect(url).to include('tournamentcalendar')
    expect(url).to_not include('active')
    expect(url).to_not include('authorized')
    expect(match.data).to include("competition")
  end

  it "gets only active tournaments" do
    match = OptaSD::Soccer::TournamentCalendar.new.active.get

    url = match.send(:build_uri).to_s
    expect(url).to include('tournamentcalendar')
    expect(url).to include('active')
    expect(url).to_not include('authorized')
    expect(match.data).to include("competition")
  end

  it "gets only active and authorized for the user tournaments" do
    match = OptaSD::Soccer::TournamentCalendar.new.active.authorized.get

    url = match.send(:build_uri).to_s
    expect(url).to include('tournamentcalendar')
    expect(url).to include('active')
    expect(url).to include('authorized')
    expect(match.data).to include("competition")
  end

  it "gets tournament calendars by competition uuid" do
    match = OptaSD::Soccer::TournamentCalendar.new.competition(@valid_competition_id).get

    url = match.send(:build_uri).to_s
    expect(url).to include('tournamentcalendar')
    expect(url).to include("comp=#{@valid_competition_id}")
    expect(match.data).to include("competition")
  end

end
