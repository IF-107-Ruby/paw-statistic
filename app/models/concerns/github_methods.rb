module GithubMethods
  extend ActiveSupport::Concern

  class_methods do
    def up_to_date?(source)
      obj = find_by(id: source.id, updated_on_github_at: source.updated_on_github_at)
      obj.present?
    end

    def update_or_create(source)
      obj = find_by(id: source.id)
      if obj.nil?
        obj = create(source)
      elsif obj.updated_on_github_at != source.updated_on_github_at
        obj.update(source)
      end
      obj
    end
  end
end
