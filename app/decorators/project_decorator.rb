class ProjectDecorator < SimpleDelegator
  def ordered_timeline_items 
    decorated_timeline_items.sort_by(&:created_at)
  end

  private
  
  def decorated_timeline_items
    timeline_items.map(&:decorate)
  end

  def timeline_items
    (audits + comments)
  end
end
