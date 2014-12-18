require 'json'
require 'openssl'
require 'faraday'
require 'faraday_middleware'

module Shenzhen::Distribute
  module HockeyApp
    class Client
      HOSTNAME = 'rink.hockeyapp.net'

      def initialize(api_token)
        @api_token = api_token
        @connection = Faraday.new(:url => "https://#{HOSTNAME}") do |builder|
          builder.request :multipart
          builder.request :url_encoded
          builder.response :json, :content_type => /\bjson$/
          builder.use FaradayMiddleware::FollowRedirects
          builder.adapter :net_http
        end
      end

      def upload_build(ipa, options)
        options[:ipa] = Faraday::UploadIO.new(ipa, 'application/octet-stream') if ipa and File.exist?(ipa)

        if dsym_filename = options.delete(:dsym_filename)
          options[:dsym] = Faraday::UploadIO.new(dsym_filename, 'application/octet-stream')
        end

        @connection.post do |req|
          if options[:public_identifier].nil?
            req.url("/api/2/apps/upload")
          else
            req.url("/api/2/apps/#{options.delete(:public_identifier)}/app_versions/upload")
          end
          req.headers['X-HockeyAppToken'] = @api_token
          req.body = options
        end.on_complete do |env|
          yield env[:status], env[:body] if block_given?
        end
      end
    end
  end
end