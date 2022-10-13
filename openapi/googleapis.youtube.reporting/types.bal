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

# Response message for ReportingService.ListReports.
public type ListReportsResponse record {
    # A token to retrieve next page of results. Pass this value in the ListReportsRequest.page_token field in the subsequent call to `ListReports` method to retrieve the next page of results.
    string nextPageToken?;
    # The list of report types.
    Report[] reports?;
};

# gdata
public type GdataDiffUploadRequest record {
    # gdata
    GdataCompositeMedia checksumsInfo?;
    # gdata
    GdataCompositeMedia objectInfo?;
    # gdata
    string objectVersion?;
};

# gdata
public type GdataMedia record {
    # gdata
    string algorithm?;
    # gdata
    string bigstoreObjectRef?;
    # gdata
    string blobRef?;
    # gdata
    GdataBlobstore2Info blobstore2Info?;
    # gdata
    GdataCompositeMedia[] compositeMedia?;
    # gdata
    string contentType?;
    # gdata
    GdataContentTypeInfo contentTypeInfo?;
    # gdata
    string cosmoBinaryReference?;
    # gdata
    int crc32cHash?;
    # gdata
    GdataDiffChecksumsResponse diffChecksumsResponse?;
    # gdata
    GdataDiffDownloadResponse diffDownloadResponse?;
    # gdata
    GdataDiffUploadRequest diffUploadRequest?;
    # gdata
    GdataDiffUploadResponse diffUploadResponse?;
    # gdata
    GdataDiffVersionResponse diffVersionResponse?;
    # gdata
    GdataDownloadParameters downloadParameters?;
    # gdata
    string filename?;
    # gdata
    string hash?;
    # gdata
    boolean hashVerified?;
    # gdata
    string inline?;
    # gdata
    boolean isPotentialRetry?;
    # gdata
    string length?;
    # gdata
    string md5Hash?;
    # gdata
    string mediaId?;
    # gdata
    GdataObjectId objectId?;
    # gdata
    string path?;
    # gdata
    string referenceType?;
    # gdata
    string sha1Hash?;
    # gdata
    string sha256Hash?;
    # gdata
    string timestamp?;
    # gdata
    string token?;
};

# gdata
public type GdataCompositeMedia record {
    # gdata
    string blobRef?;
    # gdata
    GdataBlobstore2Info blobstore2Info?;
    # gdata
    string cosmoBinaryReference?;
    # gdata
    int crc32cHash?;
    # gdata
    string inline?;
    # gdata
    string length?;
    # gdata
    string md5Hash?;
    # gdata
    GdataObjectId objectId?;
    # gdata
    string path?;
    # gdata
    string referenceType?;
    # gdata
    string sha1Hash?;
};

# A report's metadata including the URL from which the report itself can be downloaded.
public type Report record {
    # The date/time when this report was created.
    string createTime?;
    # The URL from which the report can be downloaded (max. 1000 characters).
    string downloadUrl?;
    # The end of the time period that the report instance covers. The value is exclusive.
    string endTime?;
    # The server-generated ID of the report.
    string id?;
    # The date/time when the job this report belongs to will expire/expired.
    string jobExpireTime?;
    # The ID of the job that created this report.
    string jobId?;
    # The start of the time period that the report instance covers. The value is inclusive.
    string startTime?;
};

# gdata
public type GdataDiffChecksumsResponse record {
    # gdata
    GdataCompositeMedia checksumsLocation?;
    # gdata
    string chunkSizeBytes?;
    # gdata
    GdataCompositeMedia objectLocation?;
    # gdata
    string objectSizeBytes?;
    # gdata
    string objectVersion?;
};

# gdata
public type GdataDownloadParameters record {
    # gdata
    boolean allowGzipCompression?;
    # gdata
    boolean ignoreRange?;
};

# gdata
public type GdataBlobstore2Info record {
    # gdata
    string blobGeneration?;
    # gdata
    string blobId?;
    # gdata
    string downloadReadHandle?;
    # gdata
    string readToken?;
    # gdata
    string uploadMetadataContainer?;
};

# Response message for ReportingService.ListJobs.
public type ListJobsResponse record {
    # The list of jobs.
    Job[] jobs?;
    # A token to retrieve next page of results. Pass this value in the ListJobsRequest.page_token field in the subsequent call to `ListJobs` method to retrieve the next page of results.
    string nextPageToken?;
};

# gdata
public type GdataDiffDownloadResponse record {
    # gdata
    GdataCompositeMedia objectLocation?;
};

# gdata
public type GdataContentTypeInfo record {
    # gdata
    string bestGuess?;
    # gdata
    string fromBytes?;
    # gdata
    string fromFileName?;
    # gdata
    string fromHeader?;
    # gdata
    string fromUrlPath?;
};

# gdata
public type GdataDiffVersionResponse record {
    # gdata
    string objectSizeBytes?;
    # gdata
    string objectVersion?;
};

# gdata
public type GdataDiffUploadResponse record {
    # gdata
    string objectVersion?;
    # gdata
    GdataCompositeMedia originalObject?;
};

# Response message for ReportingService.ListReportTypes.
public type ListReportTypesResponse record {
    # A token to retrieve next page of results. Pass this value in the ListReportTypesRequest.page_token field in the subsequent call to `ListReportTypes` method to retrieve the next page of results.
    string nextPageToken?;
    # The list of report types.
    ReportType[] reportTypes?;
};

# gdata
public type GdataObjectId record {
    # gdata
    string bucketName?;
    # gdata
    string generation?;
    # gdata
    string objectName?;
};

# A job creating reports of a specific type.
public type Job record {
    # The creation date/time of the job.
    string createTime?;
    # The date/time when this job will expire/expired. After a job expired, no new reports are generated.
    string expireTime?;
    # The server-generated ID of the job (max. 40 characters).
    string id?;
    # The name of the job (max. 100 characters).
    string name?;
    # The type of reports this job creates. Corresponds to the ID of a ReportType.
    string reportTypeId?;
    # True if this a system-managed job that cannot be modified by the user; otherwise false.
    boolean systemManaged?;
};

# A report type.
public type ReportType record {
    # The date/time when this report type was/will be deprecated.
    string deprecateTime?;
    # The ID of the report type (max. 100 characters).
    string id?;
    # The name of the report type (max. 100 characters).
    string name?;
    # True if this a system-managed report type; otherwise false. Reporting jobs for system-managed report types are created automatically and can thus not be used in the `CreateJob` method.
    boolean systemManaged?;
};
