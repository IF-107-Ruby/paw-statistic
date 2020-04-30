module IssuesHelper
  def decorated_state(issue)
    state_style = case issue.state
                  when 'open' then 'text-success'
                  when 'closed' then 'text-danger'
                  else ''; end
    tag.p(issue.state, class: 'm-0 ' + state_style)
  end
end
