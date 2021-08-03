# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'Bookmarks page', type: :system, js: true do
  before do
    delete_all_documents_from_solr
    build_solr_docs([TEST_ITEM])
    sign_in(user)
  end
  let(:solr_doc) { SolrDocument.find('123') }
  let(:user) { User.create(uid: "janeq") }

  it 'loads page without error once user signed in' do
    visit bookmarks_path

    expect(page).to have_css('h1.page-heading.bookmarks.show-header', text: 'Bookmarks')
  end

  context 'with bookmarks' do
    it 'has a link for exporting to ris' do
      visit root_path
      click_on 'search'
      find('input#toggle-bookmark_123').set(true)
      visit bookmarks_path

      expect(page).to have_link('Export to RIS', href: '/export_multiple_ris/123')
    end
  end
end
