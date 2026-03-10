# == Schema Information
#
# Table name: cms_pages
#
#  id          :bigint           not null, primary key
#  content     :text             not null
#  published   :boolean          default(FALSE), not null
#  slug        :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#
# Indexes
#
#  index_cms_pages_on_category_id  (category_id)
#  index_cms_pages_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => cms_categories.id)
#
class Cms::Page < ApplicationRecord
  belongs_to :category, class_name: "Cms::Category"

  validates :title, :slug, :content, presence: true

  scope :published, -> { where(published: true) }

  def self.find_by_path(root_category, slugs)
    if slugs.count == 2
      category = Cms::Category.find_by(parent_category: root_category, slug: slugs.first)
      return nil if category.nil?

      page = category.find_page_with_slug(slugs.last)
      return nil if page.nil?

      [ category, page ]
    elsif slugs.count == 1
      category = Cms::Category.find_by(parent_category: root_category, slug: slugs.first)
      return [ category, nil ] if category

      page = root_category&.find_page_with_slug(slugs.first)
      if page
        [ nil, page ]
      else
        nil
      end
    end
  end

  def to_param
    slug
  end
end
