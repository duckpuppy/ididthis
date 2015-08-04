require 'highline/import'
require 'yaml'

module Ididthis
  module Config
    extend self
    PATH = ENV['IDIDTHIS_CONFIG_FILE'] || File.join(ENV['HOME'], '.ididthis.yml')

    def defaults
      {
        teams: {},
        team: '',
        token: ''
      }
    end

    def [](key)
      configs[key]
    rescue => e
      warn 'invalid config file'
      warn e.message
      defaults[key]
    end

    def configure!
      current = configs
      client = Ididthis::API::Client.new

      token = ask("iDoneThis API Token: ") do |token| 
        token.default = current[:token]
        token.whitespace = :strip
        token.responses[:not_valid] = "The token you have entered cannot be validated.  Please try again."
        token.responses[:ask_on_error] = :question
        token.validate = lambda do |t|
          client.validate_token(t)
        end
      end

      teams = client.get_teams(token)
      team = choose do |menu|
        menu.prompt = "Which team will you be posting dones to? "
        menu.select_by = :index_or_name
        teams.each do |team|
          menu.choice(team[:name]) {
            team
          }
        end
      end

      File.open(PATH, 'w') do |f|
        f << { :token => token, :team => team[:short_name], :teams => teams }.to_yaml
      end
    end

    def configs
      if File.exist?(PATH)
        defaults.merge(YAML.load_file(PATH))
      else
        defaults
      end
    end
  end
end
