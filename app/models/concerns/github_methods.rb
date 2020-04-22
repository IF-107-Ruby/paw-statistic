module GithubMethods
  extend ActiveSupport::Concern

  class_methods do
    def up_to_date?(params)
      coerced_params = params.as_json
      obj = find_by(
        github_id: coerced_params[:github_id],
        updated_on_github_at: coerced_params[:updated_on_github_at]
      )
      obj.present?
    end

    def update_or_create(params)
      coerced_params = params.is_a?(Hash) ? params : params.as_json
      obj = find_by(github_id: coerced_params[:github_id])
      if obj.nil?
        obj = create(coerced_params)
      elsif obj.updated_on_github_at != coerced_params[:updated_on_github_at]
        obj.update(coerced_params)
      end
      obj
    end
  end
end
