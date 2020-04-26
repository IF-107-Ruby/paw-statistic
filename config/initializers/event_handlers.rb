Rails.application.configure do
  config.x.event_handlers = ActiveSupport::HashWithIndifferentAccess.new(
    project_card: {
      created: ProjectCardCreatedHandler,
      edited: ProjectCardEditedHandler,
      converted: ProjectCardConvertedHandler,
      moved: ProjectCardMovedHandler,
      deleted: ProjectCardDeletedHandler
    },
    issues: {
      opened: IssueOpenedHandler,
      edited: IssueEditedHandler,
      assigned: IssueAssignedHandler,
      unassigned: IssueUnassignedHandler,
      closed: IssueClosedHandler,
      deleted: IssueDeletedHandler
    }
  )
end
