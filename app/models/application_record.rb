class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def find_or_create(params)
      obj = find_by(github_id: params[:github_id])
      if obj.nil?
        params[:updated_on_github_at] = nil
        obj = create!(params)
      end
      obj
    end

    def find_and_update(params)
      obj = find_by(github_id: params[:github_id])
      obj.update(params) if obj&.updated_on_github_at != params[:updated_on_github_at]
      obj
    end

    def up_to_date?(params)
      obj = find_by(github_id: params[:github_id])
      return false if obj.nil?

      obj.updated_on_github_at == params[:updated_on_github_at]
    end

    def update_or_create(params)
      obj = find_by(github_id: params[:github_id])
      if obj.nil?
        params[:updated_on_github_at] = nil
        obj = create!(params)
      else
        obj.update(params)
      end
      obj
    end
  end
end
