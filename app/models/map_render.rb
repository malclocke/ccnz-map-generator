class MapRender < ActiveRecord::Base
  RENDER_EXECUTABLE = "/home/otm/projects/eqnz-ocitysmap/ocitysmap2-render"
  RENDER_WORK_DIR = "/home/otm/projects"
  OUTPUT_DIR = '/home/otm/projects/eqnz/www/print/custom_maps'
  OUTPUT_URL = 'http://maps.eq.org.nz/print/custom_maps'
  STATUSES = ['pending', 'started', 'complete']
  validates_inclusion_of :status, :in => STATUSES

  belongs_to :map

  default_scope order("created_at DESC").limit(5)

  def to_s
    "#{id} #{map.left} #{map.top} #{map.right} #{map.bottom} #{map.paper_size} #{map.orientation} #{map.include_index} #{map.category_ids.join(',')} #{map.title}"
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

  def render
    self.status = 'started'
    save!
    logger.debug render_command
    if Rails.env == 'production'
      exec "cd #{RENDER_WORK_DIR} && #{render_command}"
    end
    self.status = 'complete'
    save!
  end

  def index_style
    return "plain" unless map.include_index?
    map.orientation == 'portrait' ? "single_page_index_bottom" : "single_page_index_side"
  end

  def filename
    map.title.gsub(' ','_') + '-' + id.to_s
  end

  def categories_as_arguments
    map.categories.map {|c| "-c #{c.id}"}.join(' ')
  end

  def render_command
    "#{RENDER_EXECUTABLE} -L en_NZ.UTF-8 -b #{map.top},#{map.left} #{map.bottom},#{map.right} --paper-format=#{map.paper_size.upcase} -t '#{map.title}' -o #{map.orientation} -l #{index_style} #{categories_as_arguments} -p #{OUTPUT_DIR}/#{filename}"
  end

  def pdf_url
    OUTPUT_URL + '/' + filename + '.pdf'
  end
end
