require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET welcome" do
    subject { get 'welcome' }

    it "render page"  do 
      expect(subject).to render_template(:welcome)
      expect(subject.status).to eq 200
    end
  end

end
