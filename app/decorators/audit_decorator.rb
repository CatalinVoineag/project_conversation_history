class AuditDecorator < SimpleDelegator
  def timeline_message
    "#{user.email} #{operation} #{operation_after_message}" 
  end

  private

  def operation
    case action
    when "update"
      "changed"
    when "create"
      "created"
    when "destroy"
      "deleted"
    end
  end

  def operation_after_message
    if action == "update"
      "from #{from_value} to #{to_value}"
    else
      "this project"
    end
  end

  def changed_column
    audited_changes.keys.first
  end

  def change_trail
    audited_changes.values.flatten
  end

  def from_value
    change_trail.first
  end

  def to_value
    change_trail.last
  end
end
