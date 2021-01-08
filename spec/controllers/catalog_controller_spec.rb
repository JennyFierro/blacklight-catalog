# frozen_string_literal: true
require 'rails_helper'

RSpec.describe CatalogController, type: :controller do
  describe 'index fields' do
    let(:index_fields) do
      controller
        .blacklight_config
        .index_fields.keys
        .map { |field| field.gsub(/\_s+im$/, '') }
    end
    let(:expected_index_fields) { ['author_display', 'format', 'marc_resource'] }
    let(:field_title) { controller.blacklight_config.index.title_field }

    context 'field titles' do
      it { expect(field_title).to eq('title_display') }
    end

    it { expect(index_fields).to contain_exactly(*expected_index_fields) }
  end

  describe 'show fields' do
    let(:show_fields) do
      controller
        .blacklight_config
        .show_fields.keys
        .map { |field| field.gsub(/\_s+im$/, '') }
    end
    let(:expected_show_fields) do
      ['title_display', 'author_display', 'pub_date', 'language_facet',
       'isbn_t', 'lc_callnum_display', 'id', 'marc_resource']
    end

    it { expect(show_fields).to contain_exactly(*expected_show_fields) }
  end

  describe 'facet fields' do
    let(:facet_fields) do
      controller
        .blacklight_config
        .facet_fields.keys
        .map { |field| field.gsub(/\_s+im$/, '') }
    end
    let(:expected_facet_fields) do
      ["author_display", "format", "language_facet", "marc_resource",
       "subject_era_facet", "subject_geo_facet", "subject_topic_facet",
       "title_series_t"]
    end
    let(:homepage_facet_fields) { controller.blacklight_config.homepage_facet_fields }

    context 'homepage facet fields' do
      it { expect(homepage_facet_fields).to eq(['format', 'language_facet']) }
    end

    it { expect(facet_fields).to contain_exactly(*expected_facet_fields) }
  end

  describe 'search fields' do
    let(:search_fields) { controller.blacklight_config.search_fields.keys }
    let(:expected_search_fields) { ['keyword', 'title', 'author', 'subject'] }

    it { expect(search_fields).to contain_exactly(*expected_search_fields) }
  end
end
