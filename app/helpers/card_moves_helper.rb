module CardMovesHelper
  def timespan_of_move(card_move)
    "Moved to #{card_move.to.name} for " +
      distance_of_time_in_words(card_move.moved_at,
                                card_move.next_move&.moved_at || Time.zone.now)
  end
end
