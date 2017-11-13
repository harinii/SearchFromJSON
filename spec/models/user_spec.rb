require 'rails_helper'

RSpec.describe User, :type=>:model do
  describe "#find_by_id" do
    it "finds the right value by id" do
      expect(User.find_by_id("38")).to_not be_empty
    end

    it "raises an exception if record is not found" do
      expect{
         User.find_by_id("abc")
       }.to raise_error(Exception, "No Records Found")
    end
  end

  describe "#find_by" do
    it "finds the right record by a given field and value" do
      expect(User.find_by("name", "Cross Barlow")).to_not be_empty
    end

    it "searches and finds the records based on tags" do
      expect(User.find_by("tags", "Springville")).to_not be_empty
    end

    it "raises an exception if the field (column name) is invalud" do
      expect{
         User.find_by("abc", "1")
       }.to raise_error(Exception, "Invalid field name")
    end

    it "raises an exception if there are no matching records" do
      expect{
         User.find_by("name", "1")
       }.to raise_error(Exception, "No Records Found")
    end

    it "raises an exception if the tag does not exist" do
      expect{
         User.find_by("tags", "XYZ")
       }.to raise_error(Exception, "No Records Found")
    end
  end
end
