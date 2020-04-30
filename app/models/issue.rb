class Issue < ApplicationRecord
  include GithubMethods
  scope :order_by_state, lambda {
                           order("CASE issues.state
                                    WHEN 'open'   THEN '1'
                                    WHEN 'closed' THEN '2'
                                  END")
                         }

  belongs_to :user
  has_one :card, dependent: :destroy
  belongs_to :assignee, class_name: 'User', optional: true

  def remove_assignee
    update(assignee: nil)
  end

  def self.sync(json)
    struct = IssueStruct.new(json)
    return if up_to_date?(struct)

    from_struct(struct)
  end

  def self.from_struct(struct)
    user = User.update_or_create(struct.user)
    assignee = User.update_or_create(struct.assignee) if struct.assignee

    update_or_create(
      struct.with_params(user: user, assignee: assignee)
    )
  end
end
