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
    OAuth2ClientCredentialsGrantConfig auth;
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

# OAuth2 Client Credentials Grant Configs
public type OAuth2ClientCredentialsGrantConfig record {|
    *http:OAuth2ClientCredentialsGrantConfig;
    # Token URL
    string tokenUrl = "https://app.leanix.net/services/mtm/v1/oauth2/token";
|};

# This is a generated connector for [LeanIX Integration API v1](https://eu.leanix.net/services/integration-api/v1/docs/) OpenAPI specification.
# The Integration API provides the ability to import and export data using a generic LeanIX Data Interchange Format (LDIF). LDIF is a JSON format with a very simple structure described in the following sections. All mapping and processing of the incoming and outgoing data is done using "Data Processors" that are configured behind the API. Configuration of the processors can be done using the UI, please see the [Setup](https://docs-eas.leanix.net/docs/setup) page for more information. The configurations can be managed using the Integration API as well.
@display {label: "Leanix Integration", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [LeanIX Account](https://www.leanix.net/en/) and obtain tokens following [this guide](https://docs-eas.leanix.net/docs/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://eu.leanix.net/services/integration-api/v1") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Returns a starter example including an Input object and processor configuration
    #
    # + return - Returns a complete input example with processor configurations 
    remote isolated function starterExample() returns InputWithProcessorConfig|error {
        string resourcePath = string `/examples/starterExample`;
        InputWithProcessorConfig response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns an advanced example including an Input object and processor configuration
    #
    # + return - Returns a complete input example with processor configurations 
    remote isolated function advancedExample() returns InputWithProcessorConfig|error {
        string resourcePath = string `/examples/advancedExample`;
        InputWithProcessorConfig response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns a list of available processor configurations
    #
    # + connectorType - The type of connector that is used 
    # + connectorId - The identifier of the connector instance 
    # + connectorVersion - The version of the connector that is expected to process this LDIF file 
    # + processingDirection - The data flow direction, could be [inbound, outbound] 
    # + processingMode - The processing mode, could be [partial, full] 
    # + return - successful operation 
    remote isolated function getProcessorConfigurations(string? connectorType = (), string? connectorId = (), string? connectorVersion = (), string? processingDirection = (), string? processingMode = ()) returns ProcessorConfiguration|error {
        string resourcePath = string `/configurations`;
        map<anydata> queryParam = {"connectorType": connectorType, "connectorId": connectorId, "connectorVersion": connectorVersion, "processingDirection": processingDirection, "processingMode": processingMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ProcessorConfiguration response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Inserts a new processor configuration or updates an existing one
    #
    # + return - Upsert successful. 
    remote isolated function upsertProcessorConfiguration(ProcessorConfiguration payload) returns http:Response|error {
        string resourcePath = string `/configurations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete a single processor configuration
    #
    # + connectorType - The type of connector that is used 
    # + connectorId - The identifier of the connector instance 
    # + connectorVersion - The version of the connector that is expected to process this LDIF file 
    # + processingDirection - The data flow direction, could be [inbound, outbound] 
    # + processingMode - The processing mode, could be [partial, full] 
    # + return - Not all necessary fields are set in parameters. 
    remote isolated function deleteProcessorConfiguration(string? connectorType = (), string? connectorId = (), string? connectorVersion = (), string? processingDirection = (), string? processingMode = ()) returns http:Response|error {
        string resourcePath = string `/configurations`;
        map<anydata> queryParam = {"connectorType": connectorType, "connectorId": connectorId, "connectorVersion": connectorVersion, "processingDirection": processingDirection, "processingMode": processingMode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Returns the status of all existing synchronization runs
    #
    # + return - A list containing current status of all available synchronization runs 
    remote isolated function getSynchronizationRunsStatusList() returns StatusResponse[]|error {
        string resourcePath = string `/synchronizationRuns`;
        StatusResponse[] response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a synchronization run.
    #
    # + 'start - If true the created run will be enqueued to be started 
    # + test - If true a dry run without any changes will be performed. This parameter requires the start parameter to be set to true as well 
    # + return - Returns the ID of the new synchronization run. 
    remote isolated function createSynchronizationRun(Input payload, boolean 'start = false, boolean test = false) returns StatusResponse[]|error {
        string resourcePath = string `/synchronizationRuns`;
        map<anydata> queryParam = {"start": 'start, "test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        StatusResponse[] response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Starts an existing but not yet started synchronization run
    #
    # + id - The ID of the synchronization run 
    # + test - If true a dry run without any changes will be performed 
    # + return - The synchronization run was successfully started and is now in progress 
    remote isolated function startSynchronizationRun(string id, boolean test = false) returns http:Response|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/start`;
        map<anydata> queryParam = {"test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Shows the progress of a synchronization run, it gives updated counters of the run level that is in execution.
    #
    # + id - The ID of the synchronization run 
    # + return - The synchronization run exists and progress information was searched. 
    remote isolated function getSynchronizationRunProgress(string id) returns SyncRunInboundProgressReport|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/progress`;
        SyncRunInboundProgressReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Stops a running synchronization run
    #
    # + id - The ID of the synchronization run 
    # + return - The synchronization run was successfully stopped. 
    remote isolated function stopSynchronizationRun(string id) returns http:Response|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/stop`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Returns the status of an existing synchronization run
    #
    # + id - The ID of the synchronization run 
    # + return - Returns the status of an existing synchronization run. 
    remote isolated function getSynchronizationRunStatus(string id) returns http:Response|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/status`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the results of a finished synchronization run
    #
    # + id - The ID of the synchronization run 
    # + return - Returns the results of a finished synchronization run. 
    remote isolated function getSynchronizationRunResults(string id) returns http:Response|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/results`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the url to the results of a finished synchronization run
    #
    # + id - The ID of the synchronization run 
    # + return - Returns the url to the results of a finished synchronization run or in case the run exists but is not yet finished a null value for the url. 
    remote isolated function getSynchronizationRunResultsUrl(string id) returns http:Response|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/resultsUrl`;
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Returns the warnings of a synchronization run
    #
    # + offset - The zero-based index of the first element to retrieve 
    # + 'limit - The number of elements that should be retrieved 
    # + id - The ID of the synchronization run 
    # + return - Returns the warnings of a synchronization run. 
    remote isolated function getSynchronizationRunWarnings(string id, int offset = 0, int 'limit = 100) returns http:Response|error {
        string resourcePath = string `/synchronizationRuns/${getEncodedUri(id)}/warnings`;
        map<anydata> queryParam = {"offset": offset, "limit": 'limit};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Starts a new synchronization run using the processor configuration and input object provided in the request.
    #
    # + 'start - If true the created run will be enqueued to be started 
    # + test - If true a dry run without any changes will be performed. This parameter requires the start parameter to be set to true as well 
    # + return - Successful operation, the response contains the ID of the run. 
    remote isolated function createSynchronizationRunWithConfig(InputWithProcessorConfig payload, boolean 'start = false, boolean test = false) returns SynchronizationRun|error {
        string resourcePath = string `/synchronizationRuns/withConfig`;
        map<anydata> queryParam = {"start": 'start, "test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SynchronizationRun response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Starts a new synchronization run using a DataProvider information to obtain the LDIF input
    #
    # + 'start - If true the created run will be enqueued to be started 
    # + test - If true a dry run without any changes will be performed. This parameter requires the start parameter to be set to true as well 
    # + return - Successful operation, the response contains the ID of the run and the processor configuration selected for the run. 
    remote isolated function createSynchronizationRunWithUrlInput(DataProvider payload, boolean 'start = false, boolean test = false) returns SynchronizationRunWithConfiguration|error {
        string resourcePath = string `/synchronizationRuns/withUrlInput`;
        map<anydata> queryParam = {"start": 'start, "test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SynchronizationRunWithConfiguration response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Starts a new synchronization run using combined processor configuration within an execution group and input object provided in the request.
    #
    # + groupName - The name of execution group 
    # + 'start - If true the created run will be enqueued to be started 
    # + test - If true a dry run without any changes will be performed. This parameter requires the start parameter to be set to true as well 
    # + return - Successful operation, the response contains the ID of the run. 
    remote isolated function createSynchronizationRunWithExecutionGroup(Input payload, string? groupName = (), boolean 'start = false, boolean test = false) returns SynchronizationRunWithConfiguration|error {
        string resourcePath = string `/synchronizationRuns/withExecutionGroup`;
        map<anydata> queryParam = {"groupName": groupName, "start": 'start, "test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SynchronizationRunWithConfiguration response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Creates a fast synchronization run.
    #
    # + test - If true a dry run without any changes will be performed 
    # + return - Results of the execution, it includes error messages and statistics about the run. 
    remote isolated function createSynchronizationFastRun(Input payload, boolean test = false) returns FastRunResponse|error {
        string resourcePath = string `/fastSynchronizationRuns`;
        map<anydata> queryParam = {"test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FastRunResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Starts a new fast run synchronization using the processor configuration and input object provided in the request.
    #
    # + test - If true a dry run without any changes will be performed 
    # + return - Results of the execution, it includes error messages and statistics about the run. 
    remote isolated function createSynchronizationFastRunWithConfig(InputWithProcessorConfig payload, boolean test = false) returns FastRunResponse|error {
        string resourcePath = string `/fastSynchronizationRuns/withConfig`;
        map<anydata> queryParam = {"test": test};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        FastRunResponse response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Provides storage resources that can be used for synchronisation runs. It creates a blob file in Azure Storage.
    #
    # + return - A new blob file was created and its ready for writing in Azure Blob Storage. 
    remote isolated function createInAzure() returns StorageManagerResponse|error {
        string resourcePath = string `/storages/azure`;
        StorageManagerResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
