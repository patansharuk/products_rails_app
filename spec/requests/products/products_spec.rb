require 'swagger_helper'

describe 'Products', type: :request do
    let!(:user) { create(:user) }
    
    path '/products' do
        get('render page with products') do
            tags 'Products'
            consumes 'application/json'
            produces 'application/json'
            parameter name: :Authorization, in: :header, type: :string, require: true, description: 'JWT Token'

            response '200', 'valid for valid token - empty product table' do
							before do
								post '/login', params: {
									user: {
										email: user.email,
										password: user.password
									}
								}, as: :json
							end

							let(:Authorization) { response_body['token'] }
							
							run_test! do
								expect(response_body).to eq []
							end
            end

						response '200', 'valid for valid token - for single product' do
							let!(:product) { create(:product) }

							before do
								post '/login', params: {
									user: {
										email: user.email,
										password: user.password
									}
								}, as: :json
							end

							let(:Authorization) { response_body['token'] }

							run_test! do
								expect(response_body).to eq [JSON.parse(product.to_json)]
							end
						end

            response '401', 'Unauthorised error if invalid token' do
							let(:Authorization) { '' }
							
							run_test! do
								expect(response_body).to eq ({ "errors" => 'Unauthorised' })
							end
            end
        end
    end

    def response_body
      JSON.parse(response.body)
    end
end