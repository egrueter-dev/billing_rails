class Dashboard::ProfilesController < ApplicationController

  def show
  end

  def edit
    # Update bank account You need to retreive an existing account here. If none created,
    # ..then create a new external account
    #
    # Move this to Figaro
    Stripe.api_key = "sk_test_PTVRgvgpatfQZVMkHSVlTqLs"

    binding.pry

    account = Stripe::Account.retrieve(current_user.account_id)

    ## Might need to rip this out?? Too tired right now to code this properly

    if user["bank_accounts"]["total_count"] == 0
      account.external_accounts.create(:external_account => SecureRandom.base58(24))
    end

    ## Else find the first bank account on the list and update that?
  end

  def update
    # Update First, Last Name
    # Add company logo? -- later
  end
end
