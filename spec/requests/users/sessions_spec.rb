require 'swagger_helper'

describe 'User Sessions', type: :request do
  let!(:user) { create(:user)}

  path '/login' do
    post('login user') do
      tags 'User Sessions'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :credentials, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string }
            },
            required: %w[email password]
          }
        },
        required: %w[user]
      }

      response '200', 'successful' do
        let(:credentials) { { user: { email: 'sharukhan@webkorps.com', password: '123456' } } }

        run_test! do
          expect(response).to have_http_status(:ok)
          expect(response_body['message']).to eq('Logged in successfully.')
          expect(response_body['token']).to be_present
        end
      end

      response '401', 'failed' do
        let(:credentials) { { user: { email: 'sharukhan@webkorps.com', password: '12345asd' } } }

        run_test! do
            expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end

  path '/logout' do
    delete('logout user') do
        tags 'User Sessions'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :Authorization, in: :header, type: :string, required: true, description: 'JWT token'

        response '204', 'successful' do
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
                expect(response).to have_http_status(:no_content)
            end
        end

        response '401', 'failed' do
            let(:Authorization) { '' }
            run_test! do
                expect(response).to have_http_status(:unauthorized)
            end
        end
    end
  end

    def response_body
        JSON.parse(response.body)
    end
end