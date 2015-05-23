# https://www.rocketmarketinginc.com/blog/get-never-expiring-facebook-page-access-token/

require 'net/http'
require 'pry'

app_id = "1607394492865722"
app_secret = "cc45ac4dc33f8955e1e06c10d64737a5"
access_token = IO.read('token')
#access_token = "CAAW16rHC3LoBABJqKz0teTZAWwRvnZBUtAnZC0eGF6CMbZC9rrcqtbD2OkuhGuX9WPi2F5FyRmCQdLrTU2VZCYP7yFra2AZBFhoMbAxb3RXFtRreZBilm82l8bDms4lcCm6mye5VsNQoZA0Vn2ugdN5kwZCmOXICViuFh0DwkmhCpXx30jj48JwouCPXhKzfg0ck5GW3GvIAOCdjD8b24HL3gi"
s = "https://graph.facebook.com/oauth/access_token?client_id=#{app_id}&client_secret=#{app_secret}&grant_type=fb_exchange_token&fb_exchange_token=#{access_token}"
uri = URI(s)
t = Net::HTTP.get(uri)
IO.write('token', t[/access_token=(.*)&/, 1])
