class Dashboard::UsersController < ApplicationController

  def show
  end

  def edit
    # Update bank account You need to retreive an existing account here. If none created,
    # ..then create a new external account with a POST to update.
    # Move this to Figaro or initializer
    Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"

    @user = User.where(id: current_user.id).first

    begin
      # @bank_account_information = account["external_accounts"]["data"]
    rescue
      # binding.pry
    end
  end

  def update
    account = Stripe::Account.retrieve(current_user.account_id)
    # See stripe documentation https://stripe.com/docs/api/ruby#update_account
    # external_account is an  optional hash
    # Parameters:
    # Object REQUIRED
    # The type of external account. Should be "bank_account".
    # Account_number REQUIRED
    # The account number for the bank account in string form. Must be a checking account.
    # Country REQUIRED
    # The country the bank account is in.

    begin
      response = account.external_accounts.create(external_account: {
        object: 'bank_account',
        account_number: params[:account_number],
        country: 'US',
        currency: 'usd',
        routing_number: params[:routing_number]
      })

    rescue Stripe::InvalidRequestError => e
      # flash message here showing stripe validations to user.
    end
    # should this be ripped out and replaced with stripe.js?

      binding.pry
    # Update First, Last Name
    # Add company logo? -- later
  end
end
