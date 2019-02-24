# frozen_string_literal: true
require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'NTQ5MTQyOTM4MjA3Mzg3NjQ4.D1PlEw.irnIaTF_j3nGLGaaGovytAQQ_Ss', prefix: 'c!'

puts "This bot's invite URL is: #{bot.invite_url}"

bot.command(:eval, help_available: false) do |event, *args|
    break unless event.user.id == 142890642140299264

    eval args.join(' ')
end

bot.command(:test, description: 'To test if I\'m working') do |_event|
    return 'hello'
end

bot.command(:rps, description: 'Play Rock, Paper, Scissors with me!') do |event, *args|
    playerRPS = args[0].downcase
    botRPS = ["rock", "paper", "scissors"][rand(3)]
    event << "I chose " + botRPS + "!"
    if (playerRPS==('rock'||'r'))
        if (botRPS=='rock')
            event << "That's a draw!"
        elsif (botRPS=='paper')
            event << "I win!"
        else
            event << "You win!"
        end
    elsif (playerRPS==('paper'||'p'))
        if (botRPS=='rock')
            event << "You win!!"
        elsif (botRPS=='paper')
            event << "That's a draw!"
        else
            event << "I win!"
        end
    elsif (playerRPS==("scissors"||"s"))
        if (botRPS=='rock')
            event << "I win!"
        elsif (botRPS=='paper')
            event << "You win!"
        else
            event << "That's a draw!"
        end
    else
        event << "But I am unsure what option you chose"
        event << "Please chose Rock, Paper or Scissors! *(You can use R, P or S too!)*"
    end
end

bot.run