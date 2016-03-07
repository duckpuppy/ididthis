require "rest-client"

module Ididthis
  module API
    # TODO: Investigate using the ActiveResource-style calls
    # Class for accessing the iDoneThis API
    class Client
      attr_writer :token

      def initialize(token)
        @token = token
      end

      def validate_token
        RestClient.get(ENDPOINTS[:noop], header_map) do |response|
          case response.code
          when 200
            return true
          else
            return false
          end
        end
      end

      def teams
        RestClient.get(ENDPOINTS[:team], header_map) do |resp, req, res, &blk|
          case resp.code
          when 200
            response = JSON.parse(resp.body, symbolize_names: true)
            # FIXME: This is not right, need to throw an error when no teams
            #   are found
            response[:ok] ? response[:results] : []
          else
            resp.return!(req, res, &blk)
          end
        end
      end

      def team
        RestClient.get(
          Ididthis::Config[:team], header_map
        ) do |resp, req, res, &blk|
          case resp.code
          when 200
            response = JSON.parse(resp.body, symbolize_names: true)
            response[:ok] ? response[:result] : {}
          else
            resp.return!(req, res, &blk)
          end
        end
      end

      def post_done(done, team, options)
        payload = { raw_text: done, team: team }.merge(options)
        RestClient.post(
          ENDPOINTS[:dones], payload.to_json, header_map) do |response|
          case response.code
          when 201
            puts "Posted your done!"
          else
            puts "Something went wrong, HTTP status code was #{response.code}."
          end
        end
      end

      def dones(options)
        RestClient.get(
          ENDPOINTS[:dones],
          header_map.merge(params: options)
        ) do |response, request, result, &block|
          case response.code
          when 200
            resp = JSON.parse(response, symbolize_names: true)
            resp[:ok] ? resp[:results] : {}
          else
            response.return!(request, result, &block)
          end
        end
      end

      def header_map
        {
          content_type: :json,
          accept: :json,
          Authorization: "Token #{@token}"
        }
      end
    end
  end
end
