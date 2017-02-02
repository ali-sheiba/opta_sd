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

## How It Work!

- xxx Core parameters

## APIS

Sports Data Soccer API guide

<http://api.performfeeds.com/soccerdata/match/sdapidocumentation?_docu>

### 1\. Fixtures and Results

Examples:

```ruby
# Get Match details with live and lineups
OptaSD::Soccer::Match.new.resource('bsu6pjne1eqz2hs8r3685vbhl').live.lineups.get

# Using Old OPTA Core Match ID
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
- `live(ture/false)` by default will pass true
- `lineups(ture/false)` by default will pass true
- `status(status)` statuses : (all, fixture, played, playing, cancelled, postponed, suspended)
- `time_range(from, to)` from and to should be a valid Time, like `Time.now`

### 2\. Match Statistics

```ruby
# Get Statistics Of Match
OptaSD::Soccer::MatchStatistics.new.resource('bsu6pjne1eqz2hs8r3685vbhl').get

# Get Statistics Of Match with more details
OptaSD::Soccer::MatchStatistics.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').detailed.get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`
- `detailed(ture/false)` by default will pass true

### 3\. Match Events

```ruby
# Get Match Events
OptaSD::Soccer::MatchEvent.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`

### 4\. Pass Matrix and Average Formation

```ruby
# Get Match Matrix
OptaSD::Soccer::PassMatrix.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`

### 5\. Possession

```ruby
# Get Possession Throughout A Match
OptaSD::Soccer::Possession.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`

### 6\. Commentary

```ruby
# Get Match Commentary
OptaSD::Soccer::Commentary.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').get

# Get Match Commentary with type
OptaSD::Soccer::Commentary.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').type('auto').get
# Or
OptaSD::Soccer::Commentary.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').auto.get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`
- `type(type)` types are : `auto` - `fallback` - `manual`
- `auto`
- `fallback`
- `manual`

### 7\. Match Facts

```ruby
# Get Match Facts
OptaSD::Soccer::MatchFacts.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`

### 8\. Seasonal Stats

```ruby
# Get Seasonal Stats by Competition Contestants
OptaSD::Soccer::SeasonalStats.new.competition('722fdbecxzcq9788l6jqclzlw').contestant('884uzyf1wosc7ykji6e18gifp').get

# Get Seasonal Stats by Tournament Contestants
OptaSD::Soccer::SeasonalStats.new.tournament('408bfjw6uz5k19zk4am50ykmh').contestant('884uzyf1wosc7ykji6e18gifp').get
```

Available Parameters:

- `competition(competition_id)`
- `tournament(tournament_id)`
- `contestant(contestant_id)`

### 9\. Squads

```ruby
# Get Squads By Tournament
OptaSD::Soccer::Squads.new.tournament('408bfjw6uz5k19zk4am50ykmh').get

# Get Squads By Contestant
OptaSD::Soccer::Squads.new.contestant('884uzyf1wosc7ykji6e18gifp').get

# Get Detailed Squads
OptaSD::Soccer::Squads.new.tournament('408bfjw6uz5k19zk4am50ykmh').detailed.get

# Get People Squads
OptaSD::Soccer::Squads.new.tournament('408bfjw6uz5k19zk4am50ykmh').people.get
```

Available Parameters:

- `tournament(tournament_id)`
- `contestant(contestant_id)`
- `detailed(ture/false)`
- `people(ture/false)`

### 10\. Team Standings

```ruby
# Get Team Standings By Tournament
OptaSD::Soccer::TeamStandings.new.tournament('408bfjw6uz5k19zk4am50ykmh').get

# Get Team Standings By Tournament And Stage
OptaSD::Soccer::TeamStandings.new.tournament('408bfjw6uz5k19zk4am50ykmh').stage('123').get

# Get Team Standings With Live Data
OptaSD::Soccer::TeamStandings.new.tournament('408bfjw6uz5k19zk4am50ykmh').live.get

# Get Team Standings By Type
OptaSD::Soccer::TeamStandings.new.tournament('408bfjw6uz5k19zk4am50ykmh').type('total').get
OptaSD::Soccer::TeamStandings.new.tournament('408bfjw6uz5k19zk4am50ykmh').total.get
```

Available Parameters:

- `stage(stage_id)`
- `tournament(tournament_id)`
- `type(type)` types are : `total` - `home` - `away` - `form-total` - `form-home` - `form-away`
- `live(ture/false)`
- `total`
- `home`
- `away`
- `form_total`
- `form_home`
- `form_away`

### 11\. Player Career

```ruby
# Get Player Career By Person ID
OptaSD::Soccer::PlayerCareer.new.resource('1c4gmhsc0mfjl2or3oxggg6hh').get
OptaSD::Soccer::PlayerCareer.new.person('1c4gmhsc0mfjl2or3oxggg6hh').get

# Get Players Career By Contestant ID
OptaSD::Soccer::PlayerCareer.new.contestant('apoawtpvac4zqlancmvw4nk4o').get

# Get Players Career By Contestant ID and Active on In-Active
OptaSD::Soccer::PlayerCareer.new.contestant('apoawtpvac4zqlancmvw4nk4o').active.get
OptaSD::Soccer::PlayerCareer.new.contestant('apoawtpvac4zqlancmvw4nk4o').active(false).get
```

Available Parameters:

- `resource(person_id)`
- `person(person)`
- `contestant(contestant)`
- `active(ture/false)`

### 12\. Tournament Calendars

```ruby
# Get All Competitions With All Tournaments
OptaSD::Soccer::TournamentCalendar.new.get

# Get Tournaments Of Competitions
OptaSD::Soccer::TournamentCalendar.new.competition('722fdbecxzcq9788l6jqclzlw').get

# Get All Competitions With Only Active Tournaments
OptaSD::Soccer::TournamentCalendar.new.active.get

# Get Only Authorized Competitions With Only Active Tournaments
OptaSD::Soccer::TournamentCalendar.new.active.authorized.get
```

Available Parameters:

- `competition`
- `active`
- `authorized`

### 13\. Match Preview

```ruby
# Get Preview of Match
OptaSD::Soccer::MatchPreview.new.fixture('bsu6pjne1eqz2hs8r3685vbhl').get
```

Available Parameters:

- `resource(match_id)`
- `fixture(match_id)`

### 14\. Rankings

```ruby
# Get Tournament Rankings
OptaSD::Soccer::Rankings.new.resource('408bfjw6uz5k19zk4am50ykmh').get
OptaSD::Soccer::Rankings.new.tournament('408bfjw6uz5k19zk4am50ykmh').get
```

Available Parameters:

- `resource(tournament_id)`
- `tournament(tournament_id)`

### 15\. Tournament Schedule

```ruby
# Get Tournament Schedule
OptaSD::Soccer::TournamentSchedule.new.resource('408bfjw6uz5k19zk4am50ykmh').get
OptaSD::Soccer::TournamentSchedule.new.tournament('408bfjw6uz5k19zk4am50ykmh').get
```

Available Parameters:

- `resource(tournament_id)`
- `tournament(tournament_id)`

--------------------------------------------------------------------------------

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
