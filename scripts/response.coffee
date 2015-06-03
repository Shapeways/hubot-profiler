# Description
#   Provides response time of a website
# Commands
#   hubot response time of <url> -- returns time it takes to make an ajax GET request to the desired website
# URLS:
#   /hubot/response
# Notes:
#   These commands are grabbed from comment blocks at the top of each file.
url = require('url')
request = require('request')

getResponseTime = (robot, msg) ->

  URL = msg.match[1]
  parsed = url.parse(URL)
  preface1 = "http://"

  if parsed.protocol == null
    URL = preface1 + URL

  start_time = new Date().getTime()
  request.get(URL, (err, res, body) ->
    if err
      msg.send "Error encountered, unable to reach #{URL}: #{err}"
    else
      if 200 <= res.statusCode < 400
        request_time = (new Date().getTime() - start_time)
        request_time_seconds = request_time / 1000
        msg.send "Response from #{URL} in #{request_time_seconds} seconds (#{request_time} milliseconds)"
        msg.send "Response code #{res.statusCode}"
      else
        msg.send "Unable to obtain response from #{URL}, code #{res.statusCode}"
  )
module.exports = (robot) ->
  robot.respond /response time of (.*)/i, (msg) ->
    getResponseTime robot, msg
