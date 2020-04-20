module IssuesHelper
  def issue_state(issue)
    state_style = case issue.state
                  when 'open' then 'text-success'
                  when 'closed' then 'text-danger'; end
    tag.p issue.state, class: 'm-0 ' + state_style
  end
end
