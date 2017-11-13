require 'rails_helper'

RSpec.describe Organization, :type=>:model do
  describe "#find_by_id" do
    it "finds the right value by id" do
      expect(Organization.find_by_id("119")).to_not be_empty
    end

    it "raises an exception if record is not found" do
      expect{
         Organization.find_by_id("abc")
       }.to raise_error(Exception, "No Records Found")
    end
  end

  describe "#find_by" do
    it "finds the right record by a given field and value" do
      expect(Organization.find_by("name", "Enthaze")).to_not be_empty
    end

    it "searches and finds the records based on tags" do
      expect(Organization.find_by("tags", "West")).to_not be_empty
    end

    it "searches and finds the records based on domain_names" do
      expect(Organization.find_by("domain_names", "trollery.com")).to_not be_empty
    end

    it "raises an exception if the field (column name) is invalud" do
      expect{
         Organization.find_by("abc", "1")
       }.to raise_error(Exception, "Invalid field name")
    end

    it "raises an exception if there are no matching records" do
      expect{
         Organization.find_by("name", "abc")
       }.to raise_error(Exception, "No Records Found")
    end

    it "raises an exception if the tag does not exist" do
      expect{
         Organization.find_by("tags", "XYZ")
       }.to raise_error(Exception, "No Records Found")
    end

    it "raises an exception if the domain_name does not exist" do
      expect{
         Organization.find_by("domain_names", "XYZ")
       }.to raise_error(Exception, "No Records Found")
    end
  end
end
