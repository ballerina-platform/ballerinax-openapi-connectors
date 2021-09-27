// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
    http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Figshare API v2.0.0](https://docs.figshare.com/) OpenAPI specification.
# Figshare is a repository where users can make all of their research outputs available in a citable, shareable and discoverable manner.
@display {label: "Figshare", iconPath: "resources/figshare.svg"} 
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials.
    # Create a [Figshare account](https://figshare.com/account/register) and obtain tokens by following [this guide](https://figshare.com/account/applications). 
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.figshare.com/v2") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Private Account information
    #
    # + return - OK. Account representation 
    remote isolated function getPrivateAccount() returns Account|error {
        string  path = string `/account`;
        Account response = check self.clientEp-> get(path, targetType = Account);
        return response;
    }
    # Private Articles
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - OK. An array of articles belonging to the account 
    remote isolated function listPrivateArticles(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = ()) returns Article[]|error {
        string  path = string `/account/articles`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Create new Article
    #
    # + payload - Article description 
    # + return - Created 
    remote isolated function createPrivateArticle(ArticleCreate payload) returns Location|error {
        string  path = string `/account/articles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Account Article Report
    #
    # + groupId - A group ID to filter by 
    # + return - OK. An array of account report entries 
    remote isolated function listAccountArticleReports(int? groupId = ()) returns AccountReport[]|error {
        string  path = string `/account/articles/export`;
        map<anydata> queryParam = {"group_id": groupId};
        path = path + check getPathForQueryParam(queryParam);
        AccountReport[] response = check self.clientEp-> get(path, targetType = AccountReportArr);
        return response;
    }
    # Initiate a new Report
    #
    # + return - OK. AccountReport created. 
    remote isolated function generateAccountArticleReport() returns AccountReport|error {
        string  path = string `/account/articles/export`;
        http:Request request = new;
        //TODO: Update the request as needed;
        AccountReport response = check self.clientEp-> post(path, request, targetType = AccountReport);
        return response;
    }
    # Private Articles search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of articles 
    remote isolated function searchPrivateArticles(PrivateArticleSearch payload) returns Article[]|error {
        string  path = string `/account/articles/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Article[] response = check self.clientEp->post(path, request, targetType=ArticleArr);
        return response;
    }
    # Article details
    #
    # + articleId - Article unique identifier 
    # + return - OK. Article representation 
    remote isolated function getPrivateArticleDetails(int articleId) returns ArticleCompletePrivate|error {
        string  path = string `/account/articles/${articleId}`;
        ArticleCompletePrivate response = check self.clientEp-> get(path, targetType = ArticleCompletePrivate);
        return response;
    }
    # Update article
    #
    # + articleId - Article unique identifier 
    # + payload - Article description 
    # + return - Reset Content 
    remote isolated function updatePrivateArticle(int articleId, ArticleUpdate payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete article
    #
    # + articleId - Article unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateArticle(int articleId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List article authors
    #
    # + articleId - Article unique identifier 
    # + return - OK. Authors list for article 
    remote isolated function listPrivateArticleAuthors(int articleId) returns Author[]|error {
        string  path = string `/account/articles/${articleId}/authors`;
        Author[] response = check self.clientEp-> get(path, targetType = AuthorArr);
        return response;
    }
    # Replace article authors
    #
    # + articleId - Article unique identifier 
    # + payload - Authors description 
    # + return - Reset Content 
    remote isolated function replacePrivateArticleAuthors(int articleId, AuthorsCreator payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/authors`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Add article authors
    #
    # + articleId - Article unique identifier 
    # + payload - Authors description 
    # + return - Reset Content 
    remote isolated function addPrivateArticleAuthors(int articleId, AuthorsCreator payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/authors`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Delete article author
    #
    # + articleId - Article unique identifier 
    # + authorId - Article Author unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateArticleAuthor(int articleId, int authorId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/authors/${authorId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List article categories
    #
    # + articleId - Article unique identifier 
    # + return - OK. Article categories 
    remote isolated function listPrivateArticleCategories(int articleId) returns Category[]|error {
        string  path = string `/account/articles/${articleId}/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Replace article categories
    #
    # + articleId - Article unique identifier 
    # + payload - A record of type `CategoriesCreator` which contains the necessary data to create or update article category 
    # + return - Reset Content 
    remote isolated function replacePrivateArticleCategories(int articleId, CategoriesCreator payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Add article categories
    #
    # + articleId - Article unique identifier 
    # + payload - A record of type `CategoriesCreator` which contains the necessary data to create or update article category 
    # + return - Reset Content 
    remote isolated function addPrivateArticleCategories(int articleId, CategoriesCreator payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Delete article category
    #
    # + articleId - Article unique identifier 
    # + categoryId - Category unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateArticleCategory(int articleId, int categoryId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/categories/${categoryId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Article confidentiality details
    #
    # + articleId - Article unique identifier 
    # + return - OK. Article categories 
    remote isolated function getPrivateArticleConfidentialityDetails(int articleId) returns ArticleConfidentiality|error {
        string  path = string `/account/articles/${articleId}/confidentiality`;
        ArticleConfidentiality response = check self.clientEp-> get(path, targetType = ArticleConfidentiality);
        return response;
    }
    # Update article confidentiality
    #
    # + articleId - Article unique identifier 
    # + payload - A record of type `ConfidentialityCreator` which contains the necessary data to update confidentiality settings 
    # + return - Reset Content 
    remote isolated function updatePrivateArticleConfidentiality(int articleId, ConfidentialityCreator payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/confidentiality`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete article confidentiality
    #
    # + articleId - Article unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateArticleConfidentiality(int articleId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/confidentiality`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Article Embargo Details
    #
    # + articleId - Article unique identifier 
    # + return - OK. Embargo for article 
    remote isolated function getPrivateArticleEmbargoDetails(int articleId) returns ArticleEmbargo|error {
        string  path = string `/account/articles/${articleId}/embargo`;
        ArticleEmbargo response = check self.clientEp-> get(path, targetType = ArticleEmbargo);
        return response;
    }
    # Update Article Embargo
    #
    # + articleId - Article unique identifier 
    # + payload - Embargo description 
    # + return - Reset Content 
    remote isolated function updatePrivateArticleEmbargo(int articleId, ArticleEmbargoUpdater payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/embargo`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete Article Embargo
    #
    # + articleId - Article unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateArticleEmbargo(int articleId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/embargo`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List article files
    #
    # + articleId - Article unique identifier 
    # + return - OK. Article files list 
    remote isolated function listPrivateArticleFiles(int articleId) returns PrivateFile[]|error {
        string  path = string `/account/articles/${articleId}/files`;
        PrivateFile[] response = check self.clientEp-> get(path, targetType = PrivateFileArr);
        return response;
    }
    # Initiate Upload
    #
    # + articleId - Article unique identifier 
    # + payload - A record of type `FileCreator` which contains the necessary data to initiate a new file upload within the article 
    # + return - Created 
    remote isolated function initiatePrivateArticleUpload(int articleId, FileCreator payload) returns Location|error {
        string  path = string `/account/articles/${articleId}/files`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Single File
    #
    # + articleId - Article unique identifier 
    # + fileId - File unique identifier 
    # + return - OK. Article private file 
    remote isolated function getPrivateArticleFile(int articleId, int fileId) returns PrivateFile|error {
        string  path = string `/account/articles/${articleId}/files/${fileId}`;
        PrivateFile response = check self.clientEp-> get(path, targetType = PrivateFile);
        return response;
    }
    # Complete Upload
    #
    # + articleId - Article unique identifier 
    # + fileId - File unique identifier 
    # + return - Accepted 
    remote isolated function completePrivateArticleUpload(int articleId, int fileId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/files/${fileId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # File Delete
    #
    # + articleId - Article unique identifier 
    # + fileId - File unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateArticleFile(int articleId, int fileId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/files/${fileId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List private links
    #
    # + articleId - Article unique identifier 
    # + return - OK. Article private links 
    remote isolated function getPrivateArticlePrivateLink(int articleId) returns PrivateLink[]|error {
        string  path = string `/account/articles/${articleId}/private_links`;
        PrivateLink[] response = check self.clientEp-> get(path, targetType = PrivateLinkArr);
        return response;
    }
    # Create private link
    #
    # + articleId - Article unique identifier 
    # + payload - A record of type `FileCreator` which contains the necessary data to create or update private link 
    # + return - Created 
    remote isolated function createPrivateArticlePrivateLink(int articleId, PrivateLinkCreator payload) returns Location|error {
        string  path = string `/account/articles/${articleId}/private_links`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Update private link
    #
    # + articleId - Article unique identifier 
    # + linkId - Private link token 
    # + payload - A record of type `FileCreator` which contains the necessary data to create or update private link 
    # + return - Reset Content 
    remote isolated function updatePrivateArticlePrivateLink(int articleId, string linkId, PrivateLinkCreator payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/private_links/${linkId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Disable private link
    #
    # + articleId - Article unique identifier 
    # + linkId - Private link token 
    # + return - No Content 
    remote isolated function deletePrivateArticlePrivateLink(int articleId, string linkId) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/private_links/${linkId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Private Article Publish
    #
    # + articleId - Article unique identifier 
    # + return - Created 
    remote isolated function publishPrivateArticle(int articleId) returns Location|error {
        string  path = string `/account/articles/${articleId}/publish`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Location response = check self.clientEp-> post(path, request, targetType = Location);
        return response;
    }
    # Private Article Reserve DOI
    #
    # + articleId - Article unique identifier 
    # + return - OK 
    remote isolated function reserveDoiPrivateArticle(int articleId) returns ArticleDOI|error {
        string  path = string `/account/articles/${articleId}/reserve_doi`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ArticleDOI response = check self.clientEp-> post(path, request, targetType = ArticleDOI);
        return response;
    }
    # Private Article Reserve Handle
    #
    # + articleId - Article unique identifier 
    # + return - OK 
    remote isolated function reservePrivateArticleHandle(int articleId) returns ArticleHandle|error {
        string  path = string `/account/articles/${articleId}/reserve_handle`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ArticleHandle response = check self.clientEp-> post(path, request, targetType = ArticleHandle);
        return response;
    }
    # Article Version Update Thumb
    #
    # + articleId - Article unique identifier 
    # + versionId - Article version identifier 
    # + payload - File ID 
    # + return - Reset Content 
    remote isolated function updateArticleThumbVersion(int articleId, int versionId, FileId payload) returns http:Response|error {
        string  path = string `/account/articles/${articleId}/versions/${versionId}/update_thumb`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Search Authors
    #
    # + payload - Search Parameters 
    # + return - OK. An array of authors 
    remote isolated function searchPrivateAuthors(PrivateAuthorsSearch payload) returns Author[]|error {
        string  path = string `/account/authors/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Author[] response = check self.clientEp->post(path, request, targetType=AuthorArr);
        return response;
    }
    # Author details
    #
    # + authorId - Author unique identifier 
    # + return - OK. Article representation 
    remote isolated function getPrivateAuthorDetails(int authorId) returns AuthorComplete|error {
        string  path = string `/account/authors/${authorId}`;
        AuthorComplete response = check self.clientEp-> get(path, targetType = AuthorComplete);
        return response;
    }
    # Private Account Categories
    #
    # + return - OK. An array of categories 
    remote isolated function listPrivateCategories() returns Category[]|error {
        string  path = string `/account/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Private Collections List
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + 'order - The field by which to order. Default varies by endpoint/resource. 
    # + orderDirection - Sorting order (desc or asc) 
    # + return - OK. An array of collections 
    remote isolated function listPrivateCollections(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), string 'order = "published_date", string orderDirection = "desc") returns Collection[]|error {
        string  path = string `/account/collections`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "order": 'order, "order_direction": orderDirection};
        path = path + check getPathForQueryParam(queryParam);
        Collection[] response = check self.clientEp-> get(path, targetType = CollectionArr);
        return response;
    }
    # Create collection
    #
    # + payload - Collection description 
    # + return - Created 
    remote isolated function createPrivateCollection(CollectionCreate payload) returns CollectionComplete|error {
        string  path = string `/account/collections`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        CollectionComplete response = check self.clientEp->post(path, request, targetType=CollectionComplete);
        return response;
    }
    # Private Collections Search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of collections 
    remote isolated function searchPrivateCollections(PrivateCollectionSearch payload) returns Collection[]|error {
        string  path = string `/account/collections/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Collection[] response = check self.clientEp->post(path, request, targetType=CollectionArr);
        return response;
    }
    # Collection details
    #
    # + collectionId - Collection Unique identifier 
    # + return - OK. Collection representation 
    remote isolated function getPrivateCollectionDetails(int collectionId) returns CollectionComplete|error {
        string  path = string `/account/collections/${collectionId}`;
        CollectionComplete response = check self.clientEp-> get(path, targetType = CollectionComplete);
        return response;
    }
    # Update collection
    #
    # + collectionId - Collection Unique identifier 
    # + payload - Collection description 
    # + return - Reset Content 
    remote isolated function updatePrivateCollection(int collectionId, CollectionUpdate payload) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete collection
    #
    # + collectionId - Collection Unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateCollection(int collectionId) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List collection articles
    #
    # + collectionId - Collection unique identifier 
    # + return - OK. Articles List 
    remote isolated function listPrivateCollectionArticles(int collectionId) returns Article[]|error {
        string  path = string `/account/collections/${collectionId}/articles`;
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Replace collection articles
    #
    # + collectionId - Collection unique identifier 
    # + payload - Articles List 
    # + return - Reset Content 
    remote isolated function replacePrivateCollectionArticles(int collectionId, ArticlesCreator payload) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/articles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Add collection articles
    #
    # + collectionId - Collection unique identifier 
    # + payload - Articles list 
    # + return - Reset Content 
    remote isolated function addPrivateCollectionArticles(int collectionId, ArticlesCreator payload) returns Location|error {
        string  path = string `/account/collections/${collectionId}/articles`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Delete collection article
    #
    # + collectionId - Collection unique identifier 
    # + articleId - Collection article unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateCollectionArticle(int collectionId, int articleId) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/articles/${articleId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List collection authors
    #
    # + collectionId - Collection unique identifier 
    # + return - OK. Embargo for article 
    remote isolated function listPrivateCollectionAuthors(int collectionId) returns Author[]|error {
        string  path = string `/account/collections/${collectionId}/authors`;
        Author[] response = check self.clientEp-> get(path, targetType = AuthorArr);
        return response;
    }
    # Replace collection authors
    #
    # + collectionId - Collection unique identifier 
    # + payload - List of authors 
    # + return - Reset Content 
    remote isolated function replacePrivateCollectionAuthors(int collectionId, AuthorsCreator payload) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/authors`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Add collection authors
    #
    # + collectionId - Collection unique identifier 
    # + payload - List of authors 
    # + return - Reset Content 
    remote isolated function addPrivateCollectionAuthors(int collectionId, AuthorsCreator payload) returns Location|error {
        string  path = string `/account/collections/${collectionId}/authors`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Delete collection author
    #
    # + collectionId - Collection unique identifier 
    # + authorId - Collection Author unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateCollectionAuthor(int collectionId, int authorId) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/authors/${authorId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List collection categories
    #
    # + collectionId - Collection unique identifier 
    # + return - OK. Categories list 
    remote isolated function listPrivateCollectionCategories(int collectionId) returns Category[]|error {
        string  path = string `/account/collections/${collectionId}/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Replace collection categories
    #
    # + collectionId - Collection unique identifier 
    # + payload - Categories list 
    # + return - Reset Content 
    remote isolated function replacePrivateCollectionCategories(int collectionId, CategoriesCreator payload) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Add collection categories
    #
    # + collectionId - Collection unique identifier 
    # + payload - Categories list 
    # + return - Reset Content 
    remote isolated function addPrivateCollectionCategories(int collectionId, CategoriesCreator payload) returns Location|error {
        string  path = string `/account/collections/${collectionId}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Delete collection category
    #
    # + collectionId - Collection unique identifier 
    # + categoryId - Collection category unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateCollectionCategory(int collectionId, int categoryId) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/categories/${categoryId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List collection private links
    #
    # + collectionId - Collection unique identifier 
    # + return - OK. Collection private links 
    remote isolated function listPrivateCollectionPrivateLinks(int collectionId) returns PrivateLink[]|error {
        string  path = string `/account/collections/${collectionId}/private_links`;
        PrivateLink[] response = check self.clientEp-> get(path, targetType = PrivateLinkArr);
        return response;
    }
    # Create collection private link
    #
    # + collectionId - Collection unique identifier 
    # + payload - A record of type `CollectionPrivateLinkCreator` which contains the necessary data to create or update collection private link 
    # + return - Created 
    remote isolated function createPrivateCollectionPrivateLink(int collectionId, CollectionPrivateLinkCreator payload) returns Location|error {
        string  path = string `/account/collections/${collectionId}/private_links`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Update collection private link
    #
    # + collectionId - Collection unique identifier 
    # + linkId - Private link token 
    # + payload - A record of type `CollectionPrivateLinkCreator` which contains the necessary data to create or update collection private link 
    # + return - Reset Content 
    remote isolated function updatePrivateCollectionPrivateLink(int collectionId, string linkId, CollectionPrivateLinkCreator payload) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/private_links/${linkId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Disable private link
    #
    # + collectionId - Collection unique identifier 
    # + linkId - Private link token 
    # + return - No Content 
    remote isolated function deletePrivateCollectionPrivateLink(int collectionId, string linkId) returns http:Response|error {
        string  path = string `/account/collections/${collectionId}/private_links/${linkId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Private Collection Publish
    #
    # + collectionId - Collection Unique identifier 
    # + return - Created 
    remote isolated function publishPrivateCollection(int collectionId) returns Location|error {
        string  path = string `/account/collections/${collectionId}/publish`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Location response = check self.clientEp-> post(path, request, targetType = Location);
        return response;
    }
    # Private Collection Reserve DOI
    #
    # + collectionId - Collection Unique identifier 
    # + return - OK 
    remote isolated function reserveDoiForPrivateCollection(int collectionId) returns CollectionDOI|error {
        string  path = string `/account/collections/${collectionId}/reserve_doi`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CollectionDOI response = check self.clientEp-> post(path, request, targetType = CollectionDOI);
        return response;
    }
    # Private Collection Reserve Handle
    #
    # + collectionId - Collection Unique identifier 
    # + return - OK 
    remote isolated function getPrivateCollectionReserveHandle(int collectionId) returns CollectionHandle|error {
        string  path = string `/account/collections/${collectionId}/reserve_handle`;
        http:Request request = new;
        //TODO: Update the request as needed;
        CollectionHandle response = check self.clientEp-> post(path, request, targetType = CollectionHandle);
        return response;
    }
    # Search Funding
    #
    # + payload - Search Parameters 
    # + return - OK. An array of funding information 
    remote isolated function searchPrivateFunding(FundingSearch payload) returns FundingInformation[]|error {
        string  path = string `/account/funding/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        FundingInformation[] response = check self.clientEp->post(path, request, targetType=FundingInformationArr);
        return response;
    }
    # Private Account Institutions
    #
    # + return - OK. An array of institutions 
    remote isolated function getPrivateInstitutionDetails() returns Institution|error {
        string  path = string `/account/institution`;
        Institution response = check self.clientEp-> get(path, targetType = Institution);
        return response;
    }
    # Private Account Institution Accounts
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + isActive - Filter by active status 
    # + institutionUserId - Filter by institution_user_id 
    # + email - Filter by email 
    # + return - OK. An array of Accounts 
    remote isolated function listPrivateInstitutionAccounts(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), int? isActive = (), string? institutionUserId = (), string? email = ()) returns ShortAccount[]|error {
        string  path = string `/account/institution/accounts`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "is_active": isActive, "institution_user_id": institutionUserId, "email": email};
        path = path + check getPathForQueryParam(queryParam);
        ShortAccount[] response = check self.clientEp-> get(path, targetType = ShortAccountArr);
        return response;
    }
    # Create new Institution Account
    #
    # + payload - Account description 
    # + return - Created 
    remote isolated function createPrivateInstitutionAccounts(AccountCreate payload) returns http:Response|error {
        string  path = string `/account/institution/accounts`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Private Account Institution Accounts Search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of Accounts 
    remote isolated function searchPrivateInstitutionAccounts(InstitutionAccountsSearch payload) returns ShortAccount[]|error {
        string  path = string `/account/institution/accounts/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ShortAccount[] response = check self.clientEp->post(path, request, targetType=ShortAccountArr);
        return response;
    }
    # Update Institution Account
    #
    # + accountId - Account identifier the user is associated to 
    # + payload - Account description 
    # + return - Reset Content 
    remote isolated function updatePrivateInstitutionAccounts(int accountId, AccountUpdate payload) returns http:Response|error {
        string  path = string `/account/institution/accounts/${accountId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Private Institution Articles
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + 'order - The field by which to order. Default varies by endpoint/resource. 
    # + orderDirection - Sorting order (desc or asc) 
    # + publishedSince - Filter by article publishing date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD 
    # + modifiedSince - Filter by article modified date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD 
    # + status - only return collections with this status 
    # + resourceDoi - only return collections with this resource_doi 
    # + itemType - Only return articles with the respective type. Mapping for item_type is: 1 - Figure, 2 - Media, 3 - Dataset, 5 - Poster, 6 - Journal contribution, 7 - Presentation, 8 - Thesis, 9 - Software, 11 - Online resource, 12 - Preprint, 13 - Book, 14 - Conference contribution, 15 - Chapter, 16 - Peer review, 17 - Educational resource, 18 - Report, 19 - Standard, 20 - Composition, 21 - Funding, 22 - Physical object, 23 - Data management plan, 24 - Workflow, 25 - Monograph, 26 - Performance, 27 - Event, 28 - Service, 29 - Model 
    # + return - OK. An array of articles belonging to the institution 
    remote isolated function getPrivateInstitutionArticles(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), string 'order = "published_date", string orderDirection = "desc", string? publishedSince = (), string? modifiedSince = (), int? status = (), string? resourceDoi = (), int? itemType = ()) returns Article[]|error {
        string  path = string `/account/institution/articles`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "order": 'order, "order_direction": orderDirection, "published_since": publishedSince, "modified_since": modifiedSince, "status": status, "resource_doi": resourceDoi, "item_type": itemType};
        path = path + check getPathForQueryParam(queryParam);
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Private Account Institution embargo options
    #
    # + return - OK. An array of embargo options 
    remote isolated function getPrivateInstitutionEmbargoOptionsDetails() returns GroupEmbargoOptions[]|error {
        string  path = string `/account/institution/embargo_options`;
        GroupEmbargoOptions[] response = check self.clientEp-> get(path, targetType = GroupEmbargoOptionsArr);
        return response;
    }
    # Private Account Institution Groups
    #
    # + return - OK. An array of Groups 
    remote isolated function listPrivateInstitutionGroups() returns Group[]|error {
        string  path = string `/account/institution/groups`;
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Private Account Institution Group Embargo Options
    #
    # + groupId - Group identifier 
    # + return - OK. An array of embargo options 
    remote isolated function getPrivateGroupEmbargoOptionsDetails(int groupId) returns GroupEmbargoOptions[]|error {
        string  path = string `/account/institution/groups/${groupId}/embargo_options`;
        GroupEmbargoOptions[] response = check self.clientEp-> get(path, targetType = GroupEmbargoOptionsArr);
        return response;
    }
    # Institution Curation Review
    #
    # + curationId - ID of the curation 
    # + return - OK. A curation review. 
    remote isolated function getAccountInstitutionCuration(int curationId) returns CurationDetail|error {
        string  path = string `/account/institution/review/${curationId}`;
        CurationDetail response = check self.clientEp-> get(path, targetType = CurationDetail);
        return response;
    }
    # Institution Curation Review Comments
    #
    # + curationId - ID of the curation 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - OK. A curation review's comments. 
    remote isolated function getAccountInstitutionCurationComments(int curationId, int? 'limit = (), int? offset = ()) returns CurationComment|error {
        string  path = string `/account/institution/review/${curationId}/comments`;
        map<anydata> queryParam = {"limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        CurationComment response = check self.clientEp-> get(path, targetType = CurationComment);
        return response;
    }
    # POST Institution Curation Review Comment
    #
    # + curationId - ID of the curation 
    # + payload - The content/value of the comment. 
    # + return - OK. 
    remote isolated function addAccountInstitutionCurationComments(int curationId, CurationCommentCreate payload) returns http:Response|error {
        string  path = string `/account/institution/review/${curationId}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Institution Curation Reviews
    #
    # + groupId - Filter by the group ID 
    # + articleId - Retrieve the reviews for this article 
    # + status - Filter by the status of the review 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - OK. A list of curation reviews. 
    remote isolated function listAccountInstitutionCurations(int? groupId = (), int? articleId = (), string? status = (), int? 'limit = (), int? offset = ()) returns Curation|error {
        string  path = string `/account/institution/reviews`;
        map<anydata> queryParam = {"group_id": groupId, "article_id": articleId, "status": status, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Curation response = check self.clientEp-> get(path, targetType = Curation);
        return response;
    }
    # Private Account Institution Roles
    #
    # + return - OK. An array of Roles 
    remote isolated function listPrivateInstitutionRoles() returns Role[]|error {
        string  path = string `/account/institution/roles`;
        Role[] response = check self.clientEp-> get(path, targetType = RoleArr);
        return response;
    }
    # List Institution Account Group Roles
    #
    # + accountId - Account identifier the user is associated to 
    # + return - OK. Account Group Roles 
    remote isolated function listPrivateInstitutionAccountGroupRoles(int accountId) returns AccountGroupRoles|error {
        string  path = string `/account/institution/roles/${accountId}`;
        AccountGroupRoles response = check self.clientEp-> get(path, targetType = AccountGroupRoles);
        return response;
    }
    # Add Institution Account Group Roles
    #
    # + accountId - Account identifier the user is associated to 
    # + payload - Account description 
    # + return - Created 
    remote isolated function createPrivateInstitutionAccountGroupRoles(int accountId, AccountGroupRolesCreate payload) returns http:Response|error {
        string  path = string `/account/institution/roles/${accountId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Delete Institution Account Group Role
    #
    # + accountId - Account identifier for which to remove the role 
    # + groupId - Group identifier for which to remove the role 
    # + roleId - Role identifier 
    # + return - No Content 
    remote isolated function deletePrivateInstitutionAccountGroupRole(int accountId, int groupId, int roleId) returns http:Response|error {
        string  path = string `/account/institution/roles/${accountId}/${groupId}/${roleId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Private Account Institution User
    #
    # + accountId - Account identifier the user is associated to 
    # + return - OK. User representation 
    remote isolated function getPrivateInstitutionUserAccount(int accountId) returns User|error {
        string  path = string `/account/institution/users/${accountId}`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Private Account Licenses
    #
    # + return - OK. An array of personal licenses 
    remote isolated function listPrivateLicenses() returns License[]|error {
        string  path = string `/account/licenses`;
        License[] response = check self.clientEp-> get(path, targetType = LicenseArr);
        return response;
    }
    # Private Projects
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + 'order - The field by which to order. 
    # + orderDirection - Sorting order (desc or asc) 
    # + storage - only return collections from this institution 
    # + roles - Any combination of owner, collaborator, viewer separated by comma. Examples: "owner" or "owner,collaborator". 
    # + return - OK. An array of projects 
    remote isolated function listPrivateProjects(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), string 'order = "published_date", string orderDirection = "desc", string? storage = (), string? roles = ()) returns ProjectPrivate[]|error {
        string  path = string `/account/projects`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "order": 'order, "order_direction": orderDirection, "storage": storage, "roles": roles};
        path = path + check getPathForQueryParam(queryParam);
        ProjectPrivate[] response = check self.clientEp-> get(path, targetType = ProjectPrivateArr);
        return response;
    }
    # Create project
    #
    # + payload - Project  description 
    # + return - Created 
    remote isolated function createPrivateProject(ProjectCreate payload) returns Location|error {
        string  path = string `/account/projects`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Private Projects search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of projects 
    remote isolated function searchPrivateProjects(ProjectsSearch payload) returns ProjectPrivate[]|error {
        string  path = string `/account/projects/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ProjectPrivate[] response = check self.clientEp->post(path, request, targetType=ProjectPrivateArr);
        return response;
    }
    # View project details
    #
    # + projectId - Project unique identifier 
    # + return - OK. Project representation 
    remote isolated function getPrivateProjectDetails(int projectId) returns ProjectCompletePrivate|error {
        string  path = string `/account/projects/${projectId}`;
        ProjectCompletePrivate response = check self.clientEp-> get(path, targetType = ProjectCompletePrivate);
        return response;
    }
    # Update project
    #
    # + projectId - Project unique identifier 
    # + payload - Project description 
    # + return - Reset Content 
    remote isolated function updatePrivateProject(int projectId, ProjectUpdate payload) returns http:Response|error {
        string  path = string `/account/projects/${projectId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete project
    #
    # + projectId - Project unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateProject(int projectId) returns http:Response|error {
        string  path = string `/account/projects/${projectId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # List project articles
    #
    # + projectId - Project unique identifier 
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - OK. List of articles 
    remote isolated function listPrivateProjectArticles(int projectId, int? page = (), int pageSize = 10, int? 'limit = (), int? offset = ()) returns Article[]|error {
        string  path = string `/account/projects/${projectId}/articles`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Create project article
    #
    # + projectId - Project unique identifier 
    # + payload - Article description 
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - Created 
    remote isolated function createPrivateProjectArticles(int projectId, ArticleProjectCreate payload, int? page = (), int pageSize = 10, int? 'limit = (), int? offset = ()) returns Location|error {
        string  path = string `/account/projects/${projectId}/articles`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Project article details
    #
    # + projectId - Project unique identifier 
    # + articleId - Project Article unique identifier 
    # + return - OK. Article representation 
    remote isolated function getPrivateProjectArticleDetails(int projectId, int articleId) returns ProjectArticle|error {
        string  path = string `/account/projects/${projectId}/articles/${articleId}`;
        ProjectArticle response = check self.clientEp-> get(path, targetType = ProjectArticle);
        return response;
    }
    # Delete project article
    #
    # + projectId - Project unique identifier 
    # + articleId - Project Article unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateProjectArticle(int projectId, int articleId) returns http:Response|error {
        string  path = string `/account/projects/${projectId}/articles/${articleId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Project article list files
    #
    # + projectId - Project unique identifier 
    # + articleId - Project Article unique identifier 
    # + return - OK. List of files 
    remote isolated function listPrivateProjectArticleFiles(int projectId, int articleId) returns PrivateFile[]|error {
        string  path = string `/account/projects/${projectId}/articles/${articleId}/files`;
        PrivateFile[] response = check self.clientEp-> get(path, targetType = PrivateFileArr);
        return response;
    }
    # Project article file details
    #
    # + projectId - Project unique identifier 
    # + articleId - Project Article unique identifier 
    # + fileId - File unique identifier 
    # + return - OK. File representation 
    remote isolated function getPrivateProjectArticleFile(int projectId, int articleId, int fileId) returns PrivateFile|error {
        string  path = string `/account/projects/${projectId}/articles/${articleId}/files/${fileId}`;
        PrivateFile response = check self.clientEp-> get(path, targetType = PrivateFile);
        return response;
    }
    # List project collaborators
    #
    # + projectId - Project unique identifier 
    # + return - OK. List of Collaborators 
    remote isolated function listPrivateProjectCollaborators(int projectId) returns ProjectCollaborator[]|error {
        string  path = string `/account/projects/${projectId}/collaborators`;
        ProjectCollaborator[] response = check self.clientEp-> get(path, targetType = ProjectCollaboratorArr);
        return response;
    }
    # Invite project collaborators
    #
    # + projectId - Project unique identifier 
    # + payload - viewer or collaborator role. User user_id or email of user 
    # + return - Created 
    remote isolated function invitePrivateProjectCollaborators(int projectId, ProjectCollaboratorInvite payload) returns ResponseMessage|error {
        string  path = string `/account/projects/${projectId}/collaborators`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        ResponseMessage response = check self.clientEp->post(path, request, targetType=ResponseMessage);
        return response;
    }
    # Remove project collaborator
    #
    # + projectId - Project unique identifier 
    # + userId - User unique identifier 
    # + return - OK 
    remote isolated function removePrivateProjectCollaborator(int projectId, int userId) returns http:Response|error {
        string  path = string `/account/projects/${projectId}/collaborators/${userId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Private Project Leave
    #
    # + projectId - Project unique identifier 
    # + return - No Content 
    remote isolated function leavePrivateProject(int projectId) returns http:Response|error {
        string  path = string `/account/projects/${projectId}/leave`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> post(path, request, targetType = http:Response);
        return response;
    }
    # List project notes
    #
    # + projectId - Project unique identifier 
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - OK. List of project notes 
    remote isolated function listPrivateProjectNotes(int projectId, int? page = (), int pageSize = 10, int? 'limit = (), int? offset = ()) returns ProjectNote[]|error {
        string  path = string `/account/projects/${projectId}/notes`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        ProjectNote[] response = check self.clientEp-> get(path, targetType = ProjectNoteArr);
        return response;
    }
    # Create project note
    #
    # + projectId - Project unique identifier 
    # + payload - Note message 
    # + return - Created 
    remote isolated function createProjectNote(int projectId, ProjectNoteCreate payload) returns Location|error {
        string  path = string `/account/projects/${projectId}/notes`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Location response = check self.clientEp->post(path, request, targetType=Location);
        return response;
    }
    # Project note details
    #
    # + projectId - Project unique identifier 
    # + noteId - Note unique identifier 
    # + return - OK. Note representation 
    remote isolated function getPrivateProjectNote(int projectId, int noteId) returns ProjectNotePrivate|error {
        string  path = string `/account/projects/${projectId}/notes/${noteId}`;
        ProjectNotePrivate response = check self.clientEp-> get(path, targetType = ProjectNotePrivate);
        return response;
    }
    # Update project note
    #
    # + projectId - Project unique identifier 
    # + noteId - Note unique identifier 
    # + payload - Note message 
    # + return - Reset Content 
    remote isolated function updatePrivateProjectNote(int projectId, int noteId, ProjectNoteCreate payload) returns http:Response|error {
        string  path = string `/account/projects/${projectId}/notes/${noteId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Delete project note
    #
    # + projectId - Project unique identifier 
    # + noteId - Note unique identifier 
    # + return - No Content 
    remote isolated function deletePrivateProjectNote(int projectId, int noteId) returns http:Response|error {
        string  path = string `/account/projects/${projectId}/notes/${noteId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> delete(path, request, targetType = http:Response);
        return response;
    }
    # Private Project Publish
    #
    # + projectId - Project unique identifier 
    # + return - OK 
    remote isolated function publishPrivateProject(int projectId) returns ResponseMessage|error {
        string  path = string `/account/projects/${projectId}/publish`;
        http:Request request = new;
        //TODO: Update the request as needed;
        ResponseMessage response = check self.clientEp-> post(path, request, targetType = ResponseMessage);
        return response;
    }
    # Public Articles
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + 'order - The field by which to order. Default varies by endpoint/resource. 
    # + orderDirection - Sorting order (desc or asc) 
    # + institution - only return articles from this institution 
    # + publishedSince - Filter by article publishing date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD 
    # + modifiedSince - Filter by article modified date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD 
    # + 'group - only return articles from this group 
    # + resourceDoi - only return articles with this resource_doi 
    # + itemType - Only return articles with the respective type. Mapping for item_type is: 1 - Figure, 2 - Media, 3 - Dataset, 5 - Poster, 6 - Journal contribution, 7 - Presentation, 8 - Thesis, 9 - Software, 11 - Online resource, 12 - Preprint, 13 - Book, 14 - Conference contribution, 15 - Chapter, 16 - Peer review, 17 - Educational resource, 18 - Report, 19 - Standard, 20 - Composition, 21 - Funding, 22 - Physical object, 23 - Data management plan, 24 - Workflow, 25 - Monograph, 26 - Performance, 27 - Event, 28 - Service, 29 - Model 
    # + doi - only return articles with this doi 
    # + 'handle - only return articles with this handle 
    # + return - OK. An array of articles 
    remote isolated function listPublicArticles(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), string 'order = "published_date", string orderDirection = "desc", int? institution = (), string? publishedSince = (), string? modifiedSince = (), int? 'group = (), string? resourceDoi = (), int? itemType = (), string? doi = (), string? 'handle = ()) returns Article[]|error {
        string  path = string `/articles`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "order": 'order, "order_direction": orderDirection, "institution": institution, "published_since": publishedSince, "modified_since": modifiedSince, "group": 'group, "resource_doi": resourceDoi, "item_type": itemType, "doi": doi, "handle": 'handle};
        path = path + check getPathForQueryParam(queryParam);
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Public Articles Search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of articles 
    remote isolated function searchPublicArticles(ArticleSearch payload) returns Article[]|error {
        string  path = string `/articles/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Article[] response = check self.clientEp->post(path, request, targetType=ArticleArr);
        return response;
    }
    # View article details
    #
    # + articleId - Article Unique identifier 
    # + return - OK. Article representation 
    remote isolated function getArticleById(int articleId) returns ArticleComplete|error {
        string  path = string `/articles/${articleId}`;
        ArticleComplete response = check self.clientEp-> get(path, targetType = ArticleComplete);
        return response;
    }
    # List article files
    #
    # + articleId - Article Unique identifier 
    # + return - OK. List of article files 
    remote isolated function listArticleFiles(int articleId) returns PublicFile[]|error {
        string  path = string `/articles/${articleId}/files`;
        PublicFile[] response = check self.clientEp-> get(path, targetType = PublicFileArr);
        return response;
    }
    # Article file details
    #
    # + articleId - Article Unique identifier 
    # + fileId - File Unique identifier 
    # + return - OK. File representation 
    remote isolated function getPublicArticleFileById(int articleId, int fileId) returns PublicFile|error {
        string  path = string `/articles/${articleId}/files/${fileId}`;
        PublicFile response = check self.clientEp-> get(path, targetType = PublicFile);
        return response;
    }
    # List article versions
    #
    # + articleId - Article Unique identifier 
    # + return - OK. Article version representations 
    remote isolated function listPublicArticleVersions(int articleId) returns ArticleVersions[]|error {
        string  path = string `/articles/${articleId}/versions`;
        ArticleVersions[] response = check self.clientEp-> get(path, targetType = ArticleVersionsArr);
        return response;
    }
    # Article details for version
    #
    # + articleId - Article Unique identifier 
    # + vNumber - Article Version Number 
    # + return - OK. Article representation 
    remote isolated function getArticleVersionDetails(int articleId, int vNumber) returns ArticleComplete|error {
        string  path = string `/articles/${articleId}/versions/${vNumber}`;
        ArticleComplete response = check self.clientEp-> get(path, targetType = ArticleComplete);
        return response;
    }
    # Public Article Confidentiality for article version
    #
    # + articleId - Article Unique identifier 
    # + vNumber - Version Number 
    # + return - OK. Confidentiality representation 
    remote isolated function getArticleVersionConfidentiality(int articleId, int vNumber) returns ArticleConfidentiality|error {
        string  path = string `/articles/${articleId}/versions/${vNumber}/confidentiality`;
        ArticleConfidentiality response = check self.clientEp-> get(path, targetType = ArticleConfidentiality);
        return response;
    }
    # Public Article Embargo for article version
    #
    # + articleId - Article Unique identifier 
    # + vNumber - Version Number 
    # + return - OK. Embargo representation 
    remote isolated function embargoArticleVersion(int articleId, int vNumber) returns ArticleEmbargo|error {
        string  path = string `/articles/${articleId}/versions/${vNumber}/embargo`;
        ArticleEmbargo response = check self.clientEp-> get(path, targetType = ArticleEmbargo);
        return response;
    }
    # Public Categories
    #
    # + return - OK. An array of categories 
    remote isolated function listPublicCategories() returns Category[]|error {
        string  path = string `/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Public Collections
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + 'order - The field by which to order. Default varies by endpoint/resource. 
    # + orderDirection - Sorting order (desc or asc) 
    # + institution - only return collections from this institution 
    # + publishedSince - Filter by collection publishing date. Will only return collections published after the date. date(ISO 8601) YYYY-MM-DD 
    # + modifiedSince - Filter by collection modified date. Will only return collections published after the date. date(ISO 8601) YYYY-MM-DD 
    # + 'group - only return collections from this group 
    # + resourceDoi - only return collections with this resource_doi 
    # + doi - only return collections with this doi 
    # + 'handle - only return collections with this handle 
    # + return - OK. An array of collections 
    remote isolated function listPublicCollections(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), string 'order = "published_date", string orderDirection = "desc", int? institution = (), string? publishedSince = (), string? modifiedSince = (), int? 'group = (), string? resourceDoi = (), string? doi = (), string? 'handle = ()) returns Collection[]|error {
        string  path = string `/collections`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "order": 'order, "order_direction": orderDirection, "institution": institution, "published_since": publishedSince, "modified_since": modifiedSince, "group": 'group, "resource_doi": resourceDoi, "doi": doi, "handle": 'handle};
        path = path + check getPathForQueryParam(queryParam);
        Collection[] response = check self.clientEp-> get(path, targetType = CollectionArr);
        return response;
    }
    # Public Collections Search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of collections 
    remote isolated function searchCollections(CollectionSearch payload) returns Collection[]|error {
        string  path = string `/collections/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Collection[] response = check self.clientEp->post(path, request, targetType=CollectionArr);
        return response;
    }
    # Collection details
    #
    # + collectionId - Collection Unique identifier 
    # + return - OK. Collection representation 
    remote isolated function getCollectionDetailsById(int collectionId) returns CollectionComplete|error {
        string  path = string `/collections/${collectionId}`;
        CollectionComplete response = check self.clientEp-> get(path, targetType = CollectionComplete);
        return response;
    }
    # Public Collection Articles
    #
    # + collectionId - Collection Unique identifier 
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + return - OK. An array of articles belonging to the collection 
    remote isolated function listCollectionArticles(int collectionId, int? page = (), int pageSize = 10, int? 'limit = (), int? offset = ()) returns Article[]|error {
        string  path = string `/collections/${collectionId}/articles`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset};
        path = path + check getPathForQueryParam(queryParam);
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Collection Versions list
    #
    # + collectionId - Collection Unique identifier 
    # + return - OK. An array of versions 
    remote isolated function listCollectionVersions(int collectionId) returns CollectionVersions[]|error {
        string  path = string `/collections/${collectionId}/versions`;
        CollectionVersions[] response = check self.clientEp-> get(path, targetType = CollectionVersionsArr);
        return response;
    }
    # Collection Version details
    #
    # + collectionId - Collection Unique identifier 
    # + versionId - Version Number 
    # + return - OK. Collection for that version 
    remote isolated function getCollectionVersionDetails(int collectionId, int versionId) returns CollectionComplete|error {
        string  path = string `/collections/${collectionId}/versions/${versionId}`;
        CollectionComplete response = check self.clientEp-> get(path, targetType = CollectionComplete);
        return response;
    }
    # Public File Download
    #
    # + fileId - File Id 
    # + return - OK 
    remote isolated function downloadFile(int fileId) returns http:Response|error {
        string  path = string `/file/download/${fileId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Private Institution HRfeed Upload
    #
    # + payload - Request payload to upload HRFeed File 
    # + return - OK 
    remote isolated function uploadHRFeedFile(Body payload) returns ResponseMessage|error {
        string  path = string `/institution/hrfeed/upload`;
        http:Request request = new;
        ResponseMessage response = check self.clientEp->post(path, request, targetType=ResponseMessage);
        return response;
    }
    # Public Licenses
    #
    # + institutionStringId - Institution Id 
    # + resourceId - Resource Id 
    # + filename - File name 
    # + return - OK. An array of articles 
    remote isolated function listArticlesByInstitution(string institutionStringId, string resourceId, string filename) returns Article[]|error {
        string  path = string `/institutions/${institutionStringId}/articles/filter-by`;
        map<anydata> queryParam = {"resource_id": resourceId, "filename": filename};
        path = path + check getPathForQueryParam(queryParam);
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
        return response;
    }
    # Public Licenses
    #
    # + return - OK. An array of licenses 
    remote isolated function listPublicLicenses() returns License[]|error {
        string  path = string `/licenses`;
        License[] response = check self.clientEp-> get(path, targetType = LicenseArr);
        return response;
    }
    # Public Projects
    #
    # + page - Page number. Used for pagination with page_size 
    # + pageSize - The number of results included on a page. Used for pagination with page 
    # + 'limit - Number of results included on a page. Used for pagination with query 
    # + offset - Where to start the listing(the offset of the first result). Used for pagination with limit 
    # + 'order - The field by which to order. Default varies by endpoint/resource. 
    # + orderDirection - Sorting order (desc or asc) 
    # + institution - only return collections from this institution 
    # + publishedSince - Filter by article publishing date. Will only return articles published after the date. date(ISO 8601) YYYY-MM-DD 
    # + 'group - only return collections from this group 
    # + return - OK. An array of projects 
    remote isolated function listPublicProjects(int? page = (), int pageSize = 10, int? 'limit = (), int? offset = (), string 'order = "published_date", string orderDirection = "desc", int? institution = (), string? publishedSince = (), int? 'group = ()) returns Project[]|error {
        string  path = string `/projects`;
        map<anydata> queryParam = {"page": page, "page_size": pageSize, "limit": 'limit, "offset": offset, "order": 'order, "order_direction": orderDirection, "institution": institution, "published_since": publishedSince, "group": 'group};
        path = path + check getPathForQueryParam(queryParam);
        Project[] response = check self.clientEp-> get(path, targetType = ProjectArr);
        return response;
    }
    # Public Projects Search
    #
    # + payload - Search Parameters 
    # + return - OK. An array of projects 
    remote isolated function searchPublicProjects(ProjectsSearch payload) returns Project[]|error {
        string  path = string `/projects/search`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project[] response = check self.clientEp->post(path, request, targetType=ProjectArr);
        return response;
    }
    # Public Project
    #
    # + projectId - Project Unique identifier 
    # + return - OK. Project representation 
    remote isolated function getProjectById(int projectId) returns ProjectComplete|error {
        string  path = string `/projects/${projectId}`;
        ProjectComplete response = check self.clientEp-> get(path, targetType = ProjectComplete);
        return response;
    }
    # Public Project Articles
    #
    # + projectId - Project Unique identifier 
    # + return - OK. Project articles list 
    remote isolated function listArticlesByProject(int projectId) returns Article[]|error {
        string  path = string `/projects/${projectId}/articles`;
        Article[] response = check self.clientEp-> get(path, targetType = ArticleArr);
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
