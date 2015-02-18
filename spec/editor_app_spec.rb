require "spec_helper"

describe ::Editor::Application do

  def app
    ::Editor::Application.new
  end

  context "GET /" do
    before { get "/" }
    subject { last_response }
    it { should be_ok }
  end

  context "GET /webapi/sources" do
    before { get "/webapi/sources" }
    subject { last_response }
    it { should be_ok }
  end

  context "GET /webapi/sources/123" do
    before { get "/webapi/sources/123" }
    subject { last_response }
    it { should be_ok }
  end

  context "POST /webapi/sources" do
    before { post "/webapi/sources" }
    subject { last_response }
    it { should be_ok }
  end

  context "PUT /webapi/sources/123" do
    before { put "/webapi/sources/123" }
    subject { last_response }
    it { should be_ok }
  end

end

