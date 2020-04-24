class SetColumnsPrimaryKeyValueToGithubId < ActiveRecord::Migration[6.0]
  class Column < ApplicationRecord
    has_many :cards, dependent: :nullify
    has_many :from_moves,
             class_name: 'CardMove', inverse_of: 'from',
             dependent: :nullify, foreign_key: 'from_id'
    has_many :to_moves,
             class_name: 'CardMove', inverse_of: 'to',
             dependent: :nullify, foreign_key: 'to_id'
  end

  class CardMove < ApplicationRecord
    belongs_to :from, class_name: 'Column'
    belongs_to :to, class_name: 'Column'
  end

  class Card < ApplicationRecord
    belongs_to :column
  end

  def change
    ActiveRecord::Base.transaction do
      Column.all.each do |column|
        new_column_json = column.as_json
        new_column_json[:id] = column.github_id
        new_column_json[:github_id] = column.id
        new_column = Column.create(new_column_json)

        column.cards.each { |card| card.update(column: new_column) }
        column.from_moves.each { |from_move| from_move.update(from: new_column) }
        column.to_moves.each { |to_move| to_move.update(to: new_column) }

        column.destroy
      end
      remove_index :columns, :github_id
      remove_column :columns, :github_id, :integer
    end
  end
end
