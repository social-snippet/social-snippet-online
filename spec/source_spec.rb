require "spec_helper"

describe ::Editor::Models::Source do

  context "create a source" do
    let(:source) { ::Editor::Models::Source.create :text => "123" }
    subject { source.text }
    it { should eq "123" }
  end

end

