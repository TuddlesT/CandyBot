# frozen_string_literal: true
require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'MjIxMTY1ODMwOTg4MjM0NzUy.Dz_wVA.tI-P1AbgkiF7nrAAUS37vB9923Y', prefix: '!'

puts "This bot's invite URL is: #{bot.invite_url}"

mark = ''

bot.command(:mark, help_available: false) do |event, *args|
    break unless event.user.id == 109792060256616448 
    
    c = args[0]
    args = args - [args[0]]

    case c
    when 'this'
        mark = event
        return 'Message has been marked'

    when 'get'
        begin
            eval 'mark.' + args.join('.')
        rescue StandardError
            'Invalid event property'
        end

    else
        #
    end

end

bot.command(:eval, help_available: false) do |event, *args|
    break unless event.user.id == 109792060256616448

    begin
        eval args.join(' ')
    rescue StandardError
        'An error occurred 😞'
    end
end

bot.command(:EVAL, help_available: false) do |event, *args|
    break unless event.user.id == 109792060256616448

    eval args.join(' ')
end

bot.run