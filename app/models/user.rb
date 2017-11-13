require "awesome_print"

class User < ApplicationRecord

  self.primary_key = "_id"
  def self.find_by_id(id)
    u = User.where("_id = ?", id)
    raise Exception.new "No Records Found" unless not u.empty?
    u
  end

  def self.find_by(field, value)
    raise Exception.new "Invalid field name" unless User.column_names.include? field
    if(field == "tags")
      u = User.where("tags LIKE '%" + value + "%'")
    else
      u = User.where(field => value)
    end
    raise Exception.new "No Records Found" unless not u.empty?
    u
  end
end
