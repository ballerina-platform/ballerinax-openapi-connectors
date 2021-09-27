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
import ballerina/url;
import ballerina/lang.'string;

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Interzoid Zip Code Detailed Info API v1.0.0] (https://www.interzoid.com/services/getzipcodeinfo) OpenAPI specification.
# The Interzoid Zip Code Detailed Info connector module provides detailed information for a given zip code, including city, state, latitude, longitude, area size, and various population demographics.
# For additional help getting started with the API, visit [Interzoid Zip Code Detailed Info API] (https://www.interzoid.com/services/getzipcodeinfo).
@display {label: "Interzoid Zipinfo", iconPath: "resources/interzoid.zipinfo.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create an [Interzoid Account](https://www.interzoid.com/register) 
    # and obtain tokens by log into [Interzoid Account](https://www.interzoid.com/account).
    #
    # + apiKeyConfig - Provide your private license key as `license`. Eg: `{"license" : "<private license key>"}`
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.interzoid.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Gets detailed zip code information
    #
    # + zip - Zip code to retrieve detailed information
    # + return - Zip code detailed code information
    remote isolated function getzipcodeinfo(string zip) returns ZipInfo|error {
        string  path = string `/getzipcodeinfo`;
        map<anydata> queryParam = {"zip": zip, "license": self.apiKeys["license"]};
        path = path + check getPathForQueryParam(queryParam);
        ZipInfo response = check self.clientEp-> get(path, targetType = ZipInfo);
        return response;
    }
}

# Generate query path with query parameter.
#
# + queryParam - Query parameter map
# + return - Returns generated Path or error at failure of client initialization
isolated function  getPathForQueryParam(map<anydata> queryParam)  returns  string|error {
    string[] param = [];
    param[param.length()] = "?";
    foreach  var [key, value] in  queryParam.entries() {
        if  value  is  () {
            _ = queryParam.remove(key);
        } else {
            if  string:startsWith( key, "'") {
                 param[param.length()] = string:substring(key, 1, key.length());
            } else {
                param[param.length()] = key;
            }
            param[param.length()] = "=";
            if  value  is  string {
                string updateV =  check url:encode(value, "UTF-8");
                param[param.length()] = updateV;
            } else {
                param[param.length()] = value.toString();
            }
            param[param.length()] = "&";
        }
    }
    _ = param.remove(param.length()-1);
    if  param.length() ==  1 {
        _ = param.remove(0);
    }
    string restOfPath = string:'join("", ...param);
    return restOfPath;
}
