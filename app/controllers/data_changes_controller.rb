class DataChangesController < ApplicationController
    skip_before_action :verify_authenticity_token # For simplicity, skipping CSRF protection

  def create
    data_change = DataChange.new(data_change_params)

    if data_change.save
      notify_third_parties(data_change)
      render json: { message: 'DataChange created successfully' }
    else
      render json: { errors: data_change.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    data_change = DataChange.find(params[:id])

    if data_change.update(data_change_params)
      notify_third_parties(data_change)
      render json: { message: 'DataChange updated successfully' }
    else
      render json: { errors: data_change.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def data_change_params
    params.permit(:name, :data)
  end

  def notify_third_parties(data_change)
    third_party_endpoints.each do |endpoint|
      RestClient.post(endpoint, { data_change: data_change.attributes })
    end
  end

  def third_party_endpoints
    ['https://eoc1wvpgekhoq9f.m.pipedream.net']
  end
end
