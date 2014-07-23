class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :request
  belongs_to :guide
  belongs_to :post

  validates_uniqueness_of :user_id, scope: [:request_id, :vote_type]



end
