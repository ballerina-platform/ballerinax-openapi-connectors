// Copyright (c) 2022 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # Represents API Key `x-api-key`
    string xApiKey;
|};

# This is a generated connector from [NOWPayments API v1](https://nowpayments.io/) OpenAPI Specification. 
# NOWPayments is a non-custodial cryptocurrency payment processing platform. 
# Accept payments in a wide range of cryptos and get them instantly converted into a coin of your choice and sent to your wallet. Keeping it simple – no excess.
@display {label: "NOWPayments", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & ApiKeysConfig apiKeyConfig;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials
    # Create an [NOWPayments Account](https://account.nowpayments.io/create-account) and obtain tokens by following [this guide](https://documenter.getpostman.com/view/7907941/S1a32n38?version=latest)
    #
    # + apiKeyConfig - API keys for authorization 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.nowpayments.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeyConfig = apiKeyConfig.cloneReadOnly();
        return;
    }
    # 3. Get estimated price
    #
    # + return - 3. Get estimated price 
    remote isolated function getEstimatedPrice(string? amount = (), string? currencyFrom = (), string? currencyTo = ()) returns ApproximatePrice|error {
        string resourcePath = string `/v1/estimate`;
        map<anydata> queryParam = {"amount": amount, "currency_from": currencyFrom, "currency_to": currencyTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        ApproximatePrice response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # 6. Get the minimum payment amount
    #
    # + return - 6. Get the minimum payment amount 
    remote isolated function getTheMinimumPaymentAmount(string? currencyFrom = (), string? currencyTo = ()) returns MinimumPayment|error {
        string resourcePath = string `/v1/min-amount`;
        map<anydata> queryParam = {"currency_from": currencyFrom, "currency_to": currencyTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        MinimumPayment response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
    # 7. Get list of payments
    #
    # + return - 7.Get list of payments 
    remote isolated function getListOfPayments(string? 'limit = (), string? page = (), string? sortBy = (), string? orderBy = (), string? dateFrom = (), string? dateTo = ()) returns PaymentListResponse|error {
        string resourcePath = string `/v1/payment/`;
        map<anydata> queryParam = {"limit": 'limit, "page": page, "sortBy": sortBy, "orderBy": orderBy, "dateFrom": dateFrom, "dateTo": dateTo};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"x-api-key": self.apiKeyConfig.xApiKey};
        map<string|string[]> httpHeaders = getMapForHeaders(headerValues);
        PaymentListResponse response = check self.clientEp->get(resourcePath, httpHeaders);
        return response;
    }
}
