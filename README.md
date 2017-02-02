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

## Using Guide

This Gem is just a class builder for the APIs, every api have a Class for it, and for every api's parameters there are methods to build them, and those parameter methods are explained down below for each Class.

### Available Classes :

Available Feeds                   |                       Class                       | API End Point
--------------------------------- | :-----------------------------------------------: | ------------------------------------
Fixtures and Results              |         [Match](#1-fixtures-and-results)          | `/soccerdata/match/...`
Match Statistics                  |      [MatchStatistics](#2-match-statistics)       | `/soccerdata/matchstats/...`
Match Events                      |           [MatchEvent](#3-match-events)           | `/soccerdata/matchevent/...`
Pass Matrix and Average Formation | [PassMatrix](4-pass-matrix-and-average-formation) | `/soccerdata/passmatrix/...`
Possession                        |            [Possession](#5-possession)            | `/soccerdata/possession/...`
Commentary                        |            [Commentary](#6-commentary)            | `/soccerdata/Commentary/...`
Match Facts                       |           [MatchFacts](#7-match-facts)            | `/soccerdata/matchfacts/...`
Seasonal Stats                    |        [SeasonalStats](#8-seasonal-stats)         | `/soccerdata/seasonstats/...`
Squads                            |                [Squads](#9-squads)                | `/soccerdata/squads/...`
Team Standings                    |        [TeamStandings](#10-team-standings)        | `/soccerdata/standings/...`
Player Career                     |         [PlayerCareer](#11-player-career)         | `/soccerdata/playercareer/...`
Tournament Calendars              |  [TournamentCalendar](#12-tournament-calendars)   | `/soccerdata/tournamentcalendar/...`
Match Preview                     |         [MatchPreview](#13-match-preview)         | `/soccerdata/matchpreview/...`
Rankings                          |             [Rankings](#14-rankings)              | `/soccerdata/rankings/...`
Tournament Schedule               |   [TournamentSchedule](#15-tournament-schedule)   | `/soccerdata/tournamentschedule/...`

### Parameter Methods :

Parameters are changed in this gem to be more readable, and will be transulated to Opta keys in the backend.

There are two types of parameters, _core_ parameters that can be used in all apis, and _api parameters_ those are specific for each api.

Core Parameters are have ___ prefix, and they are:

Method         | Actual Parameter
-------------- | ----------------
`_rt`          | `_rt`
`_format`      | `_fmt`
`_locale`      | `_lcl`
`_callback`    | `_clbk`
`_sort`        | `_ordSrt`
`_page_size`   | `_pgSz`
`_page_number` | `_pgNm`

### Example of using core parameters

```ruby
OptaSD::Soccer::Match.new.competition('722fdbecxzcq9788l6jqclzlw').time_range(Time.now - 86400, Time.now + 86400).get
```

### Response Format

OPTA SD provides the response in `json` and `xml` format, you can use `_format` method to define the required response format, `json` is the default.

JSON response will be Parsed by `JSON.parse` and XML will be parsed by `nokogiri` gem. you can override `parse_xml` method from Core class in case you need to change the behaviour.

--------------------------------------------------------------------------------

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
- `status(status)` statuses : (`all` - `fixture` - `played` - `playing` - `cancelled` - `postponed` - `suspended`)
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
- `person(person_id)`
- `contestant(contestant_id)`
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

- `competition(competition_id)`
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
