require 'spec_helper'

describe OptaSD::Soccer::TeamStandings do

  # OptaSD Not Authorising TeamStandings API for sdapidocumentation
  # the test only cover Building the urls

  before do
    @tournament  = "408bfjw6uz5k19zk4am50ykmh"
    @team        = OptaSD::Soccer::TeamStandings.new
  end

  it "it build team standings with tournament calendar id" do
    team = @team.tournament(@tournament)
    url  = team.send(:build_uri).to_s

    expect(url).to include("tmcl=#{@tournament}")
  end

  it "it build team standings with tournament calendar id and stage id" do
    team = @team.tournament(@tournament).stage('123')
    url  = team.send(:build_uri).to_s

    expect(url).to include("tmcl=#{@tournament}")
    expect(url).to include("stg=123")
  end

  it "it build team standings with live param" do
    team = @team.tournament(@tournament).live
    url  = team.send(:build_uri).to_s

    expect(url).to include("live=yes")
  end

  it "it build team standings with types" do
    team_1 = @team.tournament(@tournament).total
    url_1  = team_1.send(:build_uri).to_s
    expect(url_1).to include("type=total")

    team_2 = @team.tournament(@tournament).home
    url_2  = team_2.send(:build_uri).to_s
    expect(url_2).to include("type=home")

    team_3 = @team.tournament(@tournament).away
    url_3  = team_3.send(:build_uri).to_s
    expect(url_3).to include("type=away")

    team_4 = @team.tournament(@tournament).form_total
    url_4  = team_4.send(:build_uri).to_s
    expect(url_4).to include("type=form-total")

    team_5 = @team.tournament(@tournament).form_home
    url_5  = team_5.send(:build_uri).to_s
    expect(url_5).to include("type=form-home")

    team_6 = @team.tournament(@tournament).form_away
    url_6  = team_6.send(:build_uri).to_s
    expect(url_6).to include("type=form-away")
  end

end
