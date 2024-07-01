require 'rails_helper'

RSpec.describe User, type: :model do
    subject { described_class.new(email: 'sharukhan@webkoprs.com', password: '123456')}

    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid with invalid email" do
        subject.email = 'kk@@gmail.com'
        expect(subject).to_not be_valid
    end

    it "is not valid with invalid password length" do
        subject.password = '1234'
        expect(subject).to_not be_valid
    end
end
