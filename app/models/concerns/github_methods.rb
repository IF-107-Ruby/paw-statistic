module GithubMethods
  extend ActiveSupport::Concern

  class_methods do
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
      elsif obj.updated_on_github_at != params[:updated_on_github_at]
        obj.update(params)
      end
      obj
    end
  end
end
