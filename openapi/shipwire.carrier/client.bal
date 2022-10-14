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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:CredentialsConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_1_1;
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
    # Proxy server related options
    http:ProxyConfig? proxy = ();
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# This is a generated connector for [Shipwire Carrier API v3.0](https://www.shipwire.com/developers/carrier/) OpenAPI specification.
# The Carriers API is used to manage supported carriers and their respective capabilities. 
# Use it to view, add or remove carriers enabled to function with Shipwire and Shipwire Anywhere warehouses.
@display {label: "Shipwire Carrier", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Shipwire account](https://www.shipwire.com) and obtain tokens by following [this guide](https://www.shipwire.com/developers/getting-started).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.shipwire.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get carriers availability
    #
    # + name - Add description 
    # + carrierCode - Add description 
    # + serviceLevelCode - Add description 
    # + isPoBoxSupported - Add description 
    # + return - Carriers response 
    remote isolated function getCarriers(string? name = (), string? carrierCode = (), string? serviceLevelCode = (), string? isPoBoxSupported = ()) returns GetCarriersResponse|error {
        string resourcePath = string `/api/v3.1/carriers`;
        map<anydata> queryParam = {"name": name, "carrierCode": carrierCode, "serviceLevelCode": serviceLevelCode, "isPoBoxSupported": isPoBoxSupported};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GetCarriersResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get carrier availability
    #
    # + id - The prefix concatenated with '-' and service level code of the carrier. 
    # + return - Carrier response 
    remote isolated function getCarrier(string id) returns GetCarrierResponse|error {
        string resourcePath = string `/api/v3.1/carriers/${getEncodedUri(id)}`;
        GetCarrierResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
