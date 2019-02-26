# frozen_string_literal: true
require 'discordrb'


bot = Discordrb::Commands::CommandBot.new token: 'NTQ5MTQyOTM4MjA3Mzg3NjQ4.D1PlEw.irnIaTF_j3nGLGaaGovytAQQ_Ss', prefix: 'c!'

puts "This bot's invite URL is: #{bot.invite_url}"

bot.command(:eval, help_available: false) do |event, *args|
    break unless event.user.id == (142890642140299264 || 109792060256616448)

    eval args.join(' ')
end

bot.command(:status, help_available: false) do |event, *args|
    break unless event.user.id == (142890642140299264 || 109792060256616448)

    bot.update_status('online', args.join(' '), nil)
end

bot.command(:test, description: 'To test if I\'m working') do |_event|
    return 'hello'
end

bot.command(:rps, description: 'Play Rock, Paper, Scissors with me!') do |event, *args|
    playerRPS = args[0].downcase
    botRPS = ["rock", "paper", "scissors"][rand(3)]
    event << "I chose " + botRPS + "!"
    if (playerRPS=='rock')
        if (botRPS=='rock')
            event << "That's a draw!"
        elsif (botRPS=='paper')
            event << "I win!"
        else
            event << "You win!"
        end
    elsif (playerRPS=='paper')
        if (botRPS=='rock')
            event << "You win!!"
        elsif (botRPS=='paper')
            event << "That's a draw!"
        else
            event << "I win!"
        end
    elsif (playerRPS=="scissors")
        if (botRPS=='rock')
            event << "I win!"
        elsif (botRPS=='paper')
            event << "You win!"
        else
            event << "That's a draw!"
        end
    else
        event << "But I am unsure what option you chose"
        event << "Please chose Rock, Paper or Scissors!"
    end
end

bot.command(:roll, description: 'Roll a dice of any value') do |_event, *args|
    return 'You can only roll a one or above' unless args[0].to_i >= 1
    return 'You rolled a ' + (rand((args[0]||6).to_i) + 1).to_s
end

bot.command(:coin, description: 'Flip a two-sided coin') do |_event|
    return 'You landed on ' + ['heads', 'tails'][rand(2)]
end

bot.command(:glittertrivia, description: 'Send a random fact about Glitter Force') do |event|
    fact = [rand(8) + 1].to_i
    if (fact == 1)
        event << "**Fact #1:**"
        event << "In Japan, Glitter Force is called *Smile PreCure!*"
    elsif (fact == 2)
        event << "**Fact #2:**"
        event << "Glitter Force was given a sequel, *Glitter Force Doki Doki*."
    elsif (fact == 3)
        event << "**Fact #3:**"
        event << "When Glitter Force was dubbed in English, 8 of the 48 episodes were removed. This is mostly due to cultural differences."
    elsif (fact == 4)
        event << "**Fact #4:**"
        event << "Glitter Force was not only an anime, but a manga, video game and a short film."
    elsif (fact == 5)
        event << "**Fact #5:**"
        event << "Glitter Force was a sequel to the anime \'Pretty Cure\'. However, it was never dubbed in English."
    elsif (fact == 6)
        event << "**Fact #6:**"
        event << "The director of Glitter Force, Takashi Otsuka, also worked on Highschool DXD and the Fullmetal Alchemist film."
    elsif (fact == 7)
        event << "**Fact #7:**"
        event << "Brute, one of the villians in Glitter Force, is based off of Onis, which are basically Japanese trolls."
    elsif (fact == 8)
        event << "**Fact #8:**"
        event << "The world of Glitter Force is based on fairy tales. This is shown with examples such as one of the villians being a *big bad wolf*, and the main characters love of all fairy tales."
    else
    end

<<<<<<< HEAD
bot.run
=======
bot.run
>>>>>>> f18f80a8716bb1f0f19cad62d3660ac0cdcab19d
