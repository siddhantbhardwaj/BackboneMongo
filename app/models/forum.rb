class Forum
  include Mongoid::Document
  field :creator_name
  field :title
  field :content
  validates :creator_name, :title, :content, :presence => true  
  embeds_many :comments
end
