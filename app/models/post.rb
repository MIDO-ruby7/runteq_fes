class Post < ApplicationRecord
  require 'nokogiri'
  require 'open-uri'

  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :app_name, presence: true
  validates :app_url, presence: true
  validates :github_url, presence: true
  validates :category_id, presence: true

  attr_accessor :site_description, :site_image

  def fetch_ogp_info
    url = app_url
    charset = nil
    begin
      html = URI.open(url) do |f|
        charset = f.charset
        f.read
      end
      doc = Nokogiri::HTML.parse(html, charset)
      ogp_image_url = doc.css('//meta[property="og:image"]/@content').to_s

      update_column(:ogp_image_url, ogp_image_url) unless ogp_image_url.blank?
      doc
    rescue OpenURI::HTTPError => e
      Rails.logger.error "Failed to fetch OGP info for #{url}: #{e}"
      nil
    rescue SocketError => e
      Rails.logger.error "Failed to open TCP connection for #{url}: #{e}"
      nil
    end
  end

  # def site_discription
  #   doc = fetch_ogp_info
  #   if doc.css('//meta[property="og:description"]/@content').empty?
  #     doc.css('//meta[name$="escription"]/@content').to_s
  #   else
  #     doc.css('//meta[property="og:description"]/@content').to_s
  #   end
  # end

  def site_image
    return ogp_image_url if ogp_image_url.present?

    doc = fetch_ogp_info
    if doc
      doc.css('//meta[property="og:image"]/@content').to_s
    else
      return ""
    end
  end
end
