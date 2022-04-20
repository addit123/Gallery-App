class Album < ApplicationRecord
  validates :title, :name, :description, presence: true
  validates :title, :name, :description, :length => { :minimum => 3 }
  validates :cover_image, :presence => true
  validates :all_tags, :presence => true

  has_one_attached :cover_image
  has_many_attached :images, :dependent => :destroy

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  scope :published, -> { where(publish: true) }
  scope :unpublished, -> { where(publish: false) }

  belongs_to :user

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    tags.map(&:name).join(", ")
  end
end
