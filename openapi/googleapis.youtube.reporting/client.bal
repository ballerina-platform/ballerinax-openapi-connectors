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

# This is a generated connector for [Youtube Reporting API v1](https://developers.google.com/youtube/reporting) OpenAPI specification.
# The Youtube Reporting API provides the capability to schedule reporting jobs containing your YouTube Analytics data and download the resulting bulk data reports in the form of CSV files.
@display {label: "Youtube Reporting", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Google account](https://accounts.google.com/signup) and obtain tokens by following [this guide](https://developers.google.com/identity/protocols/oauth2).    
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://youtubereporting.googleapis.com/") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Lists jobs.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + includeSystemManaged - If set to true, also system-managed jobs will be returned; otherwise only user-created jobs will be returned. System-managed jobs can neither be modified nor deleted. 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + pageSize - Requested page size. Server may return fewer jobs than requested. If unspecified, server will pick an appropriate default. 
    # + pageToken - A token identifying a page of results the server should return. Typically, this is the value of ListReportTypesResponse.next_page_token returned in response to the previous call to the `ListJobs` method. 
    # + return - Successful response 
    remote isolated function listJobs(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? includeSystemManaged = (), string? onBehalfOfContentOwner = (), int? pageSize = (), string? pageToken = ()) returns ListJobsResponse|error {
        string resourcePath = string `/v1/jobs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "includeSystemManaged": includeSystemManaged, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListJobsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a job and returns it.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + return - Successful response 
    remote isolated function createJob(Job payload, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Job|error {
        string resourcePath = string `/v1/jobs`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        Job response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Gets a job.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + jobId - The ID of the job to retrieve. 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + return - Successful response 
    remote isolated function getJob(string jobId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Job|error {
        string resourcePath = string `/v1/jobs/${getEncodedUri(jobId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Job response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes a job.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + jobId - The ID of the job to delete. 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + return - Successful response 
    remote isolated function deleteJob(string jobId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns http:Response|error {
        string resourcePath = string `/v1/jobs/${getEncodedUri(jobId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Lists reports created by a specific job. Returns NOT_FOUND if the job does not exist.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + jobId - The ID of the job. 
    # + createdAfter - If set, only reports created after the specified date/time are returned. 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + pageSize - Requested page size. Server may return fewer report types than requested. If unspecified, server will pick an appropriate default. 
    # + pageToken - A token identifying a page of results the server should return. Typically, this is the value of ListReportsResponse.next_page_token returned in response to the previous call to the `ListReports` method. 
    # + startTimeAtOrAfter - If set, only reports whose start time is greater than or equal the specified date/time are returned. 
    # + startTimeBefore - If set, only reports whose start time is smaller than the specified date/time are returned. 
    # + return - Successful response 
    remote isolated function listJobReports(string jobId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? createdAfter = (), string? onBehalfOfContentOwner = (), int? pageSize = (), string? pageToken = (), string? startTimeAtOrAfter = (), string? startTimeBefore = ()) returns ListReportsResponse|error {
        string resourcePath = string `/v1/jobs/${getEncodedUri(jobId)}/reports`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "createdAfter": createdAfter, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageSize": pageSize, "pageToken": pageToken, "startTimeAtOrAfter": startTimeAtOrAfter, "startTimeBefore": startTimeBefore};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListReportsResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Gets the metadata of a specific report.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + jobId - The ID of the job. 
    # + reportId - The ID of the report to retrieve. 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + return - Successful response 
    remote isolated function getJobReports(string jobId, string reportId, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), string? onBehalfOfContentOwner = ()) returns Report|error {
        string resourcePath = string `/v1/jobs/${getEncodedUri(jobId)}/reports/${getEncodedUri(reportId)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "onBehalfOfContentOwner": onBehalfOfContentOwner};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        Report response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Method for media download. Download is supported on the URI `/v1/media/{+name}?alt=media`.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + resourceName - Name of the media that is being downloaded. 
    # + return - Successful response 
    remote isolated function downloadMedia(string resourceName, string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = ()) returns GdataMedia|error {
        string resourcePath = string `/v1/media/${getEncodedUri(resourceName)}`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        GdataMedia response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Lists report types.
    #
    # + xgafv - V1 error format. 
    # + alt - Data format for response. 
    # + callback - JSONP 
    # + fields - Selector specifying which fields to include in a partial response. 
    # + quotaUser - Available to use for quota purposes for server-side applications. Can be any arbitrary string assigned to a user, but should not exceed 40 characters. 
    # + uploadProtocol - Upload protocol for media (e.g. "raw", "multipart"). 
    # + uploadType - Legacy upload protocol for media (e.g. "media", "multipart"). 
    # + includeSystemManaged - If set to true, also system-managed report types will be returned; otherwise only the report types that can be used to create new reporting jobs will be returned. 
    # + onBehalfOfContentOwner - The content owner's external ID on which behalf the user is acting on. If not set, the user is acting for himself (his own channel). 
    # + pageSize - Requested page size. Server may return fewer report types than requested. If unspecified, server will pick an appropriate default. 
    # + pageToken - A token identifying a page of results the server should return. Typically, this is the value of ListReportTypesResponse.next_page_token returned in response to the previous call to the `ListReportTypes` method. 
    # + return - Successful response 
    remote isolated function listReportTypes(string? xgafv = (), string? alt = (), string? callback = (), string? fields = (), string? quotaUser = (), string? uploadProtocol = (), string? uploadType = (), boolean? includeSystemManaged = (), string? onBehalfOfContentOwner = (), int? pageSize = (), string? pageToken = ()) returns ListReportTypesResponse|error {
        string resourcePath = string `/v1/reportTypes`;
        map<anydata> queryParam = {"$.xgafv": xgafv, "alt": alt, "callback": callback, "fields": fields, "quotaUser": quotaUser, "upload_protocol": uploadProtocol, "uploadType": uploadType, "includeSystemManaged": includeSystemManaged, "onBehalfOfContentOwner": onBehalfOfContentOwner, "pageSize": pageSize, "pageToken": pageToken};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        ListReportTypesResponse response = check self.clientEp->get(resourcePath);
        return response;
    }
}
