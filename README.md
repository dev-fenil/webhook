Introduction
Welcome to the Webhook Notifier documentation. This documentation provides information about the Webhook Notifier Rails application, which allows you to notify third-party APIs of data changes via webhooks.

Getting Started
Installation
To run the Webhook Notifier application, follow these steps:

Clone the repository:

git clone <repository-url>

Install dependencies:
bundle install

Run migrations:
rails db:migrate

Start the Rails server:
rails server
The application will be accessible at http://localhost:3000.

Usage:

Create DataChange:
Endpoint: POST /data_changes
Request Body:
json
{
    "name": "Example",
    "data": "Some data"
}

Update DataChange:
Endpoint: PATCH /data_changes/:id
Request Body:
json
{
    "name": "Updated Example",
    "data": "Updated data"
}

Webhook Delivery:
When a new DataChange record is created or updated, the configured third-party endpoints will be notified of the changes via a webhook request.

Configuration:
Third-Party Endpoints
The third-party endpoints to be notified are configured in the third_party_endpoints method within the DataChangesController. For testing purposes, you can use tools like RequestBin or ngrok to set up temporary endpoints.

Security:
For security purposes, it is recommended to implement proper authentication and authorization mechanisms for webhook requests. Consider using HMAC signatures to ensure the authenticity of the requests.

Conclusion:
Thank you for using the Webhook Notifier application. We hope it serves your needs for notifying third-party APIs of data changes efficiently.