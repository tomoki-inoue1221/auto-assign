# Description:
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>

request = require('request')

module.exports = (robot) ->
robot.hear /test (.*)?/, (msg) ->
  text = msg.match[1]
  request.get
    url: "https://slack.com/api/users.list?token=#xoxb-798159158694-872178173682-45UMZ4OS8DimDiX8vkO7bmMT"
    , (err, response, body) ->
    # Slack APIからメンバーを取得      
      memberid = (member.id for member in JSON.parse(body).members when member.profile.display_name is text)
      msg.send "<@#{memberid}>"
      