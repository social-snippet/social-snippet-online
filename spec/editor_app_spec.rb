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

end

