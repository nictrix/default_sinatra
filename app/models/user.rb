class User < ActiveRecord::Base
  has_and_belongs_to_many :roles

  attr_accessible :username, :role_ids, :created_at, :updated_at

  public
end
