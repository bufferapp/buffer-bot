# Description:
#  Kick of a jenkins deploy build 
#
# Commands:
#   hubot deploy <target> - Deploy master to the given envirnonment
#

jenkinsURL           = process.env.HUBOT_CIBOT_URL
jenkinsToken         = process.env.HUBOT_CIBOT_BUILD_TOKEN
jenkinsBuildJobName  = process.env.HUBOT_CIBOT_BUILD_JOB_NAME

module.exports = (robot) ->
  robot.respond /deploy( me)?\s*(.+)?/i, (msg) ->
    msg.send "start"
    target     = msg.match[2] or null
    msg.send "#{target}"
    if !target
      #description = "Requested by #{msg.message.user.name} in #{msg.message.user.room}"
      msg.send "I'm sorry. You need to provide an elastic beanstalk Buffer target"
    else
      msg.send "Great, deploying master to #{target}"
      jobUrl = "#{jenkinsURL}/buildByToken/buildWithParameters?job=#{jenkinsBuildJobName}&token=#{jenkinsToken}&Target=#{target}"
      msg.http(jobUrl)
        .get() (err, res, body) ->
          msg.send body
