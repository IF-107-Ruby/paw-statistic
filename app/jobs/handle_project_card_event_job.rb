class HandleProjectCardEventJob < BasicHandleEventJob
  private

  def handler_class(action)
    case action
    when 'created' then CardCreatedHandler
    when 'edited' then CardEditedHandler
    when 'converted' then CardConvertedHandler
    when 'moved' then CardMovedHandler
    when 'deleted' then CardDeletedHandler
    else super; end
  end
end
