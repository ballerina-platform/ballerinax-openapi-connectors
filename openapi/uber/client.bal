// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig auth;
    # The HTTP version understood by the client
    string httpVersion = "1.1";
    # Configurations related to HTTP/1.x protocol
    http:ClientHttp1Settings http1Settings = {};
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings = {};
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with Redirection
    http:FollowRedirects? followRedirects = ();
    # Configurations associated with request pooling
    http:PoolConfiguration? poolConfig = ();
    # HTTP caching related configurations
    http:CacheConfig cache = {};
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig? circuitBreaker = ();
    # Configurations associated with retrying
    http:RetryConfig? retryConfig = ();
    # Configurations associated with cookies
    http:CookieConfig? cookieConfig = ();
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits = {};
    # SSL/TLS-related options
    http:ClientSecureSocket? secureSocket = ();
|};

# Move your app forward with the Uber API
@display {label: "Uber", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.uber.com/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Product Types
    #
    # + latitude - Latitude component of location. 
    # + longitude - Longitude component of location. 
    # + return - An array of products 
    remote isolated function getProducts(float latitude, float longitude) returns Product[]|error {
        string resourcePath = string `/products`;
        map<anydata> queryParam = {"latitude": latitude, "longitude": longitude};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Product[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Price Estimates
    #
    # + startLatitude - Latitude component of start location. 
    # + startLongitude - Longitude component of start location. 
    # + endLatitude - Latitude component of end location. 
    # + endLongitude - Longitude component of end location. 
    # + return - An array of price estimates by product 
    remote isolated function getPrices(float startLatitude, float startLongitude, float endLatitude, float endLongitude) returns PriceEstimate[]|error {
        string resourcePath = string `/estimates/price`;
        map<anydata> queryParam = {"start_latitude": startLatitude, "start_longitude": startLongitude, "end_latitude": endLatitude, "end_longitude": endLongitude};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        PriceEstimate[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Time Estimates
    #
    # + startLatitude - Latitude component of start location. 
    # + startLongitude - Longitude component of start location. 
    # + customerUuid - Unique customer identifier to be used for experience customization. 
    # + productId - Unique identifier representing a specific product for a given latitude & longitude. 
    # + return - An array of products 
    remote isolated function getTimes(float startLatitude, float startLongitude, string? customerUuid = (), string? productId = ()) returns Product[]|error {
        string resourcePath = string `/estimates/time`;
        map<anydata> queryParam = {"start_latitude": startLatitude, "start_longitude": startLongitude, "customer_uuid": customerUuid, "product_id": productId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Product[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # User Profile
    #
    # + return - Profile information for a user 
    remote isolated function getUser() returns Profile|error {
        string resourcePath = string `/me`;
        Profile response = check self.clientEp->get(resourcePath);
        return response;
    }
    # User Activity
    #
    # + offset - Offset the list of returned results by this amount. Default is zero. 
    # + 'limit - Number of items to retrieve. Default is 5, maximum is 100. 
    # + return - History information for the given user 
    remote isolated function history(int? offset = (), int? 'limit = ()) returns Activities|error {
        string resourcePath = string `/history`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Activities response = check self.clientEp->get(resourcePath);
        return response;
    }
}
