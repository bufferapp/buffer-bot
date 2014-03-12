jenkinsURL           = process.env.HUBOT_CIBOT_URL
jenkinsToken         = process.env.HUBOT_CIBOT_BUILD_TOKEN
jenkinsBuildJobName  = process.env.HUBOT_JENKINS_BUILD_JOB_NAME

module.exports = (robot) ->
  robot.respond /deploy\s*(.+)?/, (msg) ->
    environment     = msg.match[2] or null
    if !!environment
      #description = "Requested by #{msg.message.user.name} in #{msg.message.user.room}"
        msg.send "I'm sorry. You need to provide an elastic beanstalk Buffer target"
    else
        msg.send "Great, deploying master to #{environment}"
