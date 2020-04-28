class HandleEventJob < ApplicationJob
  HANDLERS = ActiveSupport::HashWithIndifferentAccess.new(
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
  ).freeze

  queue_as :default

  def perform(event_type, data)
    event = EventStruct.new event_type, data
    handler = get_handler(event)
    handler.execute!
  end

  private

  NullHandler = Class.new do
    def initialize(_); end

    def execute!; end
  end

  def get_handler(event)
    handler_class(event.type, event.action).new(event)
  end

  def handler_class(type, action)
    HANDLERS.dig(type, action) || NullHandler
  end
end
