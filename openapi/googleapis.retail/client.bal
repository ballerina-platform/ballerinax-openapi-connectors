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
    string refreshUrl = "https://accounts.google.com/o/oauth2/token";
|};

# This is a generated connector for [Google Retail API v2](https://cloud.google.com/retail/docs/overview) OpenAPI specification.
# The Google Retail API provides the capability to to build end-to-end personalized recommendation systems without requiring a high level of expertise in machine learning, recommendation system, or Google Cloud.
@display {label: "Google Retail", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://retail.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Completes the specified prefix with keyword suggestions. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + catalog - Required. Catalog for which the completion is performed. Full resource name of catalog, such as `projects/*/locations/global/catalogs/default_catalog`. 
    # + dataset - Determines which dataset to use for fetching completion. "user-data" will use the imported dataset through CompletionService.ImportCompletionData. "cloud-retail" will use the dataset generated by cloud retail based on user events. If leave empty, it will use the "user-data". Current supported values: * user-data * cloud-retail This option requires additional allowlisting. Before using cloud-retail, contact Cloud Retail support team first. 
    # + deviceType - The device type context for completion suggestions. It is useful to apply different suggestions on different device types, e.g. DESKTOP, MOBILE. If it is empty, the suggestions are across all device types. Supported formats: * UNKNOWN_DEVICE_TYPE * DESKTOP * MOBILE * A customized string starts with OTHER_, e.g. OTHER_IPHONE. 
    # + languageCodes - The list of languages of the query. This is the BCP-47 language code, such as "en-US" or "sr-Latn". For more information, see [Tags for Identifying Languages](https://tools.ietf.org/html/bcp47). The maximum number of allowed characters is 255. Only "en-US" is currently supported. 
    # + maxSuggestions - Completion max suggestions. If left unset or set to 0, then will fallback to the configured value CompletionConfig.max_suggestions. The maximum allowed max suggestions is 20. If it is set higher, it will be capped by 20. 
    # + query - Required. The query used to generate suggestions. The maximum number of allowed characters is 255. 
    # + visitorId - A unique identifier for tracking visitors. For example, this could be implemented with an HTTP cookie, which should be able to uniquely identify a visitor on a single device. This unique identifier should not change if the visitor logs in or out of the website. The field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. 
    # + return - Successful response 
    remote isolated function completeQuery(string catalog, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? dataset = (), string? deviceType = (), string[]? languageCodes = (), int? maxSuggestions = (), string? query = (), string? visitorId = ()) returns GoogleCloudRetailV2CompleteQueryResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(catalog)}:completeQuery`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "dataset": dataset, "deviceType": deviceType, "languageCodes": languageCodes, "maxSuggestions": maxSuggestions, "query": query, "visitorId": visitorId};
        map<Encoding> queryParamEncoding = {"languageCodes": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GoogleCloudRetailV2CompleteQueryResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get which branch is currently default branch set by CatalogService.SetDefaultBranch method under a specified parent catalog. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + catalog - The parent catalog resource name, such as `projects/*/locations/global/catalogs/default_catalog`. 
    # + return - Successful response 
    remote isolated function getDefaultBranch(string catalog, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleCloudRetailV2GetDefaultBranchResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(catalog)}:getDefaultBranch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleCloudRetailV2GetDefaultBranchResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set a specified branch id as default branch. API methods such as SearchService.Search, ProductService.GetProduct, ProductService.ListProducts will treat requests using "default_branch" to the actual branch id set as default. For example, if `projects/*/locations/*/catalogs/*/branches/1` is set as default, setting SearchRequest.branch to `projects/*/locations/*/catalogs/*/branches/default_branch` is equivalent to setting SearchRequest.branch to `projects/*/locations/*/catalogs/*/branches/1`. Using multiple branches can be useful when developers would like to have a staging branch to test and verify for future usage. When it becomes ready, developers switch on the staging branch using this API while keeping using `projects/*/locations/*/catalogs/*/branches/default_branch` as SearchRequest.branch to route the traffic to this staging branch. CAUTION: If you have live predict/search traffic, switching the default branch could potentially cause outages if the ID space of the new branch is very different from the old one. More specifically: * PredictionService will only return product IDs from branch {newBranch}. * SearchService will only return product IDs from branch {newBranch} (if branch is not explicitly set). * UserEventService will only join events with products from branch {newBranch}. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + catalog - Full resource name of the catalog, such as `projects/*/locations/global/catalogs/default_catalog`. 
    # + payload - A GoogleCloudRetailV2SetDefaultBranchRequest record 
    # + return - Successful response 
    remote isolated function setDefaultBranch(string catalog, GoogleCloudRetailV2SetDefaultBranchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v2/${getEncodedUri(catalog)}:setDefaultBranch`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets the latest state of a long-running operation. Clients can use this method to poll the operation result at intervals as recommended by the API service.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the operation resource. 
    # + return - Successful response 
    remote isolated function getOperation(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleLongrunningOperation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a Product.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Required. Full resource name of Product, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/some_product_id`. If the caller does not have permission to delete the Product, regardless of whether or not it exists, a PERMISSION_DENIED error is returned. If the Product to delete does not exist, a NOT_FOUND error is returned. The Product to delete can neither be a Product.Type.COLLECTION Product member nor a Product.Type.PRIMARY Product with more than one variants. Otherwise, an INVALID_ARGUMENT error is returned. All inventory information for the named Product will be deleted. 
    # + return - Successful response 
    remote isolated function deleteProduct(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns http:Response|error {
        string resourcePath = string `/v2/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Updates a Product.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Immutable. Full resource name of the product, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/product_id`. The branch ID must be "default_branch". 
    # + allowMissing - If set to true, and the Product is not found, a new Product will be created. In this situation, `update_mask` is ignored. 
    # + updateMask - Indicates which fields in the provided Product to update. The immutable and output only fields are NOT supported. If not set, all supported fields (the fields that are neither immutable nor output only) are updated. If an unsupported or unknown field is provided, an INVALID_ARGUMENT error is returned. 
    # + payload - A GoogleCloudRetailV2Product record 
    # + return - Successful response 
    remote isolated function updateProduct(string name, GoogleCloudRetailV2Product payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? allowMissing = (), string? updateMask = ()) returns GoogleCloudRetailV2Product|error {
        string resourcePath = string `/v2/${getEncodedUri(name)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "allowMissing": allowMissing, "updateMask": updateMask};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleCloudRetailV2Product response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Lists operations that match the specified filter in the request. If the server doesn't support this method, it returns `UNIMPLEMENTED`. NOTE: the `name` binding allows API services to override the binding to use different resource name schemes, such as `users/*/operations`. To override the binding, API services can add a binding such as `"/v1/{name=users/*}/operations"` to their service configuration. For backwards compatibility, the default name includes the operations collection id, however overriding users must ensure the name binding is the parent resource, without the operations collection id.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - The name of the operation's parent resource. 
    # + filter - The standard list filter. 
    # + pageSize - The standard list page size. 
    # + pageToken - The standard list page token. 
    # + return - Successful response 
    remote isolated function listOperations(string name, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = ()) returns GoogleLongrunningListOperationsResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(name)}/operations`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleLongrunningListOperationsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Updates inventory information for a Product while respecting the last update timestamps of each inventory field. This process is asynchronous and does not require the Product to exist before updating fulfillment information. If the request is valid, the update will be enqueued and processed downstream. As a consequence, when a response is returned, updates are not immediately manifested in the Product queried by GetProduct or ListProducts. When inventory is updated with CreateProduct and UpdateProduct, the specified inventory field value(s) will overwrite any existing value(s) while ignoring the last update time for this field. Furthermore, the last update time for the specified inventory fields will be overwritten to the time of the CreateProduct or UpdateProduct request. If no inventory fields are set in CreateProductRequest.product, then any pre-existing inventory information for this product will be used. If no inventory fields are set in UpdateProductRequest.set_mask, then any existing inventory information will be preserved. Pre-existing inventory information can only be updated with SetInventory, AddFulfillmentPlaces, and RemoveFulfillmentPlaces. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + name - Immutable. Full resource name of the product, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/product_id`. The branch ID must be "default_branch". 
    # + payload - A GoogleCloudRetailV2SetInventoryRequest record 
    # + return - Successful response 
    remote isolated function setInventory(string name, GoogleCloudRetailV2SetInventoryRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(name)}:setInventory`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Lists all the Catalogs associated with the project.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The account resource name with an associated location. If the caller does not have permission to list Catalogs under this location, regardless of whether or not this location exists, a PERMISSION_DENIED error is returned. 
    # + pageSize - Maximum number of Catalogs to return. If unspecified, defaults to 50. The maximum allowed value is 1000. Values above 1000 will be coerced to 1000. If this field is negative, an INVALID_ARGUMENT is returned. 
    # + pageToken - A page token ListCatalogsResponse.next_page_token, received from a previous CatalogService.ListCatalogs call. Provide this to retrieve the subsequent page. When paginating, all other parameters provided to CatalogService.ListCatalogs must match the call that provided the page token. Otherwise, an INVALID_ARGUMENT error is returned. 
    # + return - Successful response 
    remote isolated function listCatalogs(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), int? pageSize = (), string? pageToken = ()) returns GoogleCloudRetailV2ListCatalogsResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/catalogs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleCloudRetailV2ListCatalogsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Bulk import of processed completion dataset. Request processing may be synchronous. Partial updating is not supported. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The catalog which the suggestions dataset belongs to. Format: `projects/1234/locations/global/catalogs/default_catalog`. 
    # + payload - A GoogleCloudRetailV2ImportCompletionDataRequest record 
    # + return - Successful response 
    remote isolated function importCompletionData(string parent, GoogleCloudRetailV2ImportCompletionDataRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/completionData:import`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a list of Products.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent branch resource name, such as `projects/*/locations/global/catalogs/default_catalog/branches/0`. Use `default_branch` as the branch ID, to list products under the default branch. If the caller does not have permission to list Products under this branch, regardless of whether or not this branch exists, a PERMISSION_DENIED error is returned. 
    # + filter - A filter to apply on the list results. Supported features: * List all the products under the parent branch if filter is unset. * List Product.Type.VARIANT Products sharing the same Product.Type.PRIMARY Product. For example: `primary_product_id = "some_product_id"` * List Products bundled in a Product.Type.COLLECTION Product. For example: `collection_product_id = "some_product_id"` * List Products with a partibular type. For example: `type = "PRIMARY"` `type = "VARIANT"` `type = "COLLECTION"` If the field is unrecognizable, an INVALID_ARGUMENT error is returned. If the specified Product.Type.PRIMARY Product or Product.Type.COLLECTION Product does not exist, a NOT_FOUND error is returned. 
    # + pageSize - Maximum number of Products to return. If unspecified, defaults to 100. The maximum allowed value is 1000. Values above 1000 will be coerced to 1000. If this field is negative, an INVALID_ARGUMENT error is returned. 
    # + pageToken - A page token ListProductsResponse.next_page_token, received from a previous ProductService.ListProducts call. Provide this to retrieve the subsequent page. When paginating, all other parameters provided to ProductService.ListProducts must match the call that provided the page token. Otherwise, an INVALID_ARGUMENT error is returned. 
    # + readMask - The fields of Product to return in the responses. If not set or empty, the following fields are returned: * Product.name * Product.id * Product.title * Product.uri * Product.images * Product.price_info * Product.brands If "*" is provided, all fields are returned. Product.name is always returned no matter what mask is set. If an unsupported or unknown field is provided, an INVALID_ARGUMENT error is returned. 
    # + return - Successful response 
    remote isolated function listProducts(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? filter = (), int? pageSize = (), string? pageToken = (), string? readMask = ()) returns GoogleCloudRetailV2ListProductsResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/products`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "filter": filter, "pageSize": pageSize, "pageToken": pageToken, "readMask": readMask};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleCloudRetailV2ListProductsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a Product.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent catalog resource name, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch`. 
    # + productId - Required. The ID to use for the Product, which will become the final component of the Product.name. If the caller does not have permission to create the Product, regardless of whether or not it exists, a PERMISSION_DENIED error is returned. This field must be unique among all Products with the same parent. Otherwise, an ALREADY_EXISTS error is returned. This field must be a UTF-8 encoded string with a length limit of 128 characters. Otherwise, an INVALID_ARGUMENT error is returned. 
    # + payload - A GoogleCloudRetailV2Product record 
    # + return - Successful response 
    remote isolated function createProduct(string parent, GoogleCloudRetailV2Product payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? productId = ()) returns GoogleCloudRetailV2Product|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/products`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "productId": productId};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleCloudRetailV2Product response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Bulk import of multiple Products. Request processing may be synchronous. No partial updating is supported. Non-existing items are created. Note that it is possible for a subset of the Products to be successfully updated.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. `projects/1234/locations/global/catalogs/default_catalog/branches/default_branch` If no updateMask is specified, requires products.create permission. If updateMask is specified, requires products.update permission. 
    # + payload - A GoogleCloudRetailV2ImportProductsRequest record 
    # + return - Successful response 
    remote isolated function importProducts(string parent, GoogleCloudRetailV2ImportProductsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/products:import`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Writes a single user event from the browser. This uses a GET request to due to browser restriction of POST-ing to a 3rd party domain. This method is used only by the Retail API JavaScript pixel and Google Tag Manager. Users should not call this method directly.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent catalog name, such as `projects/1234/locations/global/catalogs/default_catalog`. 
    # + ets - The event timestamp in milliseconds. This prevents browser caching of otherwise identical get requests. The name is abbreviated to reduce the payload bytes. 
    # + uri - The URL including cgi-parameters but excluding the hash fragment with a length limit of 5,000 characters. This is often more useful than the referer URL, because many browsers only send the domain for 3rd party requests. 
    # + userEvent - Required. URL encoded UserEvent proto with a length limit of 2,000,000 characters. 
    # + return - Successful response 
    remote isolated function userEventsCollect(string parent, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? ets = (), string? uri = (), string? userEvent = ()) returns GoogleApiHttpBody|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/userEvents:collect`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "ets": ets, "uri": uri, "userEvent": userEvent};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GoogleApiHttpBody response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Bulk import of User events. Request processing might be synchronous. Events that already exist are skipped. Use this method for backfilling historical user events. Operation.response is of type ImportResponse. Note that it is possible for a subset of the items to be successfully inserted. Operation.metadata is of type ImportMetadata.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. `projects/1234/locations/global/catalogs/default_catalog` 
    # + payload - A GoogleCloudRetailV2ImportUserEventsRequest record 
    # + return - Successful response 
    remote isolated function importUserEvents(string parent, GoogleCloudRetailV2ImportUserEventsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/userEvents:import`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Deletes permanently all user events specified by the filter provided. Depending on the number of events specified by the filter, this operation could take hours or days to complete. To test a filter, use the list command first.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The resource name of the catalog under which the events are created. The format is `projects/${projectId}/locations/global/catalogs/${catalogId}` 
    # + payload - A GoogleCloudRetailV2PurgeUserEventsRequest record 
    # + return - Successful response 
    remote isolated function purgeUserEvents(string parent, GoogleCloudRetailV2PurgeUserEventsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/userEvents:purge`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Triggers a user event rejoin operation with latest product catalog. Events will not be annotated with detailed product information if product is missing from the catalog at the time the user event is ingested, and these events are stored as unjoined events with a limited usage on training and serving. This API can be used to trigger a 'join' operation on specified events with latest version of product catalog. It can also be used to correct events joined with wrong product catalog.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent catalog resource name, such as `projects/1234/locations/global/catalogs/default_catalog`. 
    # + payload - A GoogleCloudRetailV2RejoinUserEventsRequest record 
    # + return - Successful response 
    remote isolated function userEventsRejoin(string parent, GoogleCloudRetailV2RejoinUserEventsRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/userEvents:rejoin`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Writes a single user event.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + parent - Required. The parent catalog resource name, such as `projects/1234/locations/global/catalogs/default_catalog`. 
    # + payload - A GoogleCloudRetailV2UserEvent record 
    # + return - Successful response 
    remote isolated function writeUserEvents(string parent, GoogleCloudRetailV2UserEvent payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleCloudRetailV2UserEvent|error {
        string resourcePath = string `/v2/${getEncodedUri(parent)}/userEvents:write`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleCloudRetailV2UserEvent response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Makes a recommendation prediction.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + placement - Required. Full resource name of the format: {name=projects/*/locations/global/catalogs/default_catalog/placements/*} The ID of the Recommendations AI placement. Before you can request predictions from your model, you must create at least one placement for it. For more information, see [Managing placements](https://cloud.google.com/retail/recommendations-ai/docs/manage-placements). The full list of available placements can be seen at https://console.cloud.google.com/recommendation/catalogs/default_catalog/placements 
    # + payload - A GoogleCloudRetailV2PredictRequest record 
    # + return - Successful response 
    remote isolated function predict(string placement, GoogleCloudRetailV2PredictRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleCloudRetailV2PredictResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(placement)}:predict`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleCloudRetailV2PredictResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Performs a search. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + placement - Required. The resource name of the search engine placement, such as `projects/*/locations/global/catalogs/default_catalog/placements/default_search`. This field is used to identify the set of models that will be used to make the search. We currently support one placement with the following ID: * `default_search`. 
    # + payload - A GoogleCloudRetailV2SearchRequest record 
    # + return - Successful response 
    remote isolated function search(string placement, GoogleCloudRetailV2SearchRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleCloudRetailV2SearchResponse|error {
        string resourcePath = string `/v2/${getEncodedUri(placement)}:search`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleCloudRetailV2SearchResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Incrementally adds place IDs to Product.fulfillment_info.place_ids. This process is asynchronous and does not require the Product to exist before updating fulfillment information. If the request is valid, the update will be enqueued and processed downstream. As a consequence, when a response is returned, the added place IDs are not immediately manifested in the Product queried by GetProduct or ListProducts. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + product - Required. Full resource name of Product, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/some_product_id`. If the caller does not have permission to access the Product, regardless of whether or not it exists, a PERMISSION_DENIED error is returned. 
    # + payload - A GoogleCloudRetailV2AddFulfillmentPlacesRequest record 
    # + return - Successful response 
    remote isolated function addFulfillmentPlaces(string product, GoogleCloudRetailV2AddFulfillmentPlacesRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(product)}:addFulfillmentPlaces`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Incrementally removes place IDs from a Product.fulfillment_info.place_ids. This process is asynchronous and does not require the Product to exist before updating fulfillment information. If the request is valid, the update will be enqueued and processed downstream. As a consequence, when a response is returned, the removed place IDs are not immediately manifested in the Product queried by GetProduct or ListProducts. This feature is only available for users who have Retail Search enabled. Please submit a form [here](https://cloud.google.com/contact) to contact cloud sales if you are interested in using Retail Search.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + product - Required. Full resource name of Product, such as `projects/*/locations/global/catalogs/default_catalog/branches/default_branch/products/some_product_id`. If the caller does not have permission to access the Product, regardless of whether or not it exists, a PERMISSION_DENIED error is returned. 
    # + payload - A GoogleCloudRetailV2RemoveFulfillmentPlacesRequest record 
    # + return - Successful response 
    remote isolated function removeFulfillmentPlaces(string product, GoogleCloudRetailV2RemoveFulfillmentPlacesRequest payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GoogleLongrunningOperation|error {
        string resourcePath = string `/v2/${getEncodedUri(product)}:removeFulfillmentPlaces`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GoogleLongrunningOperation response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
