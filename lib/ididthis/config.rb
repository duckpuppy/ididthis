require "highline/import"
require "yaml"

module Ididthis
  module Config
  module_function

    PATH = ENV["IDIDTHIS_CONFIG"] || File.join(ENV["HOME"], ".ididthis.yml")

    def defaults
      {
        teams: {},
        team: "",
        token: ""
      }
    end

    def [](key)
      configs[key]
    rescue => e
      warn "invalid config file"
      warn e.message
      defaults[key]
    end

    def configure!
      client = Ididthis::API::Client.new
      token = ask_token

      teams = client.get_teams(token)
      team = ask_team
      File.open(PATH, "w") do |f|
        f << { :token => token,
               :team => team[:short_name],
               :teams => teams }.to_yaml
      end
    end

  private

    def configs
      if File.exist?(PATH)
        defaults.merge(YAML.load_file(PATH))
      else
        defaults
      end
    end

    def ask_token
      ask("iDoneThis API Token: ") do |tkn|
        tkn.default = configs[:token]
        tkn.whitespace = :strip
        tkn.responses[:not_valid] = "The token you have entered cannot be validated.  Please try again."
        tkn.responses[:ask_on_error] = :question
        tkn.validate = lambda do |t|
          client.validate_token(t)
        end
      end
    end

    def ask_team
      choose do |menu|
        menu.prompt = "Which team will you be posting dones to? "
        menu.select_by = :index_or_name
        teams.each do |t|
          menu.choice(t[:name]) { t }
        end
      end
    end
  end
end
