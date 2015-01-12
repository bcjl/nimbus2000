class Track < ActiveRecord::Base
  validates :title, :uploader_id, presence: true

  belongs_to :uploader, class_name: "User"

  has_many :memberships, class_name: "PlaylistMembership"

  has_many :comments

  has_many :playlists, through: :memberships, source: :playlist

  has_many :likes
  has_many :likers, through: :likes, source: :liker

  has_many :taggings
  has_many :tags, through: :taggings, source: :tag

  has_attached_file :audio
  validates_attachment_content_type :audio, content_type: /\Aaudio\/.*\Z/
end
