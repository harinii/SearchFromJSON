require 'rails_helper'

describe SearchController, :type=>:helper do

  it "searches for a user" do
    expect(SearchController.SearchMe("user", "_id", "1")).to_not be_empty
  end

  it "searches for an organization" do
    expect(SearchController.SearchMe("organization", "_id", "101")).to_not be_empty
  end

  it "searches for a ticket" do
    expect(SearchController.SearchMe("ticket", "_id", "436bf9b0-1147-4c0a-8439-6f79833bff5b")).to_not be_empty
  end

  it "returns a message for a bad input" do
    $stdout = StringIO.new
    SearchController.SearchMe("tiicket", "_id", "436bf9b0-1147-4c0a-8439-6f79833bff5b")
    $stdout.rewind
    expect($stdout.gets.strip).to eq('Invalid search. Try again. If you are searching by Ticket Type, make sure the field you specify is ticket_type and NOT just type.')
  end

end
