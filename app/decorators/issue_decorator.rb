class IssueDecorator < Draper::Decorator
  delegate_all

  def decorated_state
    state_style = case issue.state
                  when 'open' then 'text-success'
                  when 'closed' then 'text-danger'
                  else ''; end
    h.tag.p(issue.state, class: 'm-0 ' + state_style)
  end
end
