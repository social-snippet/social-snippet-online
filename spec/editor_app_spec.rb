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
    it { should_not be_ok }

    context "create model" do

      before do
        ::FactoryGirl.define do
          factory "source-123", :class => ::Editor::Source do
            _id "123"
            text "hello-123"
          end
        end
        ::FactoryGirl.create "source-123"
      end

      context "GET /webapi/sources/123" do
        before { get "/webapi/sources/123" }
        subject { last_response }
        it { should be_ok }
        context "parse json" do
          let(:result) { ::JSON.parse last_response.body }
          it { expect(result["text"]).to eq "hello-123" }
        end
      end

    end # create mode

  end # GET /webapi/sources/123

  context "POST /webapi/sources" do
    let(:params) do
      {
        "text" => "hello",
      }
    end
    let(:headers) do
      {
        "Content-Type" => "application/json",
      }
    end
    before { post "/webapi/sources", params, headers }
    subject { last_response }
    it { should be_ok }
    context "parse json" do
      let(:result) { ::JSON.parse last_response.body }
      it { expect(result["text"]).to eq "hello" }
      it { expect(result).to have_key "id" }
    end
  end

  context "PUT /webapi/sources/123" do

    let(:params) do
      {
        "text" => "hello-123-updated",
      }
    end

    let(:headers) do
      {
        "Content-Type" => "application/json",
      }
    end

    before { put "/webapi/sources/123", params, headers }
    subject { last_response }
    it { should_not be_ok }

    context "create model" do

      before do
        ::FactoryGirl.define do
          factory "source-123", :class => ::Editor::Source do
            _id "123"
            text "hello-123"
          end
        end
        ::FactoryGirl.create "source-123"
      end

      context "PUT /webapi/sources/123" do
        before { put "/webapi/sources/123", params, headers }
        subject { last_response }
        it { should be_ok }
        context "parse json" do
          let(:result) { ::JSON.parse last_response.body }
          it { expect(result["text"]).to eq "hello-123-updated" }
        end

        context "GET /webapi/sources/123" do
          before { get "/webapi/sources/123" }
          subject { last_response }
          it { should be_ok }
          context "parse json" do
            let(:result) { ::JSON.parse last_response.body }
            it { expect(result["text"]).to eq "hello-123-updated" }
          end
        end

      end

    end # create mode

  end # PUT /webapi/sources/123

end

