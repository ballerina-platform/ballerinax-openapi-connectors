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
# This API provides access to collections of CRM objects, which return a map of property names to values. Each object type has its own set of default properties, which can be found by exploring the [CRM Object Properties API](https://developers.hubspot.com/docs/methods/crm-properties/crm-properties-overview).
@display {label: "HubSpot CRM  Contact", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # 
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
    # List
    #
    # + 'limit - The maximum number of results to display per page. 
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored. 
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored. 
    # + archived - Whether to return only results that have been archived. 
    # + return - successful operation 
    remote isolated function getPage(int 'limit = 10, string? after = (), string[]? properties = (), string[]? associations = (), boolean archived = false) returns CollectionResponseSimplePublicObjectWithAssociationsForwardPaging|error {
        string resourcePath = string `/crm/v3/objects/contacts`;
        map<anydata> queryParam = {"limit": 'limit, "after": after, "properties": properties, "associations": associations, "archived": archived};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "associations": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionResponseSimplePublicObjectWithAssociationsForwardPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Create
    #
    # + payload - Contact data 
    # + return - successful operation 
    remote isolated function create(SimplePublicObjectInput payload) returns SimplePublicObject|error {
        string resourcePath = string `/crm/v3/objects/contacts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObject response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Archive a batch of contacts by ID
    #
    # + payload - Record containing an array of contact IDs 
    # + return - No content 
    remote isolated function batchArchive(SimplePublicObjectIdArray payload) returns http:Response|error {
        string resourcePath = string `/crm/v3/objects/contacts/batch/archive`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Create a batch of contacts
    #
    # + payload - Record with an array of contact data 
    # + return - successful operation 
    remote isolated function batchCreate(SimplePublicObjectInputArray payload) returns BatchResponseSimplePublicObject|BatchResponseSimplePublicObjectWithErrors|error {
        string resourcePath = string `/crm/v3/objects/contacts/batch/create`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchResponseSimplePublicObject|BatchResponseSimplePublicObjectWithErrors response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read a batch of contacts by internal ID, or unique property values
    #
    # + archived - Whether to return only results that have been archived. 
    # + payload - Object which contains array of internal IDs of contacts 
    # + return - successful operation 
    remote isolated function batchRead(SimplePublicObjectIdReadArray payload, boolean archived = false) returns BatchResponseSimplePublicObject|BatchResponseSimplePublicObjectWithErrors|error {
        string resourcePath = string `/crm/v3/objects/contacts/batch/read`;
        map<anydata> queryParam = {"archived": archived};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchResponseSimplePublicObject|BatchResponseSimplePublicObjectWithErrors response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Update a batch of contacts
    #
    # + payload - Record with array of updated contact data 
    # + return - successful operation 
    remote isolated function batchUpdate(SimplePublicObjectArray payload) returns BatchResponseSimplePublicObject|BatchResponseSimplePublicObjectWithErrors|error {
        string resourcePath = string `/crm/v3/objects/contacts/batch/update`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchResponseSimplePublicObject|BatchResponseSimplePublicObjectWithErrors response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Filter, Sort, and Search CRM Objects
    #
    # + payload - Contact search request 
    # + return - successful operation 
    remote isolated function search(PublicObjectSearchRequest payload) returns CollectionResponseWithTotalSimplePublicObjectForwardPaging|error {
        string resourcePath = string `/crm/v3/objects/contacts/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CollectionResponseWithTotalSimplePublicObjectForwardPaging response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Read
    #
    # + contactId - Contact ID 
    # + properties - A comma separated list of the properties to be returned in the response. If any of the specified properties are not present on the requested object(s), they will be ignored. 
    # + associations - A comma separated list of object types to retrieve associated IDs for. If any of the specified associations do not exist, they will be ignored. 
    # + archived - Whether to return only results that have been archived. 
    # + idProperty - The name of a property whose values are unique for this object type 
    # + return - successful operation 
    remote isolated function getObjectById(string contactId, string[]? properties = (), string[]? associations = (), boolean archived = false, string? idProperty = ()) returns SimplePublicObjectWithAssociations|error {
        string resourcePath = string `/crm/v3/objects/contacts/${getEncodedUri(contactId)}`;
        map<anydata> queryParam = {"properties": properties, "associations": associations, "archived": archived, "idProperty": idProperty};
        map<Encoding> queryParamEncoding = {"properties": {style: FORM, explode: true}, "associations": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SimplePublicObjectWithAssociations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Archive
    #
    # + contactId - Contact ID 
    # + return - No content 
    remote isolated function archive(string contactId) returns http:Response|error {
        string resourcePath = string `/crm/v3/objects/contacts/${getEncodedUri(contactId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update
    #
    # + contactId - Contact ID 
    # + idProperty - The name of a property whose values are unique for this object type 
    # + payload - Attributes to update in contact 
    # + return - successful operation 
    remote isolated function update(string contactId, SimplePublicObjectInput payload, string? idProperty = ()) returns SimplePublicObject|error {
        string resourcePath = string `/crm/v3/objects/contacts/${getEncodedUri(contactId)}`;
        map<anydata> queryParam = {"idProperty": idProperty};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SimplePublicObject response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List associations of a contact by type
    #
    # + contactId - Contact ID 
    # + toObjectType - Object type to associate with 
    # + after - The paging cursor token of the last successfully read resource will be returned as the `paging.next.after` JSON property of a paged response containing more results. 
    # + 'limit - The maximum number of results to display per page. 
    # + return - successful operation 
    remote isolated function associationsGetAll(string contactId, string toObjectType, string? after = (), int 'limit = 500) returns CollectionResponseAssociatedIdForwardPaging|error {
        string resourcePath = string `/crm/v3/objects/contacts/${getEncodedUri(contactId)}/associations/${getEncodedUri(toObjectType)}`;
        map<anydata> queryParam = {"after": after, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        CollectionResponseAssociatedIdForwardPaging response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Associate a contact with another object
    #
    # + contactId - Contact ID 
    # + toObjectType - Object type to associate with 
    # + toObjectId - Object ID to associate 
    # + associationType - Type of the association 
    # + return - successful operation 
    remote isolated function associationsCreate(string contactId, string toObjectType, string toObjectId, string associationType) returns SimplePublicObjectWithAssociations|error {
        string resourcePath = string `/crm/v3/objects/contacts/${getEncodedUri(contactId)}/associations/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}/${getEncodedUri(associationType)}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        SimplePublicObjectWithAssociations response = check self.clientEp-> put(resourcePath, request);
        return response;
    }
    # Remove an association between two contacts
    #
    # + contactId - Contact ID 
    # + toObjectType - Object type to associate with 
    # + toObjectId - Object ID to associate 
    # + associationType - Type of the association 
    # + return - No content 
    remote isolated function associationsArchive(string contactId, string toObjectType, string toObjectId, string associationType) returns http:Response|error {
        string resourcePath = string `/crm/v3/objects/contacts/${getEncodedUri(contactId)}/associations/${getEncodedUri(toObjectType)}/${getEncodedUri(toObjectId)}/${getEncodedUri(associationType)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
}
