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
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
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

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.hubapi.com/oauth/v1/token";
|};

# This is a generated connector from [HubSpot](https://www.hubspot.com/) OpenAPI specification.
# The CRM uses schemas to define how custom objects should store and represent information in the HubSpot CRM. Schemas define details about an object's type, properties, and associations. The schema can be uniquely identified by its **object type ID**.
@display {label: "HubSpot CRM Schema", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [HubSpot account](https://www.hubspot.com/) and obtain OAuth tokens following [this guide](https://developers.hubspot.com/docs/api/working-with-oauth4).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.hubapi.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Get all schemas
    #
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getAll(boolean archived = false) returns CollectionResponseObjectSchemaNoPaging|error {
        string resourcePath = string `/crm/v3/schemas`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CollectionResponseObjectSchemaNoPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create a new schema
    #
    # + payload - Object schema definition, including properties and associations. 
    # + return - successful operation 
    remote isolated function create(ObjectSchemaEgg payload) returns ObjectSchema|error {
        string resourcePath = string `/crm/v3/schemas`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ObjectSchema response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get an existing schema
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + return - successful operation 
    remote isolated function getById(string objectType) returns ObjectSchema|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}`;
        ObjectSchema response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete a schema
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + archived - Whether to return only results that have been archived. 
    # + return - No content 
    remote isolated function archive(string objectType, boolean archived = false) returns http:Response|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update a schema
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + payload - Attributes to update in schema 
    # + return - successful operation 
    remote isolated function update(string objectType, ObjectTypeDefinitionPatch payload) returns ObjectTypeDefinition|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ObjectTypeDefinition response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Create an association
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + payload - Attributes that define the association. 
    # + return - successful operation 
    remote isolated function associationsCreateassociation(string objectType, AssociationDefinitionEgg payload) returns AssociationDefinition|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}/associations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AssociationDefinition response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove an association
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + associationIdentifier - Unique ID of the association to remove. 
    # + return - No content 
    remote isolated function associationsArchiveassociation(string objectType, string associationIdentifier) returns http:Response|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}/associations/${getEncodedUri(associationIdentifier)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Purge schemas
    #
    # + objectType - Fully qualified name or object type ID of your schema. 
    # + return - No content 
    # 
    # # Deprecated
    @deprecated
    remote isolated function purge(string objectType) returns http:Response|error {
        string resourcePath = string `/crm/v3/schemas/${getEncodedUri(objectType)}/purge`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
