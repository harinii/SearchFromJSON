class Ticket < ApplicationRecord
  self.primary_key = "_id"

  def self.find_by_id(ticket_id)
    t = Ticket.where("_id = ?", ticket_id)
    raise Exception.new "No Records Found" unless not t.empty?
    t
  end

  def self.find_by(field, value)
    raise Exception.new "Invalid field name" unless Ticket.column_names.include? field
    if(field == "tags")
      t = Ticket.where("tags LIKE '%" + value + "%'")
    else
      t = Ticket.where(field => value)
    end
    raise Exception.new "No Records Found" unless not t.empty?
    t
  end

end
