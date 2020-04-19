class HandleProjectCardEventJob < BasicHandleEventJob
  private

  def get_handler(action)
    case action
    when 'created' then CardCreatedHandler
    when 'edited' then CardEditedHandler
    when 'converted' then CardConvertedHandler
    when 'moved' then CardMovedHandler
    when 'deleted' then CardDeletedHandler; end
  end
end
