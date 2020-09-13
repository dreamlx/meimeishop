class BuyersController < InheritedResources::Base

  private

    def buyer_params
      params.require(:buyer).permit(:sn, :product, :quantity, :contact, :description)
    end

end
