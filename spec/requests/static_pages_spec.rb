require 'spec_helper'

describe "StaticPages" do

  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }

  shared_examples_for "all static pages" do
    it{ should have_selector('h1', text: heading)}
    it{ should have_selector('title',text: full_title(page_title))}
  end

  describe "Home page" do
    #Homeページにアクセスする
    before{visit root_path}

    let(:heading) {'Sample App'}
    let(:page_title){''}
    #h1にSample App という文字列が含まれるかどうかのテスト
    #タイトルの文字列の整合性テスト
    it_should_behave_like "all static pages"
    #タイトルの文字列の整合性テスト(Homeはいらない)
    it { should_not have_selector 'title',text: '| Home'}
  end

  describe "Help page" do
    #Helpページにアクセスする
    before{visit help_path}

    let(:heading) {'Help'}
    let(:page_title){'Help'}
    #h1にHelp という文字列が含まれるかどうかのテスト
    #タイトルの文字列の整合性テスト
    it_should_behave_like "all static pages"
  end

  describe "About page"do
    #Aboutページにアクセスする
    before{visit about_path}

    let(:heading) {'About'}
    let(:page_title){'About'}
    #h1にHelp という文字列が含まれるかどうかのテスト
    #タイトルの文字列の整合性テスト
    it_should_behave_like "all static pages"
  end

  describe "Contact page"do
    #Contactページにアクセスする
    before{visit contact_path}

    let(:heading) {'Contact'}
    let(:page_title){'Contact'}
    #h1にHelp という文字列が含まれるかどうかのテスト
    #タイトルの文字列の整合性テスト
    it_should_behave_like "all static pages"
  end

  #実際にリンクの確認。
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')# fill in
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')# fill in
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign up')# fill in
    #click_link "sample app"
    #page.should have_selector 'title', text: full_title('Sample App')# fill in
  end
end #Static_pages
