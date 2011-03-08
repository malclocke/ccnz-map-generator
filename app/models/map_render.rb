class MapRender < ActiveRecord::Base
  STATUSES = ['pending', 'started', 'complete']
  validates_inclusion_of :status, :in => STATUSES

  belongs_to :map

  validates_presence_of :url, :if => :complete

  default_scope order("created_at DESC").limit(5)

  def to_s
    "#{id} #{map.left} #{map.top} #{map.right} #{map.bottom} #{map.paper_size} #{map.include_index} #{map.category_ids.join(',')} #{map.title}"
  end

  def pending
    status == 'pending'
  end
  def started
    status == 'started'
  end
  def complete
    status == 'complete'
  end
end
