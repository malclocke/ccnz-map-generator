class Map < ActiveRecord::Base
  PAPER_SIZES = ["a4", "a3", "a2", "a1", "a0"]
  validates_inclusion_of :paper_size, :in => PAPER_SIZES

  ORIENTATIONS = ["landscape", "portrait"]
  validates_inclusion_of :orientation, :in => ORIENTATIONS

  validates_presence_of :title, :left, :right, :top, :bottom

  validates_format_of :title, :with => /\A[\w ]+\z/

  has_and_belongs_to_many :categories do
    def to_s
      map(&:title).to_sentence
    end
  end

  has_many :map_renders
  # Create a new render on first request
  after_create :generate_first_render

  # Return map bounds in a human readable form
  def bounds
    "#{top},#{left}:#{bottom},#{right}"
  end

  def generate_first_render
    map_renders.create!
  end
end
