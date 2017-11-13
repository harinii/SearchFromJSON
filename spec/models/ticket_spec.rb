require 'rails_helper'

RSpec.describe Ticket, :type=>:model do
  describe "#find_by_id" do
    it "finds the right value by id" do
      expect(Ticket.find_by_id("436bf9b0-1147-4c0a-8439-6f79833bff5b")).to_not be_empty
    end

    it "raises an exception if record is not found" do
      expect{
         Ticket.find_by_id("abc")
       }.to raise_error(Exception, "No Records Found")
    end
  end

  describe "#find_by" do
    it "finds the right record by a given field and value" do
      expect(Ticket.find_by("subject", "A Catastrophe in Korea (North)")).to_not be_empty
    end

    it "searches and finds the records based on tags" do
      expect(Ticket.find_by("tags", "Ohio")).to_not be_empty
    end

    it "raises an exception if the field (column name) is invalud" do
      expect{
         Ticket.find_by("abc", "1")
       }.to raise_error(Exception, "Invalid field name")
    end

    it "raises an exception if there are no matching records" do
      expect{
         Ticket.find_by("subject", "abc")
       }.to raise_error(Exception, "No Records Found")
    end

    it "raises an exception if the tag does not exist" do
      expect{
         Ticket.find_by("tags", "XYZ")
       }.to raise_error(Exception, "No Records Found")
    end
  end
end
