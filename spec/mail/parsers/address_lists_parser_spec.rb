# encoding: utf-8
require 'spec_helper'

describe "AddressListsParser" do
  it "should parse an address" do
    text = 'Mikel Lindsaar <test@lindsaar.net>, Friends: test2@lindsaar.net, Ada <test3@lindsaar.net>;'
    a = Mail::Parsers::AddressListsParser.new
    a.parse(text).should_not be_nil
  end

  it "should parse an address list separated by semicolons" do
    text = 'Mikel Lindsaar <test@lindsaar.net>; Friends: test2@lindsaar.net; Ada <test3@lindsaar.net>;'
    a = Mail::Parsers::AddressListsParser.new
    a.parse(text).should_not be_nil
  end

  context "parsing an address with a space at the end" do
    it "only finds a single address" do
      text = 'Mikel Lindsaar <test@lindsaar.net> '
      a = Mail::Parsers::AddressListsParser.new
      a.parse(text).addresses.size.should eq 1
    end
  end
end
