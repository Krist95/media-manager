class DevicesController < ApplicationController
  def index
    if params[:id]
      device = Device.find(params[:id])
      render json: device
    else
      render json: Device.all
    end
  end

  def create
    device = Device.create(device_params)
    render json: device
  end

  def update_one
    device = Device.find(params[:id])
    device.update(device_params)
    render json: device
  end

  def destroy
    if params[:id]
      Device.destroy(params[:id])
      render json: { message: "Successfully deleted device record with id: #{params[:id]}" }
    else
      Device.destroy_all
      render json: { message: 'All device records have been successfully deleted.' }
    end
  end

  private 
    
  def device_params
    params.require(:device).permit(:uuid, :name)
  end

end
