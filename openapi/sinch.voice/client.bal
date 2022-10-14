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

# This is a generated connector for [Sinch Voice API v1.0.0](https://www.sinch.com/) OpenAPI specification. 
# The Calling API exposes calling- and conference-related functionality in the Sinch Voice Platform.
@display {label: "Sinch Voice", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Sinch account](https://www.sinch.com/) and obtain tokens by following [this guide](https://developers.sinch.com/docs/voice/api-reference/authentication/#basic-authorization).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://calling.api.sinch.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Callout Request
    #
    # + payload - Callout request payload. 
    # + return - OK 
    remote isolated function callouts(CalloutRequest payload) returns GetCalloutResponseObj|error {
        string resourcePath = string `/calling/v1/callouts/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GetCalloutResponseObj response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get information about a call
    #
    # + callid - The unique identifier of the call. This value is generated by the system. 
    # + return - GetCallResultResponse 
    remote isolated function callingGetcallresult(string callid) returns GetCallResponseObj|error {
        string resourcePath = string `/calling/v1/calls/id/${getEncodedUri(callid)}`;
        GetCallResponseObj response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update a call in progress
    #
    # + callid - The unique identifier of the call. This value is generated by the system. 
    # + payload - Update call request payload. 
    # + return - Successful response 
    remote isolated function callingUpdatecall(string callid, SVAMLRequestBody payload) returns json|error {
        string resourcePath = string `/calling/v1/calls/id/${getEncodedUri(callid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Manage Call with `callLeg`
    #
    # + callid - The unique identifier of the call. This value is generated by the system. 
    # + callLeg - Specifies which part of the call will be managed. This option is used only by the `PlayFiles` and `Say` instructions to indicate which channel the sound will be played on. Valid options are `caller`, `callee` or `both`. If not specified, the default value is `caller`.</br><Warning>The `callLeg` identifier is ignored for calls that are part of a conference and calls initiated using the Callout API.</Warning> 
    # + payload - Manage Call with call leg payload. 
    # + return - Successful response 
    remote isolated function callingManagecallwithcallleg(string callid, string callLeg, SVAMLRequestBody payload) returns json|error {
        string resourcePath = string `/calling/v1/calls/id/${getEncodedUri(callid)}/leg/${getEncodedUri(callLeg)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get Conference Info
    #
    # + conferenceid - The unique identifier of the conference. The user sets this value. 
    # + return - OK 
    remote isolated function callingGetconferenceinfo(string conferenceid) returns GetConferenceInfoResponse|error {
        string resourcePath = string `/calling/v1/conferences/id/${getEncodedUri(conferenceid)}`;
        GetConferenceInfoResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Kick Conference All (cloud)
    #
    # + conferenceid - The unique identifier of the conference. The user sets this value. 
    # + return - No content 
    remote isolated function callingKickconferenceall(string conferenceid) returns json|error {
        string resourcePath = string `/calling/v1/conferences/id/${getEncodedUri(conferenceid)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Kick Conference Participant (cloud)
    #
    # + callid - The unique identifier of the call. This value is generated by the system. 
    # + conferenceid - The unique identifier of the conference. The user sets this value. 
    # + return - Successful response 
    remote isolated function callingKickconferenceparticipant(string callid, string conferenceid) returns json|error {
        string resourcePath = string `/calling/v1/conferences/id/${getEncodedUri(conferenceid)}/${getEncodedUri(callid)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Mute / Unmute Conference participant (cloud)
    #
    # + callid - The unique identifier of the call. This value is generated by the system. 
    # + conferenceid - The unique identifier of the conference. The user sets this value. 
    # + payload - Mute conference participant payload 
    # + return - Successful response 
    remote isolated function muteUnmuteConferenceParticipant(string callid, string conferenceid, json payload) returns json|error {
        string resourcePath = string `/calling/v1/conferences/id/${getEncodedUri(conferenceid)}/${getEncodedUri(callid)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get Numbers
    #
    # + return - OK 
    remote isolated function configurationGetnumbers() returns GetNumbersResponseObj|error {
        string resourcePath = string `/v1/configuration/numbers/`;
        GetNumbersResponseObj response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Numbers
    #
    # + payload - Update numbers payload. 
    # + return - Successful response 
    remote isolated function configurationUpdatenumbers(UpdateNumbers payload) returns json|error {
        string resourcePath = string `/v1/configuration/numbers/`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Un-assign number
    #
    # + return - No content 
    remote isolated function configurationUnassignnumber() returns json|error {
        string resourcePath = string `/v1/configuration/numbers/`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Get Callback URLs
    #
    # + applicationkey - The unique identifying key of the application. 
    # + return - OK 
    remote isolated function configurationGetcallbackurls(string applicationkey) returns GetCallbacks|error {
        string resourcePath = string `/v1/configuration/callbacks/applications/${getEncodedUri(applicationkey)}`;
        GetCallbacks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Update Callbacks
    #
    # + applicationkey - The unique identifying key of the application. 
    # + payload - Update callbacks payload. 
    # + return - No content 
    remote isolated function configurationUpdatecallbackurls(string applicationkey, UpdateCallbacks payload) returns json|error {
        string resourcePath = string `/v1/configuration/callbacks/applications/${getEncodedUri(applicationkey)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Query number
    #
    # + number - The phone number you want to query. 
    # + return - Successful response 
    remote isolated function callingQuerynumber(string number) returns GetQueryNumber|error {
        string resourcePath = string `/v1/calling/query/number/${getEncodedUri(number)}`;
        GetQueryNumber response = check self.clientEp->get(resourcePath);
        return response;
    }
}
