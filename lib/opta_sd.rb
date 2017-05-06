# Project Requirements
require 'yaml'
require 'json'
require 'time'
require 'nokogiri'
require 'net/http'

# Core Classes
require 'opta_sd/core'
require 'opta_sd/error'
require 'opta_sd/soccer/soccer'
require 'opta_sd/soccer/match'
require 'opta_sd/soccer/squads'
require 'opta_sd/soccer/rankings'
require 'opta_sd/soccer/commentary'
require 'opta_sd/soccer/possession'
require 'opta_sd/soccer/match_event'
require 'opta_sd/soccer/match_facts'
require 'opta_sd/soccer/pass_matrix'
require 'opta_sd/soccer/player_career'
require 'opta_sd/soccer/match_preview'
require 'opta_sd/soccer/seasonal_stats'
require 'opta_sd/soccer/team_standings'
require 'opta_sd/soccer/match_statistics'
require 'opta_sd/soccer/tournament_calendar'
require 'opta_sd/soccer/tournament_schedule'
require 'opta_sd/soccer/venues'


# Wrapper Classes
# Soon

# Add present? to Object
class Object
  def present?
    !blank?
  end
end

class NilClass
  def blank?
    nil?
  end
end
