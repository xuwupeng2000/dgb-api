require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validation" do

    context 'invalid entry' do
      subject do 
        u = User.new
        u.save
        u
      end

      it "should validate the presence of name"  do 
        expect(subject.errors[:name]).to include 'please enter name'
      end

      it "should validate the presence of email"  do 
        expect(subject.errors[:email]).to include 'please enter email'
      end

      it "should validate accepted_terms"  do 
        expect(subject.errors[:accepted_terms]).to include 'must be accepted'
      end

      it "should validate password"  do 
        expect(subject.errors[:password]).to include 'please enter password'
      end
    end
  end

  describe "email validation" do

    it "should validate email format"  do 
      u = User.new(email: 'random thing')
      u.save

      expect(u.errors[:email]).to include 'are you sure this is your email? Its format is invalid'
    end

    it "should validate the uniqueness of email"  do 
      create(:user, email: 'same@same.com')
      u = User.new(email: 'same@same.com')
      u.save

      expect(u.errors[:email]).to include 'has been taken'
    end
  end

  describe "password_required?" do

    context 'when password_required? is true' do
      it "should validate password"  do 
        u = build(:user, password: nil)
        allow(u).to receive(:password_required?).and_return(true)
        u.save
        expect(u.errors[:password]).to include 'please enter password' 
      end
    end

    context 'when password_required is false' do
      it "should not validate password"  do 
        u = build(:user, password: nil, password_confirmation: nil)
        allow(u).to receive(:password_required?).and_return(false)
        u.save
        expect(u.errors[:password]).to eq []
      end
    end
    
  end
  

end
