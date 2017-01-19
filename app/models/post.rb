class Post < ActiveRecord::Base
  belongs_to :blog
  has_many :messages, :dependent => :destroy
  validates :content, presence: true
  validates :title, presence: true,  :length => { :minimum => 7 }

end
