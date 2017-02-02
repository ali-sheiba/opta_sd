# OPTA Sports Data Soccer API GEM

Docs WIP

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opta_sd', git: 'git://github.com/sheiba-clickapps/opta_sd.git'
```

--------------------------------------------------------------------------------

## Usage

To Use the Gem in Rails Application:

```ruby
WIP
```

--------------------------------------------------------------------------------

## APIS

Sports Data Soccer API guide

<http://api.performfeeds.com/soccerdata/match/sdapidocumentation?_docu>

### 1\. Fixtures and Results

Examples:

```ruby
# Get Match details with live and lineups
OptaSD::Soccer::Match.new.resource('bsu6pjne1eqz2hs8r3685vbhl').live.lineups.get

# Usgin Old OPTA Core Match ID
OptaSD::Soccer::Match.new.fixture('urn:perform:optacore:fixture:2366080').live.lineups.get

# Get competition matches between two time stamps
OptaSD::Soccer::Match.new.competition('722fdbecxzcq9788l6jqclzlw').time_range(Time.now - 86400, Time.now + 86400).get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`
- `tournament(tournament_id)`
- `stage(stage_id)`
- `competition(competition_id)`
- `contestant(contestant_id)`
- `live`
- `lineups`
- `status(status)` statuses : (all, fixture, played, playing, cancelled, postponed, suspended)
- `time_range(from, to)` from and to should be a valid Time, like `Time.now`

### Match Statistics

```ruby
OptaSD::Soccer::MatchStatistics.new
```

### Match Events

```ruby
OptaSD::Soccer::MatchEvent.new
```

### Pass Matrix and Average Formation

```ruby
OptaSD::Soccer::PassMatrix.new
```

### Possession

```ruby
OptaSD::Soccer::Possession.new
```

### Commentary

```ruby
OptaSD::Soccer::Commentary.new
```

### Match Facts

```ruby
OptaSD::Soccer::MatchFacts.new
```

### Seasonal Stats

```ruby
OptaSD::Soccer::SeasonalStats.new
```

### Squads

```ruby
OptaSD::Soccer::Squads.new
```

### Team Standings

```ruby
OptaSD::Soccer::TeamStandings.new
```

### Player Career

```ruby
OptaSD::Soccer::PlayerCareer.new
```

### Tournament Calendars

```ruby
OptaSD::Soccer::TournamentCalendar.new
```

### Match Preview

```ruby
OptaSD::Soccer::MatchPreview.new
```

### Rankings

```ruby
OptaSD::Soccer::Rankings.new
```

### Tournament Schedule

```ruby
OptaSD::Soccer::TournamentSchedule.new
```

--------------------------------------------------------------------------------

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
