// Copyright (c) 2022, WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
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

# This is a generated connector for [Mailchimp Marketing API v3.0.52](https://mailchimp.com/developer/marketing/) OpenAPI Specification. 
# The Mailchimp Marketing API allow to manage audiences, control automation workflows, sync email activity with your database and more.
@display {label: "Mailchimp", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Mailchimp account](https://login.mailchimp.com/signup/) and navigate to the [API Keys section](https://us1.admin.mailchimp.com/account/api/).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://server.api.mailchimp.com/3.0") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # List api root resources
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - The API root resource links to all other resources available in the API. 
    remote isolated function getRoot(string[]? fields = (), string[]? excludeFields = ()) returns ApiRoot|error {
        string resourcePath = string `/`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ApiRoot response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get latest chimp chatter
    #
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - ChimpChatter Collection 
    remote isolated function getActivityFeedChimpChatter(int count = 10, int offset = 0) returns InlineResponse200|error {
        string resourcePath = string `/activity-feed/chimp-chatter`;
        map<anydata> queryParam = {"count": count, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List authorized apps
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - An array of objects, each representing an authorized application. 
    remote isolated function getAuthorizedApps(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns InlineResponse2001|error {
        string resourcePath = string `/authorized-apps`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get authorized app info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + appId - The unique id for the connected authorized application. 
    # + return - An authorized app. 
    remote isolated function getAuthorizedAppsId(string appId, string[]? fields = (), string[]? excludeFields = ()) returns InlineResponse2002|error {
        string resourcePath = string `/authorized-apps/${getEncodedUri(appId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List automations
    #
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + beforeCreateTime - Restrict the response to automations created before this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCreateTime - Restrict the response to automations created after this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeStartTime - Restrict the response to automations started before this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceStartTime - Restrict the response to automations started after this time. Uses the ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + status - Restrict the results to automations with the specified status. 
    # + return - An array of objects, each representing an Automation workflow. 
    remote isolated function getAutomations(int count = 10, int offset = 0, string[]? fields = (), string[]? excludeFields = (), string? beforeCreateTime = (), string? sinceCreateTime = (), string? beforeStartTime = (), string? sinceStartTime = (), string? status = ()) returns InlineResponse2003|error {
        string resourcePath = string `/automations`;
        map<anydata> queryParam = {"count": count, "offset": offset, "fields": fields, "exclude_fields": excludeFields, "before_create_time": beforeCreateTime, "since_create_time": sinceCreateTime, "before_start_time": beforeStartTime, "since_start_time": sinceStartTime, "status": status};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add automation
    #
    # + payload - Add automation input payload 
    # + return - A summary of an individual Automation workflow's settings and content. 
    remote isolated function postAutomations(AutomationWorkflow payload) returns AutomationWorkflow1|error {
        string resourcePath = string `/automations`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AutomationWorkflow1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get automation info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + workflowId - The unique id for the Automation workflow. 
    # + return - A summary of an individual Automation workflow's settings and content. 
    remote isolated function getAutomationsId(string workflowId, string[]? fields = (), string[]? excludeFields = ()) returns AutomationWorkflow1|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AutomationWorkflow1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Pause automation emails
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdActionsPauseAllEmails(string workflowId) returns http:Response|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/actions/pause-all-emails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Start automation emails
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdActionsStartAllEmails(string workflowId) returns http:Response|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/actions/start-all-emails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Archive automation
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - Empty Response 
    remote isolated function archiveAutomations(string workflowId) returns http:Response|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/actions/archive`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List automated emails
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - A summary of the emails in an Automation workflow. 
    remote isolated function getAutomationsIdEmails(string workflowId) returns AutomationEmails|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails`;
        AutomationEmails response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get workflow email info
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - A summary of an individual Automation workflow email. 
    remote isolated function getAutomationsIdEmailsId(string workflowId, string workflowEmailId) returns AutomationWorkflowEmail|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}`;
        AutomationWorkflowEmail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete workflow email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - Empty Response 
    remote isolated function deleteAutomationsIdEmailsId(string workflowId, string workflowEmailId) returns http:Response|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update workflow email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + payload - Update workflow email input payload 
    # + return - A summary of an individual Automation workflow email. 
    remote isolated function patchAutomationEmailWorkflowId(string workflowId, string workflowEmailId, UpdateInformationAboutASpecificWorkflowEmail payload) returns AutomationWorkflowEmail|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        AutomationWorkflowEmail response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List automated email subscribers
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - An automation workflow 
    remote isolated function getAutomationsIdEmailsIdQueue(string workflowId, string workflowEmailId) returns InlineResponse2004|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}/queue`;
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add subscriber to workflow email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + payload - Add subscriber to workflow email input payload 
    # + return - Information about subscribers in an Automation email queue. 
    remote isolated function postAutomationsIdEmailsIdQueue(string workflowId, string workflowEmailId, SubscriberInAutomationQueue payload) returns SubscriberInAutomationQueue1|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}/queue`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberInAutomationQueue1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get automated email subscriber
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Information about subscribers in an Automation email queue. 
    remote isolated function getAutomationsIdEmailsIdQueueId(string workflowId, string workflowEmailId, string subscriberHash) returns SubscriberInAutomationQueue1|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}/queue/${getEncodedUri(subscriberHash)}`;
        SubscriberInAutomationQueue1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Pause automated email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdEmailsIdActionsPause(string workflowId, string workflowEmailId) returns http:Response|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}/actions/pause`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Start automated email
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + workflowEmailId - The unique id for the Automation workflow email. 
    # + return - Empty Response 
    remote isolated function postAutomationsIdEmailsIdActionsStart(string workflowId, string workflowEmailId) returns http:Response|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/emails/${getEncodedUri(workflowEmailId)}/actions/start`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List subscribers removed from workflow
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + return - A summary of the subscribers who were removed from an Automation workflow. 
    remote isolated function getAutomationsIdRemovedSubscribers(string workflowId) returns RemovedSubscribers|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/removed-subscribers`;
        RemovedSubscribers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Remove subscriber from workflow
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + payload - Remove subscriber from workflow input payload 
    # + return - A summary of a subscriber removed from an Automation workflow. 
    remote isolated function postAutomationsIdRemovedSubscribers(string workflowId, SubscriberInAutomationQueue2 payload) returns SubscriberRemovedFromAutomationWorkflow|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/removed-subscribers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberRemovedFromAutomationWorkflow response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get subscriber removed from workflow
    #
    # + workflowId - The unique id for the Automation workflow. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - A summary of a subscriber removed from an Automation workflow 
    remote isolated function getAutomationsIdRemovedSubscribersId(string workflowId, string subscriberHash) returns SubscriberRemovedFromAutomationWorkflow|error {
        string resourcePath = string `/automations/${getEncodedUri(workflowId)}/removed-subscribers/${getEncodedUri(subscriberHash)}`;
        SubscriberRemovedFromAutomationWorkflow response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List batch requests
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - A summary of batch requests that have been made. 
    remote isolated function getBatches(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns BatchOperations|error {
        string resourcePath = string `/batches`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BatchOperations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Start batch operation
    #
    # + return - The status of a batch request 
    remote isolated function postBatches(BatchesBody payload) returns Batch|error {
        string resourcePath = string `/batches`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Batch response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get batch operation status
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + batchId - The unique id for the batch operation. 
    # + return - The status of a batch request 
    remote isolated function getBatchesId(string batchId, string[]? fields = (), string[]? excludeFields = ()) returns Batch|error {
        string resourcePath = string `/batches/${getEncodedUri(batchId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Batch response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete batch request
    #
    # + batchId - The unique id for the batch operation. 
    # + return - Empty Response 
    remote isolated function deleteBatchesId(string batchId) returns http:Response|error {
        string resourcePath = string `/batches/${getEncodedUri(batchId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # List batch webhooks
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - Manage webhooks for batch requests. 
    remote isolated function getBatchWebhooks(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns BatchWebhooks|error {
        string resourcePath = string `/batch-webhooks`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BatchWebhooks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add batch webhook
    #
    remote isolated function postBatchWebhooks(BatchWebhook payload) returns BatchWebhook1|error {
        string resourcePath = string `/batch-webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchWebhook1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get batch webhook info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + batchWebhookId - The unique id for the batch webhook. 
    remote isolated function getBatchWebhook(string batchWebhookId, string[]? fields = (), string[]? excludeFields = ()) returns BatchWebhook1|error {
        string resourcePath = string `/batch-webhooks/${getEncodedUri(batchWebhookId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        BatchWebhook1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete batch webhook
    #
    # + batchWebhookId - The unique id for the batch webhook. 
    # + return - Empty Response 
    remote isolated function deleteBatchWebhookId(string batchWebhookId) returns http:Response|error {
        string resourcePath = string `/batch-webhooks/${getEncodedUri(batchWebhookId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update batch webhook
    #
    # + batchWebhookId - The unique id for the batch webhook. 
    remote isolated function patchBatchWebhooks(string batchWebhookId, BatchWebhook2 payload) returns BatchWebhook1|error {
        string resourcePath = string `/batch-webhooks/${getEncodedUri(batchWebhookId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchWebhook1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List template folders
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    remote isolated function getTemplateFolders(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns TemplateFolders|error {
        string resourcePath = string `/template-folders`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TemplateFolders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add template folder
    #
    remote isolated function postTemplateFolders(TemplateFolder payload) returns TemplateFolder1|error {
        string resourcePath = string `/template-folders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplateFolder1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get template folder
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + folderId - The unique id for the template folder. 
    remote isolated function getTemplateFoldersId(string folderId, string[]? fields = (), string[]? excludeFields = ()) returns TemplateFolder1|error {
        string resourcePath = string `/template-folders/${getEncodedUri(folderId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TemplateFolder1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete template folder
    #
    # + folderId - The unique id for the template folder. 
    # + return - Empty Response 
    remote isolated function deleteTemplateFoldersId(string folderId) returns http:Response|error {
        string resourcePath = string `/template-folders/${getEncodedUri(folderId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update template folder
    #
    # + folderId - The unique id for the template folder. 
    remote isolated function patchTemplateFoldersId(string folderId, TemplateFolder2 payload) returns TemplateFolder1|error {
        string resourcePath = string `/template-folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplateFolder1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List campaign folders
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    remote isolated function getCampaignFolders(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CampaignFolders|error {
        string resourcePath = string `/campaign-folders`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignFolders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add campaign folder
    #
    remote isolated function postCampaignFolders(CampaignFolder payload) returns CampaignFolder1|error {
        string resourcePath = string `/campaign-folders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignFolder1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get campaign folder
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + folderId - The unique id for the campaign folder. 
    remote isolated function getCampaignFoldersId(string folderId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignFolder1|error {
        string resourcePath = string `/campaign-folders/${getEncodedUri(folderId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignFolder1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete campaign folder
    #
    # + folderId - The unique id for the campaign folder. 
    # + return - Empty Response 
    remote isolated function deleteCampaignFoldersId(string folderId) returns http:Response|error {
        string resourcePath = string `/campaign-folders/${getEncodedUri(folderId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update campaign folder
    #
    # + folderId - The unique id for the campaign folder. 
    remote isolated function patchCampaignFoldersId(string folderId, CampaignFolder2 payload) returns CampaignFolder1|error {
        string resourcePath = string `/campaign-folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignFolder1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List campaigns
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - The campaign type. 
    # + status - The status of the campaign. 
    # + beforeSendTime - Restrict the response to campaigns sent before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceSendTime - Restrict the response to campaigns sent after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeCreateTime - Restrict the response to campaigns created before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCreateTime - Restrict the response to campaigns created after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + listId - The unique id for the list. 
    # + folderId - The unique folder id. 
    # + memberId - Retrieve campaigns sent to a particular list member. Member ID is The MD5 hash of the lowercase version of the list member’s email address. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + return - An array of campaigns 
    remote isolated function getCampaigns(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? status = (), string? beforeSendTime = (), string? sinceSendTime = (), string? beforeCreateTime = (), string? sinceCreateTime = (), string? listId = (), string? folderId = (), string? memberId = (), string? sortField = (), string? sortDir = ()) returns InlineResponse2005|error {
        string resourcePath = string `/campaigns`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "status": status, "before_send_time": beforeSendTime, "since_send_time": sinceSendTime, "before_create_time": beforeCreateTime, "since_create_time": sinceCreateTime, "list_id": listId, "folder_id": folderId, "member_id": memberId, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2005 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add campaign
    #
    # + payload - Add campaign input payload 
    # + return - A summary of an individual campaign's settings and content. 
    remote isolated function postCampaigns(Campaign payload) returns Campaign1|error {
        string resourcePath = string `/campaigns`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Campaign1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get campaign info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function getCampaignsId(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns Campaign1|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Campaign1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function deleteCampaignsId(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update campaign settings
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Update campaign input payload 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function patchCampaignsId(string campaignId, Campaign2 payload) returns Campaign1|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Campaign1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Cancel campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsCancelSend(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/cancel-send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Replicate campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function postCampaignsIdActionsReplicate(string campaignId) returns Campaign3|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/replicate`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Campaign3 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Send campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsSend(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/send`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Schedule campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Schedule campaign input payload 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsSchedule(string campaignId, ActionsScheduleBody payload) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/schedule`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Unschedule campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsUnschedule(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/unschedule`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Send test email
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Send test email input payload 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsTest(string campaignId, ActionsTestBody payload) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/test`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Pause rss campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsPause(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/pause`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Resume rss campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - Empty Response 
    remote isolated function postCampaignsIdActionsResume(string campaignId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/resume`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Resend campaign
    #
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of an individual campaign's settings and content 
    remote isolated function postCampaignsIdActionsCreateResend(string campaignId) returns Campaign3|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/actions/create-resend`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Campaign3 response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get campaign content
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - The HTML and plain-text content for a campaign 
    remote isolated function getCampaignsIdContent(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignContent|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/content`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignContent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Set campaign content
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Set campaign content input payload 
    # + return - The HTML and plain-text content for a campaign 
    remote isolated function putCampaignsIdContent(string campaignId, CampaignContent1 payload) returns CampaignContent|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/content`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignContent response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # List campaign feedback
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - A summary of the comment feedback for a specific campaign 
    remote isolated function getCampaignsIdFeedback(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignReports|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/feedback`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignReports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add campaign feedback
    #
    # + campaignId - The unique id for the campaign. 
    # + payload - Add campaign feedback input payload 
    # + return - A specific feedback message from a specific campaign 
    remote isolated function postCampaignsIdFeedback(string campaignId, CampaignFeedback payload) returns CampaignFeedback1|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/feedback`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignFeedback1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get campaign feedback message
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + feedbackId - The unique id for the feedback message. 
    # + return - A specific feedback message from a specific campaign 
    remote isolated function getCampaignsIdFeedbackId(string campaignId, string feedbackId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignFeedback1|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/feedback/${getEncodedUri(feedbackId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignFeedback1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete campaign feedback message
    #
    # + campaignId - The unique id for the campaign. 
    # + feedbackId - The unique id for the feedback message. 
    # + return - Empty Response 
    remote isolated function deleteCampaignsIdFeedbackId(string campaignId, string feedbackId) returns http:Response|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/feedback/${getEncodedUri(feedbackId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update campaign feedback message
    #
    # + campaignId - The unique id for the campaign. 
    # + feedbackId - The unique id for the feedback message. 
    # + payload - Update campaign feedback messages input payload 
    # + return - A specific feedback message from a specific campaign 
    remote isolated function patchCampaignsIdFeedbackId(string campaignId, string feedbackId, CampaignFeedback2 payload) returns CampaignFeedback1|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/feedback/${getEncodedUri(feedbackId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CampaignFeedback1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get campaign send checklist
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + return - The send checklist for the campaign 
    remote isolated function getCampaignsIdSendChecklist(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns SendChecklist|error {
        string resourcePath = string `/campaigns/${getEncodedUri(campaignId)}/send-checklist`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SendChecklist response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List connected sites
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    remote isolated function getConnectedSites(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns ConnectedSites|error {
        string resourcePath = string `/connected-sites`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ConnectedSites response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add connected site
    #
    remote isolated function postConnectedSites(ConnectedSite payload) returns ConnectedSite1|error {
        string resourcePath = string `/connected-sites`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConnectedSite1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get connected site
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + connectedSiteId - The unique identifier for the site. 
    remote isolated function getConnectedSitesId(string connectedSiteId, string[]? fields = (), string[]? excludeFields = ()) returns ConnectedSite1|error {
        string resourcePath = string `/connected-sites/${getEncodedUri(connectedSiteId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ConnectedSite1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete connected site
    #
    # + connectedSiteId - The unique identifier for the site. 
    # + return - Empty Response 
    remote isolated function deleteConnectedSitesId(string connectedSiteId) returns http:Response|error {
        string resourcePath = string `/connected-sites/${getEncodedUri(connectedSiteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Verify connected site script
    #
    # + connectedSiteId - The unique identifier for the site. 
    # + return - Empty Response 
    remote isolated function postConnectedSitesIdActionsVerifyScriptInstallation(string connectedSiteId) returns http:Response|error {
        string resourcePath = string `/connected-sites/${getEncodedUri(connectedSiteId)}/actions/verify-script-installation`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List conversations
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + hasUnreadMessages - Whether the conversation has any unread messages. 
    # + listId - The unique id for the list. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getConversations(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? hasUnreadMessages = (), string? listId = (), string? campaignId = ()) returns TrackedConversations|error {
        string resourcePath = string `/conversations`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "has_unread_messages": hasUnreadMessages, "list_id": listId, "campaign_id": campaignId};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TrackedConversations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get conversation
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + conversationId - The unique id for the conversation. 
    remote isolated function getConversationsId(string conversationId, string[]? fields = (), string[]? excludeFields = ()) returns Conversation|error {
        string resourcePath = string `/conversations/${getEncodedUri(conversationId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Conversation response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List messages
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + conversationId - The unique id for the conversation. 
    # + isRead - Whether a conversation message has been marked as read. 
    # + beforeTimestamp - Restrict the response to messages created before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceTimestamp - Restrict the response to messages created after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    remote isolated function getConversationsIdMessages(string conversationId, string[]? fields = (), string[]? excludeFields = (), string? isRead = (), string? beforeTimestamp = (), string? sinceTimestamp = ()) returns CollectionOfConversationMessages|error {
        string resourcePath = string `/conversations/${getEncodedUri(conversationId)}/messages`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "is_read": isRead, "before_timestamp": beforeTimestamp, "since_timestamp": sinceTimestamp};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfConversationMessages response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Post message
    #
    # + conversationId - The unique id for the conversation. 
    remote isolated function postConversationsIdMessages(string conversationId, ConversationMessage payload) returns ConversationMessage1|error {
        string resourcePath = string `/conversations/${getEncodedUri(conversationId)}/messages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ConversationMessage1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get message
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + conversationId - The unique id for the conversation. 
    # + messageId - The unique id for the conversation message. 
    remote isolated function getConversationsIdMessagesId(string conversationId, string messageId, string[]? fields = (), string[]? excludeFields = ()) returns ConversationMessage1|error {
        string resourcePath = string `/conversations/${getEncodedUri(conversationId)}/messages/${getEncodedUri(messageId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ConversationMessage1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Customer Journeys API trigger for a contact
    #
    # + journeyId - The id for the Journey. 
    # + stepId - The id for the Step. 
    # + return - An empty response 
    remote isolated function postCustomerJourneysJourneysIdStepsIdActionsTrigger(int journeyId, int stepId, SubscriberInCustomerJourneysAudience payload) returns json|error {
        string resourcePath = string `/customer-journeys/journeys/${getEncodedUri(journeyId)}/steps/${getEncodedUri(stepId)}/actions/trigger`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        json response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List stored files
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - The file type for the File Manager file. 
    # + createdBy - The Mailchimp account user who created the File Manager file. 
    # + beforeCreatedAt - Restrict the response to files created before the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCreatedAt - Restrict the response to files created after the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    remote isolated function getFileManagerFiles(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? createdBy = (), string? beforeCreatedAt = (), string? sinceCreatedAt = (), string? sortField = (), string? sortDir = ()) returns FileManager|error {
        string resourcePath = string `/file-manager/files`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "created_by": createdBy, "before_created_at": beforeCreatedAt, "since_created_at": sinceCreatedAt, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FileManager response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add file
    #
    remote isolated function postFileManagerFiles(GalleryFile payload) returns GalleryFile1|error {
        string resourcePath = string `/file-manager/files`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GalleryFile1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get file
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + fileId - The unique id for the File Manager file. 
    remote isolated function getFileManagerFilesId(string fileId, string[]? fields = (), string[]? excludeFields = ()) returns GalleryFile1|error {
        string resourcePath = string `/file-manager/files/${getEncodedUri(fileId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GalleryFile1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete file
    #
    # + fileId - The unique id for the File Manager file. 
    # + return - Empty Response 
    remote isolated function deleteFileManagerFilesId(string fileId) returns http:Response|error {
        string resourcePath = string `/file-manager/files/${getEncodedUri(fileId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update file
    #
    # + fileId - The unique id for the File Manager file. 
    remote isolated function patchFileManagerFilesId(string fileId, GalleryFile2 payload) returns GalleryFile1|error {
        string resourcePath = string `/file-manager/files/${getEncodedUri(fileId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GalleryFile1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List folders
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + createdBy - The Mailchimp account user who created the File Manager file. 
    # + beforeCreatedAt - Restrict the response to files created before the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCreatedAt - Restrict the response to files created after the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    remote isolated function getFileManagerFolders(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? createdBy = (), string? beforeCreatedAt = (), string? sinceCreatedAt = ()) returns FileManagerFolders|error {
        string resourcePath = string `/file-manager/folders`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "created_by": createdBy, "before_created_at": beforeCreatedAt, "since_created_at": sinceCreatedAt};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        FileManagerFolders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add folder
    #
    remote isolated function postFileManagerFolders(GalleryFolder payload) returns GalleryFolder1|error {
        string resourcePath = string `/file-manager/folders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GalleryFolder1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get folder
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + folderId - The unique id for the File Manager folder. 
    remote isolated function getFileManagerFoldersId(string folderId, string[]? fields = (), string[]? excludeFields = ()) returns GalleryFolder1|error {
        string resourcePath = string `/file-manager/folders/${getEncodedUri(folderId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GalleryFolder1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete folder
    #
    # + folderId - The unique id for the File Manager folder. 
    # + return - Empty Response 
    remote isolated function deleteFileManagerFoldersId(string folderId) returns http:Response|error {
        string resourcePath = string `/file-manager/folders/${getEncodedUri(folderId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update folder
    #
    # + folderId - The unique id for the File Manager folder. 
    remote isolated function patchFileManagerFoldersId(string folderId, GalleryFolder2 payload) returns GalleryFolder1|error {
        string resourcePath = string `/file-manager/folders/${getEncodedUri(folderId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        GalleryFolder1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Get lists info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + beforeDateCreated - Restrict response to lists created before the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceDateCreated - Restrict results to lists created after the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeCampaignLastSent - Restrict results to lists created before the last campaign send date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceCampaignLastSent - Restrict results to lists created after the last campaign send date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + email - Restrict results to lists that include a specific subscriber's email address. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + hasEcommerceStore - Restrict results to lists that contain an active, connected, undeleted ecommerce store. 
    # + return - A collection of subscriber lists for this account. Lists contain subscribers who have opted-in to receive correspondence from you or your organization 
    remote isolated function getLists(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? beforeDateCreated = (), string? sinceDateCreated = (), string? beforeCampaignLastSent = (), string? sinceCampaignLastSent = (), string? email = (), string? sortField = (), string? sortDir = (), boolean? hasEcommerceStore = ()) returns SubscriberLists|error {
        string resourcePath = string `/lists`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "before_date_created": beforeDateCreated, "since_date_created": sinceDateCreated, "before_campaign_last_sent": beforeCampaignLastSent, "since_campaign_last_sent": sinceCampaignLastSent, "email": email, "sort_field": sortField, "sort_dir": sortDir, "has_ecommerce_store": hasEcommerceStore};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriberLists response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add list
    #
    # + payload - Add list input payload 
    # + return - Information about a specific list. 
    remote isolated function postLists(SubscriberList payload) returns SubscriberList1|error {
        string resourcePath = string `/lists`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberList1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get list info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + includeTotalContacts - Return the total_contacts field in the stats response, which contains an approximate contact count for the given list. 
    # + return - Information about a specific list 
    remote isolated function getListsId(string listId, string[]? fields = (), string[]? excludeFields = (), boolean? includeTotalContacts = ()) returns SubscriberList1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "include_total_contacts": includeTotalContacts};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SubscriberList1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Batch subscribe or unsubscribe
    #
    # + listId - The unique ID for the list. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + skipDuplicateCheck - If skip_duplicate_check is true, we will ignore duplicates sent in the request when using the batch sub/unsub on the lists endpoint. The status of the first appearance in the request will be saved. This defaults to false. 
    # + payload - Batch subscribe or unsubscribe input payload 
    # + return - Batch update list members 
    remote isolated function postListsId(string listId, MembersToSubscribeunsubscribeTofromAListInBatch payload, boolean? skipMergeValidation = (), boolean? skipDuplicateCheck = ()) returns BatchUpdateListMembers|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation, "skip_duplicate_check": skipDuplicateCheck};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchUpdateListMembers response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete list
    #
    # + listId - The unique ID for the list. 
    # + return - Empty Response 
    remote isolated function deleteListsId(string listId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update lists
    #
    # + listId - The unique ID for the list. 
    # + payload - Update the settings for a list input payload 
    # + return - Information about a specific list 
    remote isolated function patchListsId(string listId, SubscriberList2 payload) returns SubscriberList1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SubscriberList1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List abuse reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + return - A collection of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program 
    remote isolated function getListsIdAbuseReports(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns AbuseComplaints|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/abuse-reports`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AbuseComplaints response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get abuse report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + reportId - The id for the abuse report. 
    # + return - Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program 
    remote isolated function getListsIdAbuseReportsId(string listId, string reportId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns AbuseComplaint|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/abuse-reports/${getEncodedUri(reportId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AbuseComplaint response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List recent activity
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + return - Up to the previous 180 days of daily detailed aggregated activity stats for a specific list. Does not include AutoResponder or Automation activity 
    remote isolated function getListsIdActivity(string listId, string[]? fields = (), string[]? excludeFields = ()) returns ListActivity|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListActivity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List top email clients
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + return - The top email clients based on user-agent strings 
    remote isolated function getListsIdClients(string listId, string[]? fields = (), string[]? excludeFields = ()) returns EmailClients|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/clients`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EmailClients response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List growth history data
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + return - A month-by-month summary of a specific list's growth activity 
    remote isolated function getListsIdGrowthHistory(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = (), string? sortDir = ()) returns GrowthHistory|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/growth-history`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GrowthHistory response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get growth history by month
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + month - A specific month of list growth history. 
    # + return - A summary of a specific list's growth activity for a specific month and year 
    remote isolated function getListsIdGrowthHistoryId(string listId, string month, string[]? fields = (), string[]? excludeFields = ()) returns GrowthHistory1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/growth-history/${getEncodedUri(month)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        GrowthHistory1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List interest categories
    #
    # + listId - The unique ID for the list. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - Restrict results a type of interest group 
    # + return - Information about this list's interest categories 
    remote isolated function getListsIdInterestCategories(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = ()) returns InterestGroupings|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InterestGroupings response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add interest category
    #
    # + listId - The unique ID for the list. 
    # + payload - Add interest category input payload 
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application 
    remote isolated function postListsIdInterestCategories(string listId, InterestCategory payload) returns InterestCategory1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InterestCategory1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get interest category info
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application 
    remote isolated function getListsIdInterestCategoriesId(string listId, string interestCategoryId, string[]? fields = (), string[]? excludeFields = ()) returns InterestCategory1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InterestCategory1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete interest category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + return - Empty Response 
    remote isolated function deleteListsIdInterestCategoriesId(string listId, string interestCategoryId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update interest category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + payload - Update interest category input payload 
    # + return - Interest categories organize interests, which are used to group subscribers based on their preferences. These correspond to Group Titles the application 
    remote isolated function patchListsIdInterestCategoriesId(string listId, string interestCategoryId, InterestCategory2 payload) returns InterestCategory1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        InterestCategory1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List interests in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - A list of this category's interests 
    remote isolated function getListsIdInterestCategoriesIdInterests(string listId, string interestCategoryId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns Interests|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}/interests`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Interests response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + payload - Add interest in category input payload 
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application 
    remote isolated function postListsIdInterestCategoriesIdInterests(string listId, string interestCategoryId, Interest payload) returns Interest1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}/interests`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Interest1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + interestId - The specific interest or 'group name'. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application 
    remote isolated function getListsIdInterestCategoriesIdInterestsId(string listId, string interestCategoryId, string interestId, string[]? fields = (), string[]? excludeFields = ()) returns Interest1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}/interests/${getEncodedUri(interestId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Interest1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + interestId - The specific interest or 'group name'. 
    # + return - Empty Response 
    remote isolated function deleteListsIdInterestCategoriesIdInterestsId(string listId, string interestCategoryId, string interestId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}/interests/${getEncodedUri(interestId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update interest in category
    #
    # + listId - The unique ID for the list. 
    # + interestCategoryId - The unique ID for the interest category. 
    # + interestId - The specific interest or 'group name'. 
    # + payload - Update interest in category input payload 
    # + return - Assign subscribers to interests to group them together. Interests are referred to as 'group names' in the Mailchimp application 
    remote isolated function patchListsIdInterestCategoriesIdInterestsId(string listId, string interestCategoryId, string interestId, Interest2 payload) returns Interest1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/interest-categories/${getEncodedUri(interestCategoryId)}/interests/${getEncodedUri(interestId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Interest1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List segments
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + 'type - Limit results based on segment type. 
    # + sinceCreatedAt - Restrict results to segments created after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeCreatedAt - Restrict results to segments created before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + includeCleaned - Include cleaned members in response 
    # + includeTransactional - Include transactional members in response 
    # + includeUnsubscribed - Include unsubscribed members in response 
    # + sinceUpdatedAt - Restrict results to segments update after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeUpdatedAt - Restrict results to segments update before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + return - A list of available segments 
    remote isolated function previewASegment(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? sinceCreatedAt = (), string? beforeCreatedAt = (), boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = (), string? sinceUpdatedAt = (), string? beforeUpdatedAt = ()) returns CollectionOfSegments|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "since_created_at": sinceCreatedAt, "before_created_at": beforeCreatedAt, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed, "since_updated_at": sinceUpdatedAt, "before_updated_at": beforeUpdatedAt};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfSegments response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add segment
    #
    # + listId - The unique ID for the list. 
    # + payload - Add segment input payload 
    # + return - Information about a specific segment 
    remote isolated function postListsIdSegments(string listId, List3 payload) returns List4|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        List4 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get segment info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + includeCleaned - Include cleaned members in response 
    # + includeTransactional - Include transactional members in response 
    # + includeUnsubscribed - Include unsubscribed members in response 
    # + return - Information about a specific segment 
    remote isolated function getListsIdSegmentsId(string listId, string segmentId, string[]? fields = (), string[]? excludeFields = (), boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = ()) returns List4|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        List4 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Batch add or remove members
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + payload - Batch add or remove members input payload 
    # + return - Batch add/remove List members to/from static segment 
    remote isolated function postListsIdSegmentsId(string listId, string segmentId, MembersToAddremoveTofromAStaticSegment payload) returns BatchAddremoveListMembersTofromStaticSegment|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        BatchAddremoveListMembersTofromStaticSegment response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Delete segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + return - Empty Response 
    remote isolated function deleteListsIdSegmentsId(string listId, string segmentId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + payload - Update segment input payload 
    # + return - Information about a specific segment 
    remote isolated function patchListsIdSegmentsId(string listId, string segmentId, List5 payload) returns List4|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        List4 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List members in segment
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + includeCleaned - Include cleaned members in response 
    # + includeTransactional - Include transactional members in response 
    # + includeUnsubscribed - Include unsubscribed members in response 
    # + return - View members in a specific list segment 
    remote isolated function getListsIdSegmentsIdMembers(string listId, string segmentId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, boolean? includeCleaned = (), boolean? includeTransactional = (), boolean? includeUnsubscribed = ()) returns SegmentMembers|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "include_cleaned": includeCleaned, "include_transactional": includeTransactional, "include_unsubscribed": includeUnsubscribed};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SegmentMembers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member to segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + payload - Add member to segment input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed. 
    remote isolated function postListsIdSegmentsIdMembers(string listId, string segmentId, SegmentIdMembersBody payload) returns ListMembers|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}/members`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Remove list member from segment
    #
    # + listId - The unique ID for the list. 
    # + segmentId - The unique id for the segment. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Empty Response 
    remote isolated function deleteListsIdSegmentsIdMembersId(string listId, string segmentId, string subscriberHash) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/segments/${getEncodedUri(segmentId)}/members/${getEncodedUri(subscriberHash)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Search for tags on a list by name.
    #
    # + listId - The unique ID for the list. 
    # + name - The search query used to filter tags.  The search query will be compared to each tag as a prefix, so all tags that have a name starting with this field will be returned. 
    # + return - A list of tags matching the input query 
    remote isolated function searchTagsByName(string listId, string? name = ()) returns TagSearchResults|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/tag-search`;
        map<anydata> queryParam = {"name": name};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        TagSearchResults response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List members info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + listId - The unique ID for the list. 
    # + emailType - The email type. 
    # + status - The subscriber's status. 
    # + sinceTimestampOpt - Restrict results to subscribers who opted-in after the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeTimestampOpt - Restrict results to subscribers who opted-in before the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceLastChanged - Restrict results to subscribers whose information changed after the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeLastChanged - Restrict results to subscribers whose information changed before the set timeframe. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + uniqueEmailId - A unique identifier for the email address across all Mailchimp lists. 
    # + vipOnly - A filter to return only the list's VIP members. Passing `true` will restrict results to VIP list members, passing `false` will return all list members. 
    # + interestCategoryId - The unique id for the interest category. 
    # + interestIds - Used to filter list members by interests. Must be accompanied by interest_category_id and interest_match. The value must be a comma separated list of interest ids present for any supplied interest categories. 
    # + interestMatch - Used to filter list members by interests. Must be accompanied by interest_category_id and interest_ids. "any" will match a member with any of the interest supplied, "all" will only match members with every interest supplied, and "none" will match members without any of the interest supplied. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + sinceLastCampaign - Filter subscribers by those subscribed/unsubscribed/pending/cleaned since last email campaign send. Member status is required to use this filter. 
    # + unsubscribedSince - Filter subscribers by those unsubscribed since a specific date. Using any status other than unsubscribed with this filter will result in an error. 
    # + return - Manage members of a specific Mailchimp list, including currently subscribed, unsubscribed, and bounced members 
    remote isolated function getListsIdMembers(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? emailType = (), string? status = (), string? sinceTimestampOpt = (), string? beforeTimestampOpt = (), string? sinceLastChanged = (), string? beforeLastChanged = (), string? uniqueEmailId = (), boolean? vipOnly = (), string? interestCategoryId = (), string? interestIds = (), string? interestMatch = (), string? sortField = (), string? sortDir = (), boolean? sinceLastCampaign = (), string? unsubscribedSince = ()) returns ListMembers1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "email_type": emailType, "status": status, "since_timestamp_opt": sinceTimestampOpt, "before_timestamp_opt": beforeTimestampOpt, "since_last_changed": sinceLastChanged, "before_last_changed": beforeLastChanged, "unique_email_id": uniqueEmailId, "vip_only": vipOnly, "interest_category_id": interestCategoryId, "interest_ids": interestIds, "interest_match": interestMatch, "sort_field": sortField, "sort_dir": sortDir, "since_last_campaign": sinceLastCampaign, "unsubscribed_since": unsubscribedSince};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListMembers1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member to list
    #
    # + listId - The unique ID for the list. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + payload - Add members to list input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function postListsIdMembers(string listId, AddListMembers1 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers2 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get member info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function getListsIdMembersId(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListMembers2 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add or update list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + payload - Add or update list member input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function putListsIdMembersId(string listId, string subscriberHash, AddListMembers2 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers2 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Archive list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Empty Response 
    remote isolated function deleteListsIdMembersId(string listId, string subscriberHash) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + skipMergeValidation - If skip_merge_validation is true, member data will be accepted without merge field values, even if the merge field is usually required. This defaults to false. 
    # + payload - Update list member input payload 
    # + return - Individuals who are currently or have been previously subscribed to this list, including members who have bounced or unsubscribed 
    remote isolated function patchListsIdMembersId(string listId, string subscriberHash, AddListMembers3 payload, boolean? skipMergeValidation = ()) returns ListMembers2|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"skip_merge_validation": skipMergeValidation};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListMembers2 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # View recent activity 50
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + action - A comma seperated list of actions to return. 
    # + return - The last 50 member events for a list 
    remote isolated function getListsIdMembersIdActivity(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), string[]? action = ()) returns MemberActivityEvents|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "action": action};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}, "action": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MemberActivityEvents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # View recent activity
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + activityFilters - A comma-separated list of activity filters that correspond to a set of activity types, e.g "?activity_filters=open,bounce,click". 
    # + return - The member activity events for a given member 
    remote isolated function getListsIdMembersIdActivityFeed(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string[]? activityFilters = ()) returns MemberActivityEvents1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/activity-feed`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "activity_filters": activityFilters};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}, "activity_filters": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MemberActivityEvents1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List member tags
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - A list of tags assigned to a list member 
    remote isolated function getListMemberTags(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CollectionOfTags|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/tags`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfTags response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add or remove member tags
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + payload - Add or remove member tags input payload 
    # + return - Empty Response 
    remote isolated function postListMemberTags(string listId, string subscriberHash, MemberTags payload) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List member events
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts email addresses. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - A collection of events for a given contact 
    remote isolated function getListsIdMembersIdEvents(string listId, string subscriberHash, int count = 10, int offset = 0, string[]? fields = (), string[]? excludeFields = ()) returns CollectionOfEvents|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/events`;
        map<anydata> queryParam = {"count": count, "offset": offset, "fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfEvents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add event
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts email addresses. 
    # + payload - Add event input payload 
    # + return - Empty Response 
    remote isolated function postListMemberEvents(string listId, string subscriberHash, Events payload) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/events`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        http:Response response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List member goal events
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - The last 50 Goal events for a member on a specific list 
    remote isolated function getListsIdMembersIdGoals(string listId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns CollectionOfMemberActivityEvents|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/goals`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfMemberActivityEvents response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List recent member notes
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + sortField - Returns notes sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - The last 10 notes for a specific list member, based on date created 
    remote isolated function getListsIdMembersIdNotes(string listId, string subscriberHash, string? sortField = (), string? sortDir = (), string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CollectionOfNotes|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/notes`;
        map<anydata> queryParam = {"sort_field": sortField, "sort_dir": sortDir, "fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfNotes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add member note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + payload - Add member note input payload 
    # + return - A specific note for a specific member 
    remote isolated function postListsIdMembersIdNotes(string listId, string subscriberHash, MemberNotes payload) returns MemberNotes1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MemberNotes1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get member note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + noteId - The id for the note. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - A specific note for a specific member 
    remote isolated function getListsIdMembersIdNotesId(string listId, string subscriberHash, string noteId, string[]? fields = (), string[]? excludeFields = ()) returns MemberNotes1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/notes/${getEncodedUri(noteId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MemberNotes1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + noteId - The id for the note. 
    # + return - Empty Response 
    remote isolated function deleteListsIdMembersIdNotesId(string listId, string subscriberHash, string noteId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/notes/${getEncodedUri(noteId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update note
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + noteId - The id for the note. 
    # + payload - Update note input payload 
    # + return - A specific note for a specific member 
    remote isolated function patchListsIdMembersIdNotesId(string listId, string subscriberHash, string noteId, MemberNotes2 payload) returns MemberNotes1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/notes/${getEncodedUri(noteId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MemberNotes1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Delete list member
    #
    # + listId - The unique ID for the list. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + return - Empty Response 
    remote isolated function postListsIdMembersHashActionsDeletePermanent(string listId, string subscriberHash) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/members/${getEncodedUri(subscriberHash)}/actions/delete-permanent`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # List merge fields
    #
    # + listId - The unique ID for the list. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - The merge field type. 
    # + required - The boolean value if the merge field is required. 
    # + return - The merge field (formerly merge vars) for a list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function getListsIdMergeFields(string listId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), boolean? required = ()) returns CollectionOfMergeFields|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/merge-fields`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "required": required};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CollectionOfMergeFields response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add merge field
    #
    # + listId - The unique ID for the list. 
    # + payload - Add merge field input payload 
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function postListsIdMergeFields(string listId, MergeField payload) returns MergeField1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/merge-fields`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MergeField1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get merge field
    #
    # + listId - The unique ID for the list. 
    # + mergeId - The id for the merge field. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function getListsIdMergeFieldsId(string listId, string mergeId, string[]? excludeFields = (), string[]? fields = ()) returns MergeField1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/merge-fields/${getEncodedUri(mergeId)}`;
        map<anydata> queryParam = {"exclude_fields": excludeFields, "fields": fields};
        map<Encoding> queryParamEncoding = {"exclude_fields": {style: FORM, explode: false}, "fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        MergeField1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete merge field
    #
    # + listId - The unique ID for the list. 
    # + mergeId - The id for the merge field. 
    # + return - Empty Response 
    remote isolated function deleteListsIdMergeFieldsId(string listId, string mergeId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/merge-fields/${getEncodedUri(mergeId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update merge field
    #
    # + listId - The unique ID for the list. 
    # + mergeId - The id for the merge field. 
    # + payload - Update merge field input payload 
    # + return - A merge field (formerly merge vars) for a specific list. These correspond to merge fields in Mailchimp's lists and subscriber profiles 
    remote isolated function patchListsIdMergeFieldsId(string listId, string mergeId, MergeField2 payload) returns MergeField1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/merge-fields/${getEncodedUri(mergeId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        MergeField1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List webhooks
    #
    # + listId - The unique ID for the list. 
    # + return - Manage webhooks for a specific list 
    remote isolated function getListsIdWebhooks(string listId) returns ListWebhooks|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/webhooks`;
        ListWebhooks response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add webhook
    #
    # + listId - The unique ID for the list. 
    # + payload - Add webhook input payload 
    # + return - Webhook configured for the given list 
    remote isolated function postListsIdWebhooks(string listId, AddWebhook payload) returns ListWebhooks1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/webhooks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListWebhooks1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get webhook info
    #
    # + listId - The unique ID for the list. 
    # + webhookId - The webhook's id. 
    # + return - Webhook configured for the given list 
    remote isolated function getListsIdWebhooksId(string listId, string webhookId) returns ListWebhooks1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/webhooks/${getEncodedUri(webhookId)}`;
        ListWebhooks1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete webhook
    #
    # + listId - The unique ID for the list. 
    # + webhookId - The webhook's id. 
    # + return - Empty Response 
    remote isolated function deleteListsIdWebhooksId(string listId, string webhookId) returns http:Response|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/webhooks/${getEncodedUri(webhookId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update webhook
    #
    # + listId - The unique ID for the list. 
    # + webhookId - The webhook's id. 
    # + payload - Update webhook input payload 
    # + return - Webhook configured for the given list 
    remote isolated function patchListsIdWebhooksId(string listId, string webhookId, AddWebhook1 payload) returns ListWebhooks1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/webhooks/${getEncodedUri(webhookId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        ListWebhooks1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List signup forms
    #
    # + listId - The unique ID for the list. 
    # + return - List Signup Forms. 
    remote isolated function getListsIdSignupForms(string listId) returns ListSignupForms|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/signup-forms`;
        ListSignupForms response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Customize signup form
    #
    # + listId - The unique ID for the list. 
    # + payload - Customize signup form input payload 
    # + return - List Signup Forms. 
    remote isolated function postListsIdSignupForms(string listId, SignupForm payload) returns SignupForm1|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/signup-forms`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        SignupForm1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List locations
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + listId - The unique ID for the list. 
    # + return - A summary of List's locations 
    remote isolated function getListsIdLocations(string listId, string[]? fields = (), string[]? excludeFields = ()) returns ListLocations|error {
        string resourcePath = string `/lists/${getEncodedUri(listId)}/locations`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ListLocations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List landing pages
    #
    # + sortDir - Determines the order direction for sorted results. 
    # + sortField - Returns files sorted by the specified field. 
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + return - Landing Pages Collection 
    remote isolated function getAllLandingPages(string? sortDir = (), string? sortField = (), string[]? fields = (), string[]? excludeFields = (), int count = 10) returns InlineResponse2006|error {
        string resourcePath = string `/landing-pages`;
        map<anydata> queryParam = {"sort_dir": sortDir, "sort_field": sortField, "fields": fields, "exclude_fields": excludeFields, "count": count};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2006 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add landing page
    #
    # + useDefaultList - Will create the Landing Page using the account's Default List instead of requiring a list_id. 
    # + payload - Add landing page input payload 
    remote isolated function postAllLandingPages(LandingPage payload, boolean? useDefaultList = ()) returns LandingPage1|error {
        string resourcePath = string `/landing-pages`;
        map<anydata> queryParam = {"use_default_list": useDefaultList};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LandingPage1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get landing page info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + pageId - The unique id for the page. 
    # + return - Landing Pages Instance 
    remote isolated function getLandingPageId(string pageId, string[]? fields = (), string[]? excludeFields = ()) returns LandingPage1|error {
        string resourcePath = string `/landing-pages/${getEncodedUri(pageId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LandingPage1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete landing page
    #
    # + pageId - The unique id for the page. 
    # + return - Empty Response 
    remote isolated function deleteLandingPageId(string pageId) returns http:Response|error {
        string resourcePath = string `/landing-pages/${getEncodedUri(pageId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update landing page
    #
    # + pageId - The unique id for the page. 
    remote isolated function patchLandingPageId(string pageId, LandingPage2 payload) returns LandingPage1|error {
        string resourcePath = string `/landing-pages/${getEncodedUri(pageId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        LandingPage1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Publish landing page
    #
    # + pageId - The unique id for the page. 
    # + return - Landing Page Published 
    remote isolated function postLandingPageIdActionsPublish(string pageId) returns LandingPage1|error? {
        string resourcePath = string `/landing-pages/${getEncodedUri(pageId)}/actions/publish`;
        http:Request request = new;
        //TODO: Update the request as needed;
        LandingPage1? response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Unpublish landing page
    #
    # + pageId - The unique id for the page. 
    # + return - Empty Response 
    remote isolated function postLandingPageIdActionsUnpublish(string pageId) returns http:Response|error {
        string resourcePath = string `/landing-pages/${getEncodedUri(pageId)}/actions/unpublish`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(resourcePath, request);
        return response;
    }
    # Get landing page content
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + pageId - The unique id for the page. 
    remote isolated function getLandingPageIdContent(string pageId, string[]? fields = (), string[]? excludeFields = ()) returns LandingPageContent|error {
        string resourcePath = string `/landing-pages/${getEncodedUri(pageId)}/content`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LandingPageContent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaign reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + 'type - The campaign type. 
    # + beforeSendTime - Restrict the response to campaigns sent before the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + sinceSendTime - Restrict the response to campaigns sent after the set time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    remote isolated function getReports(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? 'type = (), string? beforeSendTime = (), string? sinceSendTime = ()) returns CampaignReports1|error {
        string resourcePath = string `/reports`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "type": 'type, "before_send_time": beforeSendTime, "since_send_time": sinceSendTime};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignReports1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get campaign report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsId(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignReport|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List abuse reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdAbuseReportsId(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns AbuseComplaints1|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/abuse-reports`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AbuseComplaints1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get abuse report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + reportId - The id for the abuse report. 
    remote isolated function getReportsIdAbuseReportsIdId(string campaignId, string reportId, string[]? fields = (), string[]? excludeFields = ()) returns AbuseComplaint1|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/abuse-reports/${getEncodedUri(reportId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        AbuseComplaint1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaign feedback
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdAdvice(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignAdviceReport|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/advice`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignAdviceReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaign details
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdClickDetails(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns ClickDetailReport|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/click-details`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ClickDetailReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get campaign link details
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + linkId - The id for the link. 
    remote isolated function getReportsIdClickDetailsId(string campaignId, string linkId, string[]? fields = (), string[]? excludeFields = ()) returns ClickDetailReport1|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/click-details/${getEncodedUri(linkId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ClickDetailReport1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List clicked link subscribers
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    # + linkId - The id for the link. 
    remote isolated function getReportsIdClickDetailsIdMembers(string campaignId, string linkId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns ClickDetailMembers|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/click-details/${getEncodedUri(linkId)}/members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ClickDetailMembers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get clicked link subscriber
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + linkId - The id for the link. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    remote isolated function getReportsIdClickDetailsIdMembersId(string campaignId, string linkId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns ClickDetailMember|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/click-details/${getEncodedUri(linkId)}/members/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        ClickDetailMember response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaign open details
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    # + since - Restrict results to campaign open events that occur after a specific time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    remote isolated function getReportsIdOpenDetails(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? since = ()) returns OpenDetailReport|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/open-details`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "since": since};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OpenDetailReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get opened campaign subscriber
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    remote isolated function getReportsIdOpenDetailsIdMembersId(string campaignId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns OpenActivity|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/open-details/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OpenActivity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List domain performance stats
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdDomainPerformance(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns DomainPerformance|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/domain-performance`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        DomainPerformance response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List EepURL activity
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdEepurl(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns EepurlActivity|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/eepurl`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EepurlActivity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List email activity
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    # + since - Restrict results to email activity events that occur after a specific time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    remote isolated function getReportsIdEmailActivity(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? since = ()) returns EmailActivity|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/email-activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "since": since};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EmailActivity response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get subscriber email activity
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    # + since - Restrict results to email activity events that occur after a specific time. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    remote isolated function getReportsIdEmailActivityId(string campaignId, string subscriberHash, string[]? fields = (), string[]? excludeFields = (), string? since = ()) returns EmailActivity1|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/email-activity/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "since": since};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EmailActivity1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List top open activities
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    remote isolated function getReportsIdLocations(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns OpenLocations|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/locations`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OpenLocations response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaign recipients
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdSentTo(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns SentTo|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/sent-to`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SentTo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get campaign recipient info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    remote isolated function getReportsIdSentToId(string campaignId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns SentTo|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/sent-to/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        SentTo response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List child campaign reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdSubReportsId(string campaignId, string[]? fields = (), string[]? excludeFields = ()) returns CampaignSubreports|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/sub-reports`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CampaignSubreports response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List unsubscribed members
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    remote isolated function getReportsIdUnsubscribed(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns Unsubscribes|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/unsubscribed`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Unsubscribes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get unsubscribed member
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + campaignId - The unique id for the campaign. 
    # + subscriberHash - The MD5 hash of the lowercase version of the list member's email address. 
    remote isolated function getReportsIdUnsubscribedId(string campaignId, string subscriberHash, string[]? fields = (), string[]? excludeFields = ()) returns Unsubscribes1|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/unsubscribed/${getEncodedUri(subscriberHash)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Unsubscribes1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List campaign product activity
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - The unique id for the campaign. 
    # + sortField - Returns files sorted by the specified field. 
    # + return - Ecommerce Product Activity Instance 
    remote isolated function getReportsIdEcommerceProductActivity(string campaignId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = ()) returns InlineResponse2007|error {
        string resourcePath = string `/reports/${getEncodedUri(campaignId)}/ecommerce-product-activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List templates
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + createdBy - The Mailchimp account user who created the template. 
    # + sinceDateCreated - Restrict the response to templates created after the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + beforeDateCreated - Restrict the response to templates created before the set date. Uses ISO 8601 time format: 2015-10-21T15:41:36+00:00. 
    # + 'type - Limit results based on template type. 
    # + category - Limit results based on category. 
    # + folderId - The unique folder id. 
    # + sortField - Returns user templates sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    remote isolated function getTemplates(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? createdBy = (), string? sinceDateCreated = (), string? beforeDateCreated = (), string? 'type = (), string? category = (), string? folderId = (), string? sortField = (), string? sortDir = ()) returns Templates|error {
        string resourcePath = string `/templates`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "created_by": createdBy, "since_date_created": sinceDateCreated, "before_date_created": beforeDateCreated, "type": 'type, "category": category, "folder_id": folderId, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Templates response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add template
    #
    remote isolated function postTemplates(TemplateInstance payload) returns TemplateInstance1|error {
        string resourcePath = string `/templates`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplateInstance1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get template info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + templateId - The unique id for the template. 
    remote isolated function getTemplatesId(string templateId, string[]? fields = (), string[]? excludeFields = ()) returns TemplateInstance1|error {
        string resourcePath = string `/templates/${getEncodedUri(templateId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TemplateInstance1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete template
    #
    # + templateId - The unique id for the template. 
    # + return - Empty Response 
    remote isolated function deleteTemplatesId(string templateId) returns http:Response|error {
        string resourcePath = string `/templates/${getEncodedUri(templateId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update template
    #
    # + templateId - The unique id for the template. 
    remote isolated function patchTemplatesId(string templateId, TemplateInstance2 payload) returns TemplateInstance1|error {
        string resourcePath = string `/templates/${getEncodedUri(templateId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        TemplateInstance1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # View default content
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + templateId - The unique id for the template. 
    remote isolated function getTemplatesIdDefaultContent(string templateId, string[]? fields = (), string[]? excludeFields = ()) returns TemplateDefaultContent|error {
        string resourcePath = string `/templates/${getEncodedUri(templateId)}/default-content`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        TemplateDefaultContent response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List account orders
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + campaignId - Restrict results to orders with a specific `campaign_id` value. 
    # + outreachId - Restrict results to orders with a specific `outreach_id` value. 
    # + customerId - Restrict results to orders made by a specific customer. 
    # + hasOutreach - Restrict results to orders that have an outreach attached. For example, an email campaign or Facebook ad. 
    remote isolated function getEcommerceOrders(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? campaignId = (), string? outreachId = (), string? customerId = (), boolean? hasOutreach = ()) returns Orders|error {
        string resourcePath = string `/ecommerce/orders`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "campaign_id": campaignId, "outreach_id": outreachId, "customer_id": customerId, "has_outreach": hasOutreach};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Orders response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List stores
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    remote isolated function getEcommerceStores(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns EcommerceStores|error {
        string resourcePath = string `/ecommerce/stores`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceStores response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add store
    #
    remote isolated function postEcommerceStores(EcommerceStore payload) returns EcommerceStore1|error {
        string resourcePath = string `/ecommerce/stores`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceStore1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get store info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    remote isolated function getEcommerceStoresId(string storeId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceStore1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceStore1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete store
    #
    # + storeId - The store id. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresId(string storeId) returns json|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}`;
        json response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update store
    #
    # + storeId - The store id. 
    remote isolated function patchEcommerceStoresId(string storeId, EcommerceStore2 payload) returns EcommerceStore1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceStore1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List carts
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    remote isolated function getEcommerceStoresIdCarts(string storeId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns Carts|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Carts response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add cart
    #
    # + storeId - The store id. 
    remote isolated function postEcommerceStoresIdCarts(string storeId, EcommerceCart payload) returns EcommerceCart1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCart1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get cart info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    remote isolated function getEcommerceStoresIdCartsId(string storeId, string cartId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceCart1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceCart1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete cart
    #
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdCartsId(string storeId, string cartId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update cart
    #
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    remote isolated function patchEcommerceStoresIdCartsId(string storeId, string cartId, EcommerceCart2 payload) returns EcommerceCart1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCart1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List cart line items
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    remote isolated function getEcommerceStoresIdCartsIdLines(string storeId, string cartId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns CartLines|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}/lines`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        CartLines response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add cart line item
    #
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    remote isolated function postEcommerceStoresIdCartsIdLines(string storeId, string cartId, EcommerceCartLineItem2 payload) returns EcommerceCartLineItem3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}/lines`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCartLineItem3 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get cart line item
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    # + lineId - The id for the line item of a cart. 
    remote isolated function getEcommerceStoresIdCartsIdLinesId(string storeId, string cartId, string lineId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceCartLineItem3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}/lines/${getEncodedUri(lineId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceCartLineItem3 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete cart line item
    #
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    # + lineId - The id for the line item of a cart. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdCartsLinesId(string storeId, string cartId, string lineId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}/lines/${getEncodedUri(lineId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update cart line item
    #
    # + storeId - The store id. 
    # + cartId - The id for the cart. 
    # + lineId - The id for the line item of a cart. 
    remote isolated function patchEcommerceStoresIdCartsIdLinesId(string storeId, string cartId, string lineId, EcommerceCartLineItem4 payload) returns EcommerceCartLineItem3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/carts/${getEncodedUri(cartId)}/lines/${getEncodedUri(lineId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCartLineItem3 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List customers
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    # + emailAddress - Restrict the response to customers with the email address. 
    remote isolated function getEcommerceStoresIdCustomers(string storeId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? emailAddress = ()) returns Customers|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/customers`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "email_address": emailAddress};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Customers response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add customer
    #
    # + storeId - The store id. 
    remote isolated function postEcommerceStoresIdCustomers(string storeId, EcommerceCustomer2 payload) returns EcommerceCustomer3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/customers`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCustomer3 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get customer info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + customerId - The id for the customer of a store. 
    remote isolated function getEcommerceStoresIdCustomersId(string storeId, string customerId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceCustomer3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/customers/${getEncodedUri(customerId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceCustomer3 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add or update customer
    #
    # + storeId - The store id. 
    # + customerId - The id for the customer of a store. 
    remote isolated function putEcommerceStoresIdCustomersId(string storeId, string customerId, EcommerceCustomer4 payload) returns EcommerceCustomer3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/customers/${getEncodedUri(customerId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCustomer3 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete customer
    #
    # + storeId - The store id. 
    # + customerId - The id for the customer of a store. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdCustomersId(string storeId, string customerId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/customers/${getEncodedUri(customerId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update customer
    #
    # + storeId - The store id. 
    # + customerId - The id for the customer of a store. 
    remote isolated function patchEcommerceStoresIdCustomersId(string storeId, string customerId, EcommerceCustomer5 payload) returns EcommerceCustomer3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/customers/${getEncodedUri(customerId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceCustomer3 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List promo rules
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    remote isolated function getEcommerceStoresIdPromorules(string storeId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns PromoRules|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PromoRules response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add promo rule
    #
    # + storeId - The store id. 
    remote isolated function postEcommerceStoresIdPromorules(string storeId, EcommercePromoRule payload) returns EcommercePromoRule1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommercePromoRule1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get promo rule
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    remote isolated function getEcommerceStoresIdPromorulesId(string storeId, string promoRuleId, string[]? fields = (), string[]? excludeFields = ()) returns EcommercePromoRule1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommercePromoRule1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete promo rule
    #
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdPromorulesId(string storeId, string promoRuleId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update promo rule
    #
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    remote isolated function patchEcommerceStoresIdPromorulesId(string storeId, string promoRuleId, EcommercePromoRule2 payload) returns EcommercePromoRule1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommercePromoRule1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List promo codes
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + promoRuleId - The id for the promo rule of a store. 
    # + storeId - The store id. 
    remote isolated function getEcommerceStoresIdPromocodes(string promoRuleId, string storeId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns PromoCodes|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}/promo-codes`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        PromoCodes response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add promo code
    #
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    remote isolated function postEcommerceStoresIdPromocodes(string storeId, string promoRuleId, EcommercePromoCode payload) returns EcommercePromoCode1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}/promo-codes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommercePromoCode1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get promo code
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    # + promoCodeId - The id for the promo code of a store. 
    remote isolated function getEcommerceStoresIdPromocodesId(string storeId, string promoRuleId, string promoCodeId, string[]? fields = (), string[]? excludeFields = ()) returns EcommercePromoCode1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}/promo-codes/${getEncodedUri(promoCodeId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommercePromoCode1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete promo code
    #
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    # + promoCodeId - The id for the promo code of a store. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdPromocodesId(string storeId, string promoRuleId, string promoCodeId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}/promo-codes/${getEncodedUri(promoCodeId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update promo code
    #
    # + storeId - The store id. 
    # + promoRuleId - The id for the promo rule of a store. 
    # + promoCodeId - The id for the promo code of a store. 
    remote isolated function patchEcommerceStoresIdPromocodesId(string storeId, string promoRuleId, string promoCodeId, EcommercePromoCode2 payload) returns EcommercePromoCode1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/promo-rules/${getEncodedUri(promoRuleId)}/promo-codes/${getEncodedUri(promoCodeId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommercePromoCode1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List orders
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    # + customerId - Restrict results to orders made by a specific customer. 
    # + hasOutreach - Restrict results to orders that have an outreach attached. For example, an email campaign or Facebook ad. 
    # + campaignId - Restrict results to orders with a specific `campaign_id` value. 
    # + outreachId - Restrict results to orders with a specific `outreach_id` value. 
    remote isolated function getEcommerceStoresIdOrders(string storeId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? customerId = (), boolean? hasOutreach = (), string? campaignId = (), string? outreachId = ()) returns Orders1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "customer_id": customerId, "has_outreach": hasOutreach, "campaign_id": campaignId, "outreach_id": outreachId};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Orders1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add order
    #
    # + storeId - The store id. 
    remote isolated function postEcommerceStoresIdOrders(string storeId, EcommerceOrder payload) returns EcommerceOrder1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceOrder1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get order info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    remote isolated function getEcommerceStoresIdOrdersId(string storeId, string orderId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceOrder1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceOrder1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete order
    #
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdOrdersId(string storeId, string orderId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update order
    #
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    remote isolated function patchEcommerceStoresIdOrdersId(string storeId, string orderId, EcommerceOrder2 payload) returns EcommerceOrder1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceOrder1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List order line items
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    remote isolated function getEcommerceStoresIdOrdersIdLines(string storeId, string orderId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns OrderLines|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}/lines`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        OrderLines response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add order line item
    #
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    remote isolated function postEcommerceStoresIdOrdersIdLines(string storeId, string orderId, EcommerceOrderLineItem2 payload) returns EcommerceOrderLineItem3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}/lines`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceOrderLineItem3 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get order line item
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    # + lineId - The id for the line item of an order. 
    remote isolated function getEcommerceStoresIdOrdersIdLinesId(string storeId, string orderId, string lineId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceOrderLineItem3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}/lines/${getEncodedUri(lineId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceOrderLineItem3 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete order line item
    #
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    # + lineId - The id for the line item of an order. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdOrdersIdLinesId(string storeId, string orderId, string lineId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}/lines/${getEncodedUri(lineId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update order line item
    #
    # + storeId - The store id. 
    # + orderId - The id for the order in a store. 
    # + lineId - The id for the line item of an order. 
    remote isolated function patchEcommerceStoresIdOrdersIdLinesId(string storeId, string orderId, string lineId, EcommerceOrderLineItem4 payload) returns EcommerceOrderLineItem3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/orders/${getEncodedUri(orderId)}/lines/${getEncodedUri(lineId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceOrderLineItem3 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List product
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    remote isolated function getEcommerceStoresIdProducts(string storeId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns Products|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Products response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add product
    #
    # + storeId - The store id. 
    remote isolated function postEcommerceStoresIdProducts(string storeId, EcommerceProduct payload) returns EcommerceProduct1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProduct1 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get product info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    remote isolated function getEcommerceStoresIdProductsId(string storeId, string productId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceProduct1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceProduct1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete product
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdProductsId(string storeId, string productId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update product
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    remote isolated function patchEcommerceStoresIdProductsId(string storeId, string productId, EcommerceProduct2 payload) returns EcommerceProduct1|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProduct1 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List product variants
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    remote isolated function getEcommerceStoresIdProductsIdVariants(string storeId, string productId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns EcommerceProductVariants|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/variants`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceProductVariants response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add product variant
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    remote isolated function postEcommerceStoresIdProductsIdVariants(string storeId, string productId, EcommerceProductVariant2 payload) returns EcommerceProductVariant3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/variants`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProductVariant3 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get product variant info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + variantId - The id for the product variant. 
    remote isolated function getEcommerceStoresIdProductsIdVariantsId(string storeId, string productId, string variantId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceProductVariant3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/variants/${getEncodedUri(variantId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceProductVariant3 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add or update product variant
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + variantId - The id for the product variant. 
    remote isolated function putEcommerceStoresIdProductsIdVariantsId(string storeId, string productId, string variantId, EcommerceProductVariant4 payload) returns EcommerceProductVariant3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/variants/${getEncodedUri(variantId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProductVariant3 response = check self.clientEp->put(resourcePath, request);
        return response;
    }
    # Delete product variant
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + variantId - The id for the product variant. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdProductsIdVariantsId(string storeId, string productId, string variantId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/variants/${getEncodedUri(variantId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update product variant
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + variantId - The id for the product variant. 
    remote isolated function patchEcommerceStoresIdProductsIdVariantsId(string storeId, string productId, string variantId, EcommerceProductVariant5 payload) returns EcommerceProductVariant3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/variants/${getEncodedUri(variantId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProductVariant3 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # List product images
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    remote isolated function getEcommerceStoresIdProductsIdImages(string storeId, string productId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns EcommerceProductImages|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/images`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceProductImages response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add product image
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    remote isolated function postEcommerceStoresIdProductsIdImages(string storeId, string productId, EcommerceProductImage2 payload) returns EcommerceProductImage3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/images`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProductImage3 response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Get product image info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + imageId - The id for the product image. 
    remote isolated function getEcommerceStoresIdProductsIdImagesId(string storeId, string productId, string imageId, string[]? fields = (), string[]? excludeFields = ()) returns EcommerceProductImage3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/images/${getEncodedUri(imageId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        EcommerceProductImage3 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete product image
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + imageId - The id for the product image. 
    # + return - Empty Response 
    remote isolated function deleteEcommerceStoresIdProductsIdImagesId(string storeId, string productId, string imageId) returns http:Response|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/images/${getEncodedUri(imageId)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Update product image
    #
    # + storeId - The store id. 
    # + productId - The id for the product of a store. 
    # + imageId - The id for the product image. 
    remote isolated function patchEcommerceStoresIdProductsIdImagesId(string storeId, string productId, string imageId, EcommerceProductImage4 payload) returns EcommerceProductImage3|error {
        string resourcePath = string `/ecommerce/stores/${getEncodedUri(storeId)}/products/${getEncodedUri(productId)}/images/${getEncodedUri(imageId)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        EcommerceProductImage3 response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Search campaigns
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + query - The search query used to filter results. 
    remote isolated function getSearchCampaigns(string query, string[]? fields = (), string[]? excludeFields = ()) returns Campaigns|error {
        string resourcePath = string `/search-campaigns`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "query": query};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Campaigns response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Search members
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + query - The search query used to filter results. Query should be a valid email, or a string representing a contact's first or last name. 
    # + listId - The unique id for the list. 
    # + return - Members found for given search term 
    remote isolated function getSearchMembers(string query, string[]? fields = (), string[]? excludeFields = (), string? listId = ()) returns Members|error {
        string resourcePath = string `/search-members`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "query": query, "list_id": listId};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        Members response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Ping
    #
    # + return - API health status 
    remote isolated function getPing() returns ApiHealthStatus|error {
        string resourcePath = string `/ping`;
        ApiHealthStatus response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List facebook ads
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + return - List of Facebook Ad Instances 
    remote isolated function getAllFacebookAds(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = (), string? sortDir = ()) returns InlineResponse2008|error {
        string resourcePath = string `/facebook-ads`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2008 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get facebook ad info
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + outreachId - The outreach id. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Facebook Ad Instance 
    remote isolated function getFacebookAdsId(string outreachId, string[]? fields = (), string[]? excludeFields = ()) returns InlineResponse2009|error {
        string resourcePath = string `/facebook-ads/${getEncodedUri(outreachId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2009 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List facebook ads reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + sortField - Returns files sorted by the specified field. 
    # + sortDir - Determines the order direction for sorted results. 
    # + return - List of Facebook Ad Report Instances 
    remote isolated function getReportingFacebookAds(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = (), string? sortDir = ()) returns InlineResponse20010|error {
        string resourcePath = string `/reporting/facebook-ads`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField, "sort_dir": sortDir};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20010 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get facebook ad report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + outreachId - The outreach id. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Facebook Ad report Instance 
    remote isolated function getReportingFacebookAdsId(string outreachId, string[]? fields = (), string[]? excludeFields = ()) returns InlineResponse20011|error {
        string resourcePath = string `/reporting/facebook-ads/${getEncodedUri(outreachId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20011 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List facebook ecommerce report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + outreachId - The outreach id. 
    # + sortField - Returns files sorted by the specified field. 
    # + return - Ecommerce Product Activity Instance 
    remote isolated function getReportingFacebookAdsIdEcommerceProductActivity(string outreachId, string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0, string? sortField = ()) returns InlineResponse2007|error {
        string resourcePath = string `/reporting/facebook-ads/${getEncodedUri(outreachId)}/ecommerce-product-activity`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset, "sort_field": sortField};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2007 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get landing page report
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + outreachId - The outreach id. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + return - Landing Page Report Instance 
    remote isolated function getReportingLandingPagesId(string outreachId, string[]? fields = (), string[]? excludeFields = ()) returns LandingPageReport|error {
        string resourcePath = string `/reporting/landing-pages/${getEncodedUri(outreachId)}`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        LandingPageReport response = check self.clientEp->get(resourcePath);
        return response;
    }
    # List landing pages reports
    #
    # + fields - A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. 
    # + excludeFields - A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. 
    # + count - The number of records to return. Default value is 10. Maximum value is 1000 
    # + offset - Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. 
    # + return - List of Landing Page Report Instances 
    remote isolated function getReportingLandingPages(string[]? fields = (), string[]? excludeFields = (), int count = 10, int offset = 0) returns InlineResponse20012|error {
        string resourcePath = string `/reporting/landing-pages`;
        map<anydata> queryParam = {"fields": fields, "exclude_fields": excludeFields, "count": count, "offset": offset};
        map<Encoding> queryParamEncoding = {"fields": {style: FORM, explode: false}, "exclude_fields": {style: FORM, explode: false}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse20012 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Get domain info
    #
    # + domainName - The domain name. 
    # + return - The domains on the account 
    remote isolated function getVerifiedDomain(string domainName) returns VerifiedDomains|error {
        string resourcePath = string `/verified-domains/${getEncodedUri(domainName)}`;
        VerifiedDomains response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Delete domain
    #
    # + domainName - The domain name. 
    # + return - Empty Response 
    remote isolated function deleteVerifiedDomain(string domainName) returns http:Response|error {
        string resourcePath = string `/verified-domains/${getEncodedUri(domainName)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Verify domain
    #
    # + domainName - The domain name. 
    # + payload - Verify domain input payload 
    # + return - The domain being verified for sending. 
    remote isolated function verifyDomain(string domainName, ActionsVerifyBody payload) returns VerifiedDomains|error {
        string resourcePath = string `/verified-domains/${getEncodedUri(domainName)}/actions/verify`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerifiedDomains response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # List sending domains
    #
    # + return - The domains on the account. 
    remote isolated function getVerifiedDomains() returns VerifiedDomains1|error {
        string resourcePath = string `/verified-domains`;
        VerifiedDomains1 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Add domain to account
    #
    # + payload - Add domain to account input payload 
    # + return - The newly-created domain. 
    remote isolated function createVerifiedDomain(VerifiedDomains2 payload) returns VerifiedDomains|error {
        string resourcePath = string `/verified-domains`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        VerifiedDomains response = check self.clientEp->post(resourcePath, request);
        return response;
    }
}
