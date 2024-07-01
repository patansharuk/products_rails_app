require 'swagger_helper'

describe 'DealerDetail', type: :request do
    let!(:user) { create(:admin) }

    path '/dealer_details' do
        get 'Retrieve Dealer Details' do
            tags 'Dealer Details'
            consumes 'application/json'
            produces 'application/json'
            
            response '200', 'for valid token' do
                before do
                    post '/login', params: {
                        user: {
                            email: user.email,
                            password: user.password
                        }
                    }, as: :json
                end

                run_test!
            end

            response '401', 'for invalid token' do
                let(:Authorization) { '' }

                run_test!
            end
        end
    end

    path '/dealer_details/{id}' do
        get 'Retrieve Specific Detail' do
            tags 'Dealer Details'
            consumes 'application/json'
            produces 'application/json'
            parameter name: :id, in: :path, type: :string, required: true

            response '200', 'for valid token' do
                before do
                    post '/login', params: {
                        user: {
                            email: user.email,
                            password: user.password
                        }
                    }, as: :json
                end
                let(:dealer_detail){ create(:dealer1 ) }
                let(:id){ dealer_detail.id }
                run_test!
            end

            response '401', 'for invalid token' do
                let(:dealer_detail){ create(:dealer1) }
                let(:id){ dealer_detail.id}
                run_test!
            end
        end
    end

    def response_body
        JSON.parse(response.body)
    end
end