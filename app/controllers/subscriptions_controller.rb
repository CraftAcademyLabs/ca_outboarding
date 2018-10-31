# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new; end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: stripe_token(params),
      description: current_user.display_name
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: 10_000,
      description: 'CAOutbording Subscription',
      currency: 'sek'
    )
    if charge[:paid]
      current_user.subscriber = true
      current_user.save
      redirect_to root_path, notice: 'Welcome as a subscriber'
    end
  rescue Stripe::CardError => error
    redirect_to new_subscription_path, alert: error.message
  end

  private
  def stripe_token(params)
    Rails.env.test? ? generate_test_token : params[:stripeToken]
  end

  def generate_test_token
    StripeMock.create_test_helper.generate_card_token
  end
end
