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

# This is a generated connector for [WorkDay payroll REST API v2](https://community.workday.com/sites/default/files/file-hosting/restapi/index.html) OpenAPI specification.
# The Payroll service enables you to access and manage payroll information,such as pay groups, payroll inputs, and tax rates.
@display {label: "Workday Payroll", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.  Follow [this guide] https://credentials.workday.com/docs/authentication/ and obtain tokens.
    #
    # + config - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ConnectionConfig config, string serviceUrl) returns error? {
        http:ClientConfiguration httpClientConfig = {auth: config.auth, httpVersion: config.httpVersion, timeout: config.timeout, forwarded: config.forwarded, poolConfig: config.poolConfig, compression: config.compression, circuitBreaker: config.circuitBreaker, retryConfig: config.retryConfig, validation: config.validation};
        do {
            if config.http1Settings is ClientHttp1Settings {
                ClientHttp1Settings settings = check config.http1Settings.ensureType(ClientHttp1Settings);
                httpClientConfig.http1Settings = {...settings};
            }
            if config.http2Settings is http:ClientHttp2Settings {
                httpClientConfig.http2Settings = check config.http2Settings.ensureType(http:ClientHttp2Settings);
            }
            if config.cache is http:CacheConfig {
                httpClientConfig.cache = check config.cache.ensureType(http:CacheConfig);
            }
            if config.responseLimits is http:ResponseLimitConfigs {
                httpClientConfig.responseLimits = check config.responseLimits.ensureType(http:ResponseLimitConfigs);
            }
            if config.secureSocket is http:ClientSecureSocket {
                httpClientConfig.secureSocket = check config.secureSocket.ensureType(http:ClientSecureSocket);
            }
            if config.proxy is http:ProxyConfig {
                httpClientConfig.proxy = check config.proxy.ensureType(http:ProxyConfig);
            }
        }
        http:Client httpEp = check new (serviceUrl, httpClientConfig);
        self.clientEp = httpEp;
        return;
    }
    # Retrieves a single pay group instance.
    #
    # + id - The Workday ID of the resource. 
    # + subresourceID - The Workday ID of the subresource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPayGroupBySubResourceID(string id, string subresourceID) returns PayGroupViewDetail|error {
        string resourcePath = string `/jobs/${getEncodedUri(id)}/payGroup/${getEncodedUri(subresourceID)}`;
        PayGroupViewDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single pay group instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPayGroupByID(string id) returns PayGroupViewDetail|error {
        string resourcePath = string `/payGroups/${getEncodedUri(id)}`;
        PayGroupViewDetail response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves the pay group for a specified job ID. This method always returns 1 pay group.
    #
    # + id - The Workday ID of the resource. 
    # + effective - The effective date of the pay group, using the date format yyyy-mm-dd. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPayGroupByJobID(string id, string? effective = (), int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/jobs/${getEncodedUri(id)}/payGroup`;
        map<anydata> queryParam = {"effective": effective, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getInstanceForEndpointParameters() returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/taxRatesGroup/companyInstances/`;
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + payComponent - The pay component for the worktags. You can use a returned id from GET/values/payrollInputsGroup/payComponents. 
    # + 'worker - The Workday ID of the worker. You can use a returned id from GET /workers in the Staffing service. 
    # + startDate - The start date for the positions, using the date format yyyy-mm-dd. 
    # + endDate - The end date for the positions, using the date format yyyy-mm-dd. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getWorkTagInstancesForEndpointParameters(string? payComponent = (), string? 'worker = (), string? startDate = (), string? endDate = ()) returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/payrollInputsGroup/worktags/`;
        map<anydata> queryParam = {"payComponent": payComponent, "worker": 'worker, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single pay group detail instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPayGroupDetailsByID(string id) returns PayGroupDetailView|error {
        string resourcePath = string `/payGroupDetails/${getEncodedUri(id)}`;
        PayGroupDetailView response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of jobs.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfJobs(int? 'limit = (), int? offset = ()) returns InlineResponse2001|error {
        string resourcePath = string `/jobs`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2001 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + payComponent - The pay component for the worktags. You can use a returned id from GET/values/payrollInputsGroup/payComponents. 
    # + 'worker - The Workday ID of the worker. You can use a returned id from GET /workers in the Staffing service. 
    # + startDate - The start date for the positions, using the date format yyyy-mm-dd. 
    # + endDate - The end date for the positions, using the date format yyyy-mm-dd. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getRunCategoriesForEndpointParameters(string? payComponent = (), string? 'worker = (), string? startDate = (), string? endDate = ()) returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/payrollInputsGroup/runCategories/`;
        map<anydata> queryParam = {"payComponent": payComponent, "worker": 'worker, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of pay group details.
    #
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + runCategories - One or more Workday IDs of run categories for the pay group. You can use returned ids from GET /values/payrollInputsGroup/runCategories.You can specify 1 or more runCategories query parameters, example: runCategories=category1&runCategories=category2 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfPayGroupDetails(int? 'limit = (), int? offset = (), string[]? runCategories = ()) returns InlineResponse2002|error {
        string resourcePath = string `/payGroupDetails`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset, "runCategories": runCategories};
        map<Encoding> queryParamEncoding = {"runCategories": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2002 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single job instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getSingleJobByID(string id) returns JobData|error {
        string resourcePath = string `/jobs/${getEncodedUri(id)}`;
        JobData response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + payComponent - The pay component for the worktags. You can use a returned id from GET/values/payrollInputsGroup/payComponents. 
    # + 'worker - The Workday ID of the worker. You can use a returned id from GET /workers in the Staffing service. 
    # + startDate - The start date for the positions, using the date format yyyy-mm-dd. 
    # + endDate - The end date for the positions, using the date format yyyy-mm-dd. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPositionInstancesForOtherEndpoints(string? payComponent = (), string? 'worker = (), string? startDate = (), string? endDate = ()) returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/payrollInputsGroup/positions/`;
        map<anydata> queryParam = {"payComponent": payComponent, "worker": 'worker, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single payroll input instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPayRollInputInstance(string id) returns PayrollInputView|error {
        string resourcePath = string `/payrollInputs/${getEncodedUri(id)}`;
        PayrollInputView response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Deletes an existing payroll input instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Deleting resource. 
    remote isolated function deleteExistingPayroll(string id) returns http:Response|error {
        string resourcePath = string `/payrollInputs/${getEncodedUri(id)}`;
        http:Response response = check self.clientEp-> delete(resourcePath);
        return response;
    }
    # Partially updates an existing payroll input instance.
    #
    # + id - The Workday ID of the resource. 
    # + return - Successful response. A successful response can return no matched data. Updating resource. 
    remote isolated function updateAnExistingPayroll(string id, PayrollInputView payload) returns PayrollInputView|error {
        string resourcePath = string `/payrollInputs/${getEncodedUri(id)}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PayrollInputView response = check self.clientEp->patch(resourcePath, request);
        return response;
    }
    # Retrieves a collection of payroll inputs. At least 1 query parameter is required to get data.
    #
    # + endDate - The end date filter which returns payroll inputs that are active on or before the end date, using the date format yyyy-mm-dd. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + payComponent - The Workday ID of the pay component for the payroll input. You can use a returned id from GET /values/payrollInputsGroup/payComponents. 
    # + startDate - The start date filter which returns payroll inputs that are active on or after the start date, using the date format yyyy-mm-dd. 
    # + 'worker - The Workday ID of worker for the payroll input. You can use a returned id from GET /workers in the Staffing service. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfPayroll(string? endDate = (), int? 'limit = (), int? offset = (), string[]? payComponent = (), string? startDate = (), string[]? 'worker = ()) returns InlineResponse2003|error {
        string resourcePath = string `/payrollInputs`;
        map<anydata> queryParam = {"endDate": endDate, "limit": 'limit, "offset": offset, "payComponent": payComponent, "startDate": startDate, "worker": 'worker};
        map<Encoding> queryParamEncoding = {"payComponent": {style: FORM, explode: true}, "worker": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        InlineResponse2003 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates payroll inputs.
    #
    # + endDate - The end date filter which returns payroll inputs that are active on or before the end date, using the date format yyyy-mm-dd. 
    # + payComponent - The Workday ID of the pay component for the payroll input. You can use a returned id from GET /values/payrollInputsGroup/payComponents. 
    # + startDate - The start date filter which returns payroll inputs that are active on or after the start date, using the date format yyyy-mm-dd. 
    # + 'worker - The Workday ID of worker for the payroll input. You can use a returned id from GET /workers in the Staffing service. 
    # + return - Resource created. 
    remote isolated function createPayrollInputs(PayrollInputView payload, string? endDate = (), string[]? payComponent = (), string? startDate = (), string[]? 'worker = ()) returns PayrollInputView|error {
        string resourcePath = string `/payrollInputs`;
        map<anydata> queryParam = {"endDate": endDate, "payComponent": payComponent, "startDate": startDate, "worker": 'worker};
        map<Encoding> queryParamEncoding = {"payComponent": {style: FORM, explode: true}, "worker": {style: FORM, explode: true}};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam, queryParamEncoding);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        PayrollInputView response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getStateInstancesForEndpointParameters() returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/taxRatesGroup/stateInstances/`;
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a single or a collection of company SUI rates.
    #
    # + company - The company reference ID or WID that represents 1 or more companies. Example: company=comp1&company=comp2&company=cb550da820584750aae8f807882fa79a 
    # + effective - The effective date for the SUI rate, using the yyyy-mm-dd format. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + payrollStateAuthorityTaxCode - The FIPS code or WID that represents 1 or more states. Example: payrollStateAuthorityTaxCode=06&payrollStateAuthorityTaxCode=3b3d378d5f4a48b8b3ac46fee0703226&payrollStateAuthorityTaxCode=48 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCompanySUIRates(string? company = (), string? effective = (), int? 'limit = (), int? offset = (), string? payrollStateAuthorityTaxCode = ()) returns InlineResponse2004|error {
        string resourcePath = string `/taxRates`;
        map<anydata> queryParam = {"company": company, "effective": effective, "limit": 'limit, "offset": offset, "payrollStateAuthorityTaxCode": payrollStateAuthorityTaxCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse2004 response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Creates a single or a collection of Company SUI Rates.
    #
    # + company - The company reference ID or WID that represents 1 or more companies. Example: company=comp1&company=comp2&company=cb550da820584750aae8f807882fa79a 
    # + effective - The effective date for the SUI rate, using the yyyy-mm-dd format. 
    # + payrollStateAuthorityTaxCode - The FIPS code or WID that represents 1 or more states. Example: payrollStateAuthorityTaxCode=06&payrollStateAuthorityTaxCode=3b3d378d5f4a48b8b3ac46fee0703226&payrollStateAuthorityTaxCode=48 
    # + return - Resource created. 
    remote isolated function createCompanySUIRates(CompanySuiRateDetails payload, string? company = (), string? effective = (), string? payrollStateAuthorityTaxCode = ()) returns CompanySuiRateDetails|error {
        string resourcePath = string `/taxRates`;
        map<anydata> queryParam = {"company": company, "effective": effective, "payrollStateAuthorityTaxCode": payrollStateAuthorityTaxCode};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody, "application/json");
        CompanySuiRateDetails response = check self.clientEp->post(resourcePath, request);
        return response;
    }
    # Retrieves instances that can be used as values for other endpoint parameters in this service.
    #
    # + payComponent - The pay component for the worktags. You can use a returned id from GET/values/payrollInputsGroup/payComponents. 
    # + 'worker - The Workday ID of the worker. You can use a returned id from GET /workers in the Staffing service. 
    # + startDate - The start date for the positions, using the date format yyyy-mm-dd. 
    # + endDate - The end date for the positions, using the date format yyyy-mm-dd. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getPayComponentsForEndpoints(string? payComponent = (), string? 'worker = (), string? startDate = (), string? endDate = ()) returns MultipleInstanceModelReference|error {
        string resourcePath = string `/values/payrollInputsGroup/payComponents/`;
        map<anydata> queryParam = {"payComponent": payComponent, "worker": 'worker, "startDate": startDate, "endDate": endDate};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        MultipleInstanceModelReference response = check self.clientEp->get(resourcePath);
        return response;
    }
    # Retrieves a collection of pay groups.
    #
    # + country - The Workday ID of the country or territory of the pay group. You can use a returned country id from any of the payGroups endpoints in this Payroll API. 
    # + 'limit - The maximum number of objects in a single response. The default is 20. The maximum is 100. 
    # + offset - The zero-based index of the first object in a response collection. The default is 0. Use offset with the limit parameter to control paging of a response collection. Example: If limit is 5 and offset is 9, the response returns a collection of 5 objects starting with the 10th object. 
    # + return - Successful response. A successful response can return no matched data. 
    remote isolated function getCollectionOfPayGroups(string? country = (), int? 'limit = (), int? offset = ()) returns InlineResponse200|error {
        string resourcePath = string `/payGroups`;
        map<anydata> queryParam = {"country": country, "limit": 'limit, "offset": offset};
        resourcePath = resourcePath + check getPathForQueryParam(queryParam);
        InlineResponse200 response = check self.clientEp->get(resourcePath);
        return response;
    }
}
