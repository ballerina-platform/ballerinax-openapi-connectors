// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:CredentialsConfig auth;
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

# This is a generated connector for [Ably REST API v1.1.0](https://ably.com/documentation/rest-api) OpenAPI specification.
# The [Ably REST API](https://www.ably.io/documentation/rest-api) provides a way for a wide range of server and client devices to communicate with the Ably service over REST.
# The REST API does not provide a realtime long-lived connection to Ably, but in all other respects is a simple subset of the full [realtime messaging API](https://ably.com/documentation/realtime).
@display {label: "Ably", iconPath: "resources/ably.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create an [Ably account](https://ably.com/) and obtain tokens following [this guide](https://ably.com/documentation/core-features/versions/v1.1/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector`
    # + serviceUrl - URL of the target service
    # + return - An error if connector initialization failed
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://rest.ably.io") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Enumerate all active channels of the application
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + 'limit - Optionally specifies the maximum number of results to return. A limit greater than 1000 is unsupported
    # + prefix - Optionally limits the query to only those channels whose name starts with the given prefix
    # + return - OK
    remote isolated function getMetadataOfAllChannels(string? xAblyVersion = (), string? format = (), int 'limit = 100, string? prefix = ()) returns InlineResponse2xx|error {
        string  path = string `/channels`;
        map<anydata> queryParam = {"format": format, "limit": 'limit, "prefix": prefix};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        InlineResponse2xx response = check self.clientEp-> get(path, accHeaders, targetType = InlineResponse2xx);
        return response;
    }
    # Get metadata of a channel
    #
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels).
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function getMetadataOfChannel(string channelId, string? xAblyVersion = (), string? format = ()) returns ChannelDetails|error {
        string  path = string `/channels/${channelId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ChannelDetails response = check self.clientEp-> get(path, accHeaders, targetType = ChannelDetails);
        return response;
    }
    # Get message history for a channel
    #
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels).
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + 'start - Beginning of time The start of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or after this time.
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid.
    # + end - The end of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or before this time.
    # + direction - The direction of this query. The direction determines the order of the returned result array, but also determines which end of the query interval is the start point for the search. For example, a forwards query uses start as the start point, whereas a backwards query uses end as the start point.
    # + return - OK
    remote isolated function getMessagesByChannel(string channelId, string? xAblyVersion = (), string? format = (), string? 'start = (), int? 'limit = (), string end = "now", string direction = "backwards") returns Message[]|error {
        string  path = string `/channels/${channelId}/messages`;
        map<anydata> queryParam = {"format": format, "start": 'start, "limit": 'limit, "end": end, "direction": direction};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        Message[] response = check self.clientEp-> get(path, accHeaders, targetType = MessageArr);
        return response;
    }
    # Publish a message to a channel
    #
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels).
    # + payload - Message
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function publishMessagesToChannel(string channelId, Message payload, string? xAblyVersion = (), string? format = ()) returns InlineResponse2xx1|error {
        string  path = string `/channels/${channelId}/messages`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        InlineResponse2xx1 response = check self.clientEp->post(path, request, headers = accHeaders, targetType=InlineResponse2xx1);
        return response;
    }
    # Get presence of a channel
    #
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels).
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + clientId - Optional filter to restrict members present with that clientId
    # + connectionId - Optional filter to restrict members present with that connectionId
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid.
    # + return - OK
    remote isolated function getPresenceOfChannel(string channelId, string? xAblyVersion = (), string? format = (), string? clientId = (), string? connectionId = (), int 'limit = 100) returns PresenceMessage[]|error {
        string  path = string `/channels/${channelId}/presence`;
        map<anydata> queryParam = {"format": format, "clientId": clientId, "connectionId": connectionId, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PresenceMessage[] response = check self.clientEp-> get(path, accHeaders, targetType = PresenceMessageArr);
        return response;
    }
    # Get presence history of a channel
    #
    # + channelId - The [Channel's ID](https://www.ably.io/documentation/rest/channels).
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + 'start - Beginning of time The start of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or after this time.
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid.
    # + end - The end of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or before this time.
    # + direction - The direction of this query. The direction determines the order of the returned result array, but also determines which end of the query interval is the start point for the search. For example, a forwards query uses start as the start point, whereas a backwards query uses end as the start point.
    # + return - OK
    remote isolated function getPresenceHistoryOfChannel(string channelId, string? xAblyVersion = (), string? format = (), string? 'start = (), int? 'limit = (), string end = "now", string direction = "backwards") returns PresenceMessage[]|error {
        string  path = string `/channels/${channelId}/presence/history`;
        map<anydata> queryParam = {"format": format, "start": 'start, "limit": 'limit, "end": end, "direction": direction};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        PresenceMessage[] response = check self.clientEp-> get(path, accHeaders, targetType = PresenceMessageArr);
        return response;
    }
    # Request an access token
    #
    # + keyName - The [key name](https://www.ably.io/documentation/rest-api/token-request-spec#api-key-format) comprises of the app ID and key ID of an API key.
    # + payload - Request Body
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function requestAccessToken(string keyName, Body payload, string? xAblyVersion = (), string? format = ()) returns TokenDetails|error {
        string  path = string `/keys/${keyName}/requestToken`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TokenDetails response = check self.clientEp->post(path, request, headers = accHeaders, targetType=TokenDetails);
        return response;
    }
    # List channel subscriptions
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + 'channel - Filter to restrict to subscriptions associated with that channel.
    # + deviceId - Optional filter to restrict to devices associated with that deviceId. Cannot be used with clientId.
    # + clientId - Optional filter to restrict to devices associated with that clientId. Cannot be used with deviceId.
    # + 'limit - The maximum number of records to return.
    # + return - OK
    remote isolated function getPushSubscriptionsOnChannels(string? xAblyVersion = (), string? format = (), string? 'channel = (), string? deviceId = (), string? clientId = (), int 'limit = 100) returns DeviceDetails|error {
        string  path = string `/push/channelSubscriptions`;
        map<anydata> queryParam = {"format": format, "channel": 'channel, "deviceId": deviceId, "clientId": clientId, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp-> get(path, accHeaders, targetType = DeviceDetails);
        return response;
    }
    # Subscribe a device to a channel
    #
    # + payload - Request Body
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function subscribePushDeviceToChannel(Body1 payload, string? xAblyVersion = (), string? format = ()) returns http:Response|error {
        string  path = string `/push/channelSubscriptions`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Delete a registered device's update token
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + 'channel - Filter to restrict to subscriptions associated with that channel.
    # + deviceId - Must be set when clientId is empty, cannot be used with clientId.
    # + clientId - Must be set when deviceId is empty, cannot be used with deviceId.
    # + return - OK
    remote isolated function deletePushDeviceDetails(string? xAblyVersion = (), string? format = (), string? 'channel = (), string? deviceId = (), string? clientId = ()) returns http:Response|error {
        string  path = string `/push/channelSubscriptions`;
        map<anydata> queryParam = {"format": format, "channel": 'channel, "deviceId": deviceId, "clientId": clientId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # List all channels with at least one subscribed device
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function getChannelsWithPushSubscribers(string? xAblyVersion = (), string? format = ()) returns string[]|error {
        string  path = string `/push/channels`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        string[] response = check self.clientEp-> get(path, accHeaders, targetType = stringArr);
        return response;
    }
    # List devices registered for receiving push notifications
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + deviceId - Optional filter to restrict to devices associated with that deviceId.
    # + clientId - Optional filter to restrict to devices associated with that clientId.
    # + 'limit - The maximum number of records to return.
    # + return - OK
    remote isolated function getRegisteredPushDevices(string? xAblyVersion = (), string? format = (), string? deviceId = (), string? clientId = (), int 'limit = 100) returns DeviceDetails|error {
        string  path = string `/push/deviceRegistrations`;
        map<anydata> queryParam = {"format": format, "deviceId": deviceId, "clientId": clientId, "limit": 'limit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp-> get(path, accHeaders, targetType = DeviceDetails);
        return response;
    }
    # Register a device for receiving push notifications
    #
    # + payload - Device Details
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function registerPushDevice(DeviceDetails payload, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string  path = string `/push/deviceRegistrations`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceDetails response = check self.clientEp->post(path, request, headers = accHeaders, targetType=DeviceDetails);
        return response;
    }
    # Unregister matching devices for push notifications
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + deviceId - Optional filter to restrict to devices associated with that deviceId. Cannot be used with clientId.
    # + clientId - Optional filter to restrict to devices associated with that clientId. Cannot be used with deviceId.
    # + return - OK
    remote isolated function unregisterAllPushDevices(string? xAblyVersion = (), string? format = (), string? deviceId = (), string? clientId = ()) returns http:Response|error {
        string  path = string `/push/deviceRegistrations`;
        map<anydata> queryParam = {"format": format, "deviceId": deviceId, "clientId": clientId};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Get a device registration
    #
    # + deviceId - Device's ID.
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function getPushDeviceDetails(string deviceId, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string  path = string `/push/deviceRegistrations/${deviceId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp-> get(path, accHeaders, targetType = DeviceDetails);
        return response;
    }
    # Update a device registration
    #
    # + deviceId - Device's ID.
    # + payload - Device Details
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function putPushDeviceDetails(string deviceId, DeviceDetails payload, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string  path = string `/push/deviceRegistrations/${deviceId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceDetails response = check self.clientEp->put(path, request, headers = accHeaders, targetType=DeviceDetails);
        return response;
    }
    # Unregister a single device for push notifications
    #
    # + deviceId - Device's ID.
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function unregisterPushDevice(string deviceId, string? xAblyVersion = (), string? format = ()) returns http:Response|error {
        string  path = string `/push/deviceRegistrations/${deviceId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = http:Response);
        return response;
    }
    # Update a device registration
    #
    # + deviceId - Device's ID.
    # + payload - Device Details
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function patchPushDeviceDetails(string deviceId, DeviceDetails payload, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string  path = string `/push/deviceRegistrations/${deviceId}`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        DeviceDetails response = check self.clientEp->patch(path, request, headers = accHeaders, targetType=DeviceDetails);
        return response;
    }
    # Reset a registered device's update token
    #
    # + deviceId - Device's ID.
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function updatePushDeviceDetails(string deviceId, string? xAblyVersion = (), string? format = ()) returns DeviceDetails|error {
        string  path = string `/push/deviceRegistrations/${deviceId}/resetUpdateToken`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        DeviceDetails response = check self.clientEp-> get(path, accHeaders, targetType = DeviceDetails);
        return response;
    }
    # Publish a push notification to device(s)
    #
    # + payload - Request Body
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function publishPushNotificationToDevices(Body4 payload, string? xAblyVersion = (), string? format = ()) returns http:Response|error {
        string  path = string `/push/publish`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, headers = accHeaders, targetType=http:Response);
        return response;
    }
    # Retrieve usage statistics for an application
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + 'start - Beginning of time The start of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or after this time.
    # + 'limit - The maximum number of records to return. A limit greater than 1,000 is invalid.
    # + end - The end of the query interval as a time in milliseconds since the epoch. A message qualifies as a member of the result set if it was received at or before this time.
    # + direction - The direction of this query. The direction determines the order of the returned result array, but also determines which end of the query interval is the start point for the search. For example, a forwards query uses start as the start point, whereas a backwards query uses end as the start point.
    # + unit - Specifies the unit of aggregation in the returned results.
    # + return - OK
    remote isolated function getStats(string? xAblyVersion = (), string? format = (), string? 'start = (), int? 'limit = (), string end = "now", string direction = "backwards", string unit = "minute") returns json|error {
        string  path = string `/stats`;
        map<anydata> queryParam = {"format": format, "start": 'start, "limit": 'limit, "end": end, "direction": direction, "unit": unit};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        json response = check self.clientEp-> get(path, accHeaders, targetType = json);
        return response;
    }
    # Get the service time
    #
    # + xAblyVersion - The version of the API you wish to use.
    # + format - The response format you would like
    # + return - OK
    remote isolated function getTime(string? xAblyVersion = (), string? format = ()) returns int[]|error {
        string  path = string `/time`;
        map<anydata> queryParam = {"format": format};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"X-Ably-Version": xAblyVersion};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        int[] response = check self.clientEp-> get(path, accHeaders, targetType = intArr);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map
# + return - Returns generated map or error at failure of client initialization
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
