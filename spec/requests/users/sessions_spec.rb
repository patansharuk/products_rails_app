describe 'User Sessions', type: :request do
    let(:user) { create(:user)}

    describe 'POST /login' do
        context 'with valid credentials' do
            it 'returns a JWT token' do
                post '/login', params: {
                    user: {
                        email: user.email,
                        password: user.password
                    }
                }, as: :json

                expect(response).to have_http_status(:ok)
                expect(response_body['message']).to eq('Logged in successfully.')
                expect(response_body['token']).to be_present
            end
        end

        context 'with invalid credentials' do
            it 'returns an error' do
                post '/login', params: {
                    user: {
                        email: user.email,
                        password: 'wrong_password'
                    }
                }, as: :json

                expect(response).to have_http_status(:unauthorized)
                expect(response_body['message']).to eq('Invalid Email or password.')
            end
        end
    end

    describe 'DELETE /logout' do
        it 'logs out the user' do
            post '/login', params: {
                user: {
                    email: user.email,
                    password: user.password
                }
            }, as: :json

            token = response_body['token']

            delete '/logout', headers: { 'Authorization': "Bearer #{token}" }

            expect(response).to have_http_status(:no_content)
        end
    end

    def response_body
        JSON.parse(response.body)
    end
end