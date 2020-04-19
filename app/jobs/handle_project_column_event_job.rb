class HandleProjectColumnEventJob < ApplicationJob
  include HandleEventJob
  queue_as :default

  private

  def get_handler(action)
    case action
    when 'created' then ColumnCreatedHandler
    when 'edited' then ColumnEditedHandler
    when 'deleted' then ColumnDeletedHandler; end
  end
end
