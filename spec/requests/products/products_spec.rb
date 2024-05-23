require 'swagger_helper'

describe 'Products', type: :request do
    let!(:user) { create(:user) }
    
    path '/products' do
        get('render products') do
            tags 'Products'
            consumes 'application/json'
            produces 'application/json'
            parameter name: :Authorization, in: :header, type: :string, require: true, description: 'JWT Token'

            response '200', 'for valid token - empty product table' do
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

						response '200', 'for valid token - for single product' do
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

            response '401', 'for invalid token' do
							let(:Authorization) { '' }
							
							run_test! do
								expect(response_body).to eq ({ "errors" => 'Unauthorised' })
							end
            end
        end
    end

		path '/products' do
			post('create products') do
				tags 'Products'
				consumes 'application/json'
				produces 'application/json'
				parameter name: :Authorization, in: :header, type: :string, require: true, description: 'JWT Token'
				parameter name: :product, in: :body, schema: {
					type: :object,
					properties: {
						title: { type: :string },
						description: { type: :string }
					},
					required: ['title', 'description']
				}

				response '201', 'for valid token' do
					before do
						post '/login', params: {
							user: {
								email: user.email,
								password: user.password
							}
						}, as: :json
					end

					let(:Authorization) { response_body['token'] }
					let(:product) { {title: 'sample title', description: 'sample description'} }

					run_test!
				end

				response '422', 'for insufficient attributes' do
					before do
						post '/login', params: {
							user: {
								email: user.email,
								password: user.password
							}
						}, as: :json
					end

					let(:Authorization) { response_body['token'] }
					let(:product) { {title: 'sample title'} }

					run_test! do
						expect(response_body['message']).to eq 'Failed creating product!'
					end
				end

				response '401', 'for invalid token' do
					let(:Authorization) { '' }
					let(:product) { {title: 'sample title', description: 'sample description'} }

					run_test!
				end
			end
		end

    def response_body
      JSON.parse(response.body)
    end
end