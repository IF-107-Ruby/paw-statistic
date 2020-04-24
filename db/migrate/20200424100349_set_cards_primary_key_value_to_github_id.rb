class SetCardsPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  class Card < ApplicationRecord
    has_many :moves, class_name: 'CardMove', dependent: :nullify
  end

  class CardMove < ApplicationRecord
    belongs_to :card
  end

  def change
    ActiveRecord::Base.transaction do
      Card.all.each do |card|
        new_card_json = card.as_json
        new_card_json[:id] = card.github_id
        new_card_json[:github_id] = card.id
        new_card = Card.create(new_card_json)

        card.moves.each { |move| move.update(card: new_card) }

        card.destroy
      end
      remove_index :cards, :github_id
      remove_column :cards, :github_id, :integer
    end
  end
end
