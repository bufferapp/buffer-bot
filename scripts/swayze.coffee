# To celebrate legancy actor Patrick Swayze

swayzes = [
  'http://images.askmen.com/entertainment/special_feature_300/347_patrick-swayze-5-things-you-didnt-know_flash.jpg'
  'https://media3.giphy.com/media/v22JfwLFi6nNS/giphy.gif'
  'https://media0.giphy.com/media/69OUouHRzrvcA/giphy.gif'
  'https://media.giphy.com/media/a50HSsMdJhSuY/giphy.gif'
]

module.exports = (robot) ->

  robot.hear /swayze/i, (msg) ->
    swayze = swayzes[ Math.floor(Math.random() * swayzes.length) ]
    msg.send swayze
