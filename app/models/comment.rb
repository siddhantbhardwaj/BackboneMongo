class Comment
  include Mongoid::Document
  field :creator_name
  field :content
  embedded_in :forum, :inverse_of => :comments
end
