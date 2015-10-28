require 'google/api_client'

namespace :schedule do
  desc "schedule coordinate"
  task coordinate: :environment do
	client = Google::APIClient.new(application_name: '')
	service_account_email = 'service_account_email'

	# 認証
	key = Google::APIClient::KeyUtils.load_from_pkcs12('google_api_key_test.p12', 'notasecret')
	client.authorization = Signet::OAuth2::Client.new(
	  token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
	  audience: 'https://accounts.google.com/o/oauth2/token',
	  scope: 'https://www.googleapis.com/auth/calendar',
	  issuer: service_account_email,
	  signing_key: key)
	client.authorization.fetch_access_token!

	# イベント取得
	calendar = client.discovered_api('calendar', 'v3')
	calendarId = 'calendarId'

	result = client.execute(:api_method => calendar.events.list,
	                        :parameters => {'calendarId' => calendarId})

	# イベント格納
	events = []
	result.data.items.each do |item|
	  events << item
	end

	# 出力
	events.each do |event|
	  puts event.summary
	end
  end
end
