require 'spec_helper'

feature 'Toggle Whitespace Changes', js: true, feature: true do
  let(:merge_request) { create(:merge_request) }
  let(:project) { merge_request.source_project }

  before do
    login_as :admin
    visit diffs_namespace_project_merge_request_path(project.namespace, project, merge_request)
  end

  it 'should have a button to toggle whitespace changes' do
    expect(page).to have_content "Hide whitespace changes"
  end

  describe 'clicking hide whitespace changes button' do
    it 'should hide whitespace changes' do
      find('a', text: "Hide whitespace changes").click
      expect(page).to have_content "Show whitespace changes"
    end
  end
end
