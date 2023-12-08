# frozen_string_literal: true

# Used to render reactions in views
module ReactionsHelper
  def reaction_emoji(reaction_type)
    case reaction_type
    when 'thumbs_up'
      '👍'
    when 'thumbs_down'
      '👎'
    when 'heart'
      '❤️'
    when 'clap'
      '👏'
    else
      '' # Default case
    end
  end
end
