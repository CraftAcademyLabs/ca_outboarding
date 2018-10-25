# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  def new; end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      source: params[:stripeToken],
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
end
