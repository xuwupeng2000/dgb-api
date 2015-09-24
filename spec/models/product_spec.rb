require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "validation" do

    context 'invalid entry' do
      subject do 
        product = Product.new
        product.save
        product
      end

      it "should validate the presence of name"  do 
        expect(subject.errors[:name]).to include 'please enter name'
      end

      it "should validate the presence of purchasing_price"  do 
        expect(subject.errors[:purchasing_price]).to include 'please enter purchasing price'
      end

      it "should validate the presence of selling_price"  do 
        expect(subject.errors[:selling_price]).to include 'please enter selling price'
      end

      it "should validate purchasing_price > 0"  do 
        expect(subject.errors[:purchasing_price]).to include 'need to be greater than 0'
      end

      it "should validate selling_price > 0"  do 
        expect(subject.errors[:selling_price]).to include 'need to be greater than 0'
      end
    end

    context 'vaild entry' do
      subject do 
        product = build(:product)
        product.save
        product
      end

      it "should have no error"  do 
        expect(subject.errors.empty?).to eq true
      end
    end
  end
end
