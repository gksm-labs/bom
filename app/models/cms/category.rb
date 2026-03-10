# == Schema Information
#
# Table name: cms_categories
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  slug               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  parent_category_id :bigint
#
# Indexes
#
#  index_cms_categories_on_parent_category_id  (parent_category_id)
#  index_cms_categories_on_slug                (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (parent_category_id => cms_categories.id)
#
class Cms::Category < ApplicationRecord
  belongs_to :parent_category, class_name: "Cms::Category", optional: true

  has_many :categories, class_name: "Cms::Category", foreign_key: :parent_category_id
  has_many :pages, class_name: "Cms::Page", foreign_key: :category_id

  validates :name, :slug, presence: true

  def find_page_with_slug(slug)
    pages.published.find_by(slug: slug)
  end

  def to_param
    slug
  end
end
