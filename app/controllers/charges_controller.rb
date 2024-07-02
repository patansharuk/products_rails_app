require 'stripe'

Stripe.api_key = ENV['stripe_secret_key']

class ChargesController < ApplicationController
   def index
        product = Stripe::Product.create({
            name: 'Car',
            active: true,
        })
        price = Stripe::Price.create({
            product: product.id,
            unit_amount: 200,
            currency: 'usd',
        })
        session = Stripe::Checkout::Session.create({
            line_items: [{
                price: price.id,
                quantity: 1,
            }],
            mode: 'payment',
            success_url: 'http://localhost:3003/success-page',
            cancel_url: 'http://localhost:3003/cancel-page'
        })
        redirect_to session.url, status: :see_other, allow_other_host: true
   end 
end