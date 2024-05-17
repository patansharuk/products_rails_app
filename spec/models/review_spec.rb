require 'rails_helper'

describe Review, type: :model do

    let(:product){
        Product.create(title: 'something', description: 'something')
    }

    subject { described_class.new(description: 'Something is better than nothing!', product_id: product.id) }

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    describe "Associations" do
        it { should belong_to(:product).without_validating_presence }
    end
end