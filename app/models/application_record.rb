class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create(params)
    super(params.to_hash)
  end

  def update(params)
    super(params.to_hash)
  end
end
