class HandleProjectEventJob < BasicHandleEventJob
  private

  def get_handler(action)
    case action
    when 'created' then ProjectCreatedHandler
    when 'edited' then ProjectEditedHandler
    when 'deleted' then ProjectDeletedHandler; end
  end
end
