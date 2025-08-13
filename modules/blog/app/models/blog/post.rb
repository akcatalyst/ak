module Blog
  class Post < ApplicationRecord
    # belongs_to :author, class_name: 'User', optional: true
    # belongs_to :category, class_name: 'Blog::Category', optional: true
    # has_many :comments, class_name: 'Blog::Comment', dependent: :destroy
    # has_many :post_tags, class_name: 'Blog::PostTag', dependent: :destroy
    # has_many :tags, through: :post_tags, class_name: 'Blog::Tag'
    
    validates :title, presence: true
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: true
    
    scope :published, -> { where(published: true).where('published_at <= ?', Time.current) }
    
    before_validation :generate_slug, if: :title_changed?
    
    def to_param
      slug
    end
    
    private
    
    def generate_slug
      self.slug = title.parameterize
    end
  end
end 