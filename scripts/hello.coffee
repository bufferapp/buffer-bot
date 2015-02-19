# Description:
#   Bufferbot loves conversation
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Hello or Good Day make hubot say hello to you back
#   Good Morning makes hubot say good morning to you back

hellos = [
    "Well hello there, %",
    "Hey %, Hello!",
    "Marnin', %",
    "Good day, %",
    "Good 'aye!, %",
    "¡Hola %!",

]

mornings = [
    "Good morning, %",
    "Good morning to you too, %",
    "Good day, %",
    "Good 'aye!, %",
    "It's a beautiful day, isn't it %?",
]

nights = [
    "Have a lovely evening %!",
    "Sleep well %",
    "Buenas Noches %"
]

jenkinsOnly = hellos.concat([
    "My man %!!",
    "¡Hola %!",
    "Good 'ol %, always working hard!",
    "Good work %!",
    "%: Can't stop...won't stop",
    "Hey %, we're kind of like Batman and Robin eh?",
    #"\"Bufferbot drops back...throws a deep pass to %....TOUCHDOWN!!!\"",
    "\"Bufferbot up the middle, passes to %...he takes the shot...GOALLLLLLLL!!!\""
])

party = [
    "Did someone say Party???",
    "Party? Did my invite get lost in the mail?"
]

module.exports = (robot) ->

    robot.hear /(hello|good( [d'])?ay(e)?)/i, (msg) ->
        name = msg.message.user.name.toLowerCase()
        if name == 'jenkins' or name == 'build server'
            hello = msg.random jenkinsOnly
            msg.send hello.replace "%", msg.message.user.name
        else
            hello = msg.random hellos
            msg.send hello.replace "%", msg.message.user.name

    robot.hear /(^(good )?m(a|o)rnin(g)?)/i, (msg) ->
        hello = msg.random mornings
        msg.send hello.replace "%", msg.message.user.name

    robot.hear /goodnight/i, (msg) ->
        hello = msg.random nights
        msg.send hello.replace "%", msg.message.user.name

    robot.hear /party/i, (msg) ->
        hello = msg.random party
        msg.send hello.replace "%", msg.message.user.name