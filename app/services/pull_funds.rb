class PullFunds

# Sample post body payload
  def pay_load
  '''{
    "businessApplicationId": "AA",
    "merchantCategoryCode": 6012,
    "pointOfServiceCapability": {
      "posTerminalType": "4",
      "posTerminalEntryCapability": "2"
    },
    "feeProgramIndicator": "123",
    "systemsTraceAuditNumber": 300259,
    "retrievalReferenceNumber": "407509300259",
    "foreignExchangeFeeTransaction": "10.00",
    "cardAcceptor": {
      "name": "Acceptor 1",
      "terminalId": "365539",
      "idCode": "VMT200911026070",
      "address": {
        "state": "CA",
        "county": "081",
        "country": "USA",
        "zipCode": "94404"
      }
    },
    "magneticStripeData": {
      "track1Data": "1010101010101010101010101010"
    },
    "senderPrimaryAccountNumber": "4005520000011126",
    "senderCurrencyCode": "USD",
    "surcharge": "2.00",
    "localTransactionDateTime": "2016-04-16T10:32:52",
    "senderCardExpiryDate": "2013-03",
    "pinData": {
      "pinDataBlock": "1cd948f2b961b682",
      "securityRelatedControlInfo": {
        "pinBlockFormatCode": 1,
        "zoneKeyIndex": 1
      }
    },
    "cavv": "0000010926000071934977253000000000000000",
    "pointOfServiceData": {
      "panEntryMode": "90",
      "posConditionCode": "0",
      "motoECIIndicator": "0"
    },
    "acquiringBin": 409999,
    "acquirerCountryCode": "101",
    "amount": "112.00"
  }'''
  end

  def test_pull_funds
    base_uri = 'visadirect/'
    resource_path = 'fundstransfer/v1/pullfundstransactions/'
    url = 'https://sandbox.api.visa.com/' + base_uri + resource_path
    user_id = 'D8NR62RVCE743SB9S1QU21KCFFKyrQjV-YMlwrsHcmpCWPzr8'
    password = 'e9WPHxoAIKHU8yA8d'
    key_path = File.join(Rails.root, 'app', 'assets', 'key_Pakket Hub.pem')
    cert_path = File.join(Rails.root, 'app', 'assets', 'cert.pem')
    headers = {'content-type'=> 'application/json', 'accept'=> 'application/json'}
    begin
      response = RestClient::Request.execute(
          :method => :post,
          :url => url,
          :headers => headers,
          :payload => pay_load,
          :user => user_id, :password => password,
          :ssl_client_key => OpenSSL::PKey::RSA.new(File.read(key_path)),
          :ssl_client_cert =>  OpenSSL::X509::Certificate.new(File.read(cert_path))
      )
    rescue RestClient::ExceptionWithResponse => e
      response = e.response
    end
    return response
  end

  def pull_funds
    puts JSON.pretty_generate(JSON.parse(test_pull_funds()))
  end
end
