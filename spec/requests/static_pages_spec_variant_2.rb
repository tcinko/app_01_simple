require 'rails_helper'

require 'spec_helper'

describe "Static pages:" do
  subject { page }

  shared_examples_for "all static pages:" do
    it { should have_selector('h1', text: h1_text) }
    it { should have_title(full_title(page_title)) }
  end


  describe "Home page:" do
	before {visit root_path}

	let(:h1_text)    { 'Sample App' }
	let(:page_title) { '' }

	it_should_behave_like "all static pages:"
     #it { should_not have_title('| Home') }
  end


  describe "Help page:" do
	before {visit help_path}

	let(:h1_text)    { 'Help' }
	let(:page_title) { 'Help' }

	it_should_behave_like "all static pages:"
  end


  describe "About page:" do
	before {visit about_path}

	let(:h1_text)    { 'About' }
	let(:page_title) { 'About' }
	it_should_behave_like "all static pages:"
  end


  describe "Contact page:" do
	before {visit contact_path}

	let(:h1_text)    { 'Contact' }
	let(:page_title) { 'Contact' }
	it_should_behave_like "all static pages:"
  end


end
