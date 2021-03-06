# frozen_string_literal: true
require 'discordrb'
require 'yaml'

bot_token = ENV['BOT_TOKEN'] || File.open('Key.conf', 'r').read.to_s

bot = Discordrb::Commands::CommandBot.new token: bot_token, prefix: 'c!'

puts "This bot's invite URL is: #{bot.invite_url}"



BOT_ADMINS = YAML.load(File.open('Config.conf', 'r').read)['Admins']

def is_admin (user)
    return BOT_ADMINS.include? user
end


bot.command(:eval, help_available: false) do |event, *args|
    break unless is_admin(event.user)

    eval args.join(' ')
end

bot.command(:status, help_available: false) do |event, *args|
    break unless is_admin(event.user)

    bot.update_status('online', args.join(' '), nil)
end

bot.command(:test, description: 'To test if I\'m working') do |_event|
    return 'hello'
end

bot.command(:rps, description: 'Play Rock, Paper, Scissors with me!') do |event, *args|
    bot_int = rand(3)
    event << "I chose #{['rock', 'paper', 'scissors'][bot_int]}!"

    player_int = {'rock' => 0, 'r' => 0, 'paper' => 1, 'p' => 1, 'scissors' => 2, 's' => 2}[player_choice.to_s.downcase]
    if player_int = nil
        event << 'But I am unsure what option you chose'
        return 'Please chose Rock, Paper or Scissors! (or R, P or S)'
    end

    ['That\'s a draw!', 'You Win!', 'I win!'][(bot_int - player_int) % 3]
end

bot.command(:roll, description: 'Roll a dice of any value') do |_event, *args|
    return 'You can only roll a one or above' unless args[0].to_i >= 1
    return 'You rolled ' + (rand((args[0]||6).to_i) + 1).to_s
end

bot.command(:coin, description: 'Flip a two-sided coin') do |_event|
    return 'You landed on ' + ['heads', 'tails'][rand(2)]
end

bot.command(:glittertrivia, description: 'Send a random fact about Glitter Force') do |event|
    facts = YAML.load(File.open('Config.conf', 'r').read)['Facts']
    fact_id = rand(facts.length).to_i
    event << "**Fact ##{fact_id.to_s}:**"
    event << facts[fact_id]
end


bot.run true
STARTUP = YAML.load(File.open('Config.conf', 'r').read)['Startup']

bot.update_status('online', STARTUP['Status'], nil)

for each in BOT_ADMINS 
    bot.send_temporary_message(bot.users[each].pm, STARTUP['Message'], STARTUP['Time'])
end

bot.join



