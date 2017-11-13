class Organization < ApplicationRecord
  self.primary_key = "_id"

  def self.find_by_id(id)
    o = Organization.where("_id = ?", id)
    raise Exception.new "No Records Found" unless not o.empty?
    o
  end

  def self.find_by(field, value)
    raise Exception.new "Invalid field name" unless Organization.column_names.include? field
    if (field == "domain_names")
      o = Organization.where("domain_names LIKE '%" + value + "%'")
    elsif (field == "tags")
      o = Organization.where("tags LIKE '%" + value + "%'")
    else
      o = Organization.where(field => value)
    end
    raise Exception.new "No Records Found" unless not o.empty?
    o
  end

end
