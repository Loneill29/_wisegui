class ChargesController < ApplicationController

  def new
    if current_user.admin?
      redirect_to edit_user_registration_path(current_user)
    end

   @stripe_btn_data = {
    key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Upgrade to Premium",
     amount: amount
    }
  end

  def create
    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: amount,
      description: "Premium Membership - #{current_user.email}",
      currency: 'usd'
    )

    current_user.update_attribute(:role, 'premium')

    flash[:notice] = "Congrats, #{current_user.email}! Your account has been upgraded to premium."
    redirect_to root_path

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_charge_path
  end

  def destroy
    if current_user.transaction do
      current_user.standard!
      current_user.wikis.update_all(private: false)
    end
    flash[:notice] = "You have successfully downgraded your account."
    else
    flash[:notice] = "There was an error downgrading your account."
    end
    redirect_to root_path
  end

  private

  def amount
    15_00
  end
end
