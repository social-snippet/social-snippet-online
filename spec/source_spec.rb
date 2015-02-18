require "spec_helper"

describe ::Editor::Source do

  context "create a source" do
    let(:source) { ::Editor::Source.create :text => "123" }
    subject { source.text }
    it { should eq "123" }
  end

end

