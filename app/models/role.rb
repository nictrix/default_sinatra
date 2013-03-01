class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  attr_accessible :name, :user_ids, :created_at, :updated_at

  public
end
