# Description:
#  Listens for "hangout" keyword and sends Google Hangout url. Saves a couple minutes in our office.
#
# Configuration:
#  none
#
# Commands:
#   hubot hangout <[e]ng,[s]tandup,[c]aretakers>- sends hangout url
#
# Notes:
#  To generate a static Hangout URL, create a Google+ event sometime in the future
#  @ https://plus.google.com/events
#
# Author:
#   sunils34

module.exports = (robot) ->
  robot.respond /hangout\s?(@w+)?(.*)/i, (msg) ->

    rooms = [
      'http://bit.ly/bufferstandup',
      'http://bit.ly/engineeringatbuffer',
      'http://bit.ly/joiningbuffer'
    ];

    type = msg.match[2] #second type
    if /stand/i.test(type) || type == 's'
      msg.send rooms[0]
    else if /eng/i.test(type) || type == 'e'
      msg.send rooms[1]
    else if /join/i.test(type) || type == 'j'
      msg.send rooms[2]
    else
      rooms_msg = 'Rooms:\n'
      for room in rooms
        rooms_msg += room + '\n'
      msg.send rooms_msg
    

