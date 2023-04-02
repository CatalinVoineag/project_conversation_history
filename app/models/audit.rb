class Audit < Audited::Audit
  def decorate
    AuditDecorator.new(self)
  end
end
