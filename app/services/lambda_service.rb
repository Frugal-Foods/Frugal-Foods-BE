require 'aws-sdk-lambda'
class LambdaService

lambda_client = Aws::Lambda::Client.new(
  region: 'us-east-1',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
)

json_payload = {
  "num1": "4",
  "num2": "10"
}.to_json

response = lambda_client.invoke({
  function_name: 'alainas-first-function',
  payload: json_payload
})
if response.status_code == 200
  result = response.payload.string
  puts "Result from Lambda function: #{result}"
else
  puts "Error calling Lambda function: #{response.error_message}"
end

end





# end