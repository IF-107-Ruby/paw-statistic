module CardsHelper
  def card_title(card)
    if card.issue
      card.issue.title
    else
      card.note
    end
  end

  def card_details(card)
    if card.last_move
      move = card.last_move
      "Moved by #{move.user.login} #{time_ago_in_words move.moved_at} ago"
    elsif card.issue
      "Opened by #{card.issue.user.login}"
    else
      "Added by #{card.user.login}"
    end
  end
end
