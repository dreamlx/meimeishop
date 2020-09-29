class ProvidersController < InheritedResources::Base

  private

    def provider_params
      params.require(:provider).permit(:title, :qrcode, :sn, :product_name, :price, :stock)
    end

end
