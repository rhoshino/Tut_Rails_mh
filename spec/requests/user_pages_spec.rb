require 'spec_helper'

describe "UserPages" do
  subject{ page }

  describe "signup page" do
    before {visit signup_path}

    #h1にSignupっていう文字列が含まれているかどうかのテスト
    it { should have_selector('h1', text: 'Sign up')}
    #タイトルの文字列の整合性テスト
    it { should have_selector('title',  text: full_title('Sign up'))}
  end

end
