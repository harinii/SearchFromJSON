class SearchController < ApplicationController
  def self.SearchMe(object, field, value)
    object = object.downcase
    begin
      if(object === "user")
        users = User.find_by(field, value)
        ap "Could not find a valid record"
        users.each do |u|
          ap "USER INFORMATION"
          ap u
          ap "ORGANIZATION"
          org = Organization.find_by_id(u['organization_id'])
          ap org
          ap "TICKETS SUBMITTED "
          ap Ticket.find_by("submitter_id", u['_id'])
          ap "TICKETS ASSIGNED"
          ap Ticket.find_by("assignee_id", u['_id'])
        end
      elsif(object === "ticket")
        # begin
          tickets = Ticket.find_by(field, value)
        tickets.each do |t|
          ap "TICKET"
          ap t
          ap "SUBMITTER INFORMATION"
          ap User.find_by_id(t['submitter_id'])
          ap "ASSIGNEE INFORMATION"
          ap User.find_by_id(t['assignee_id'])
          ap "ORGANIZATION"
          ap Organization.find_by_id(t['organization_id'])
        end

      elsif(object === "organization")
        orgs = Organization.find_by(field, value)
        orgs.each do |o|
          ap "ORGANIZATION"
          ap o
          ap "USER INFORMATION"
          ap User.find_by("organization_id", o['_id'])
          ap "TICKETS"
          ap Ticket.find_by("organization_id", o['_id'])
        end
      else
        puts "Invalid search. Try again. If you are searching by Ticket Type, make sure the field you specify is ticket_type and NOT just type."
      end
    rescue Exception => e
        ap e.message
    end
  end
end
