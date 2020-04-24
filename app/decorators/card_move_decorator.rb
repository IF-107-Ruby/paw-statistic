class CardMoveDecorator < Draper::Decorator
  delegate_all

  def timespan
    "Moved to #{to.name} for " +
      h.distance_of_time_in_words(moved_at, next_move&.moved_at || Time.zone.now)
  end
end
