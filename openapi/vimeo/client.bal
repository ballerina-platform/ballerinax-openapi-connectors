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

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
public type ClientConfig record {|
    # Configurations related to client authentication
    http:OAuth2ClientCredentialsGrantConfig|http:BearerTokenConfig|http:OAuth2RefreshTokenGrantConfig auth;
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

# This is a generated connector for [Vimeo API v3.4](https://developer.vimeo.com/) OpenAPI specification.
# The Vimeo API provides access to manage Vimeo platform. This includes management of videos, channels, albums, users etc.
@display {label: "Vimeo", iconPath: "resources/vimeo.svg"}
public isolated client class Client {
    final http:Client clientEp;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Vimeo account](https://vimeo.com/join) and obtain tokens by following [this guide](https://developer.vimeo.com/api/authentication).
    #
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ClientConfig clientConfig, string serviceUrl = "https://api.vimeo.com") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
    }
    # Get an API specification
    #
    # + openapi - Return an OpenAPI specification. 
    # + return - Standard request. 
    remote isolated function getEndpoints(boolean? openapi = ()) returns Endpoint|error {
        string  path = string `/`;
        map<anydata> queryParam = {"openapi": openapi};
        path = path + check getPathForQueryParam(queryParam);
        Endpoint response = check self.clientEp-> get(path, targetType = Endpoint);
        return response;
    }
    # Get all categories
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The categories were returned. 
    remote isolated function getCategories(string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Category[]|error {
        string  path = string `/categories`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Get a specific category
    #
    # + category - The name of the category. 
    # + return - The category was returned. 
    remote isolated function getCategory(string category) returns Category|error {
        string  path = string `/categories/${category}`;
        Category response = check self.clientEp-> get(path, targetType = Category);
        return response;
    }
    # Get all the channels in a category
    #
    # + category - The name of the category. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The channels were returned. 
    remote isolated function getCategoryChannels(string category, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Channel[]|error {
        string  path = string `/categories/${category}/channels`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Channel[] response = check self.clientEp-> get(path, targetType = ChannelArr);
        return response;
    }
    # Get all the groups in a category
    #
    # + category - The name of the category. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The groups were returned. 
    remote isolated function getCategoryGroups(string category, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Group[]|error {
        string  path = string `/categories/${category}/groups`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Get all the videos in a category
    #
    # + category - The name of the category. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. Option descriptions:  * `conditional_featured` - Featured (promoted) videos 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getCategoryVideos(string category, string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/categories/${category}/videos`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Check for a video in a category
    #
    # + category - The name of the category. 
    # + videoId - The ID of the video. 
    # + return - The video belongs to the category. 
    remote isolated function checkCategoryForVideo(string category, decimal videoId) returns Video|error {
        string  path = string `/categories/${category}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Get all channels
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. Option descriptions:  * `relevant` - Relevant sorting is available only for search queries. 
    # + return - The channels were returned. 
    remote isolated function getChannels(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Channel[]|error {
        string  path = string `/channels`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Channel[] response = check self.clientEp-> get(path, targetType = ChannelArr);
        return response;
    }
    # Create a channel
    #
    # + return - The channel was created. 
    remote isolated function createChannel(Body payload) returns Channel|error {
        string  path = string `/channels`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Channel response = check self.clientEp->post(path, request, targetType=Channel);
        return response;
    }
    # Get a specific channel
    #
    # + channelId - The ID of the channel. 
    # + return - The channel was returned. 
    remote isolated function getChannel(decimal channelId) returns Channel|error {
        string  path = string `/channels/${channelId}`;
        Channel response = check self.clientEp-> get(path, targetType = Channel);
        return response;
    }
    # Delete a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The channel was deleted. 
    remote isolated function deleteChannel(decimal channelId) returns http:Response|error {
        string  path = string `/channels/${channelId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The channel was edited. 
    remote isolated function editChannel(decimal channelId, Body1 payload) returns Channel|error {
        string  path = string `/channels/${channelId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Channel response = check self.clientEp->patch(path, request, targetType=Channel);
        return response;
    }
    # Get all the categories in a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The categories were returned. 
    remote isolated function getChannelCategories(decimal channelId) returns Category[]|error {
        string  path = string `/channels/${channelId}/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Add a list of categories to a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The categories were added. 
    remote isolated function addChannelCategories(decimal channelId, Body2 payload) returns http:Response|error {
        string  path = string `/channels/${channelId}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Categorize a channel
    #
    # + category - The name of the category. 
    # + channelId - The ID of the channel. 
    # + return - The channel was categorized. 
    remote isolated function categorizeChannel(string category, decimal channelId) returns http:Response|error {
        string  path = string `/channels/${channelId}/categories/${category}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a category from a channel
    #
    # + category - The name of the category. 
    # + channelId - The ID of the channel. 
    # + return - The channel was removed. 
    remote isolated function deleteChannelCategory(string category, decimal channelId) returns http:Response|error {
        string  path = string `/channels/${channelId}/categories/${category}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the moderators in a channel
    #
    # + channelId - The ID of the channel. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The moderators were returned. 
    remote isolated function getChannelModerators(decimal channelId, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/channels/${channelId}/moderators`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Add a list of channel moderators
    #
    # + channelId - The ID of the channel. 
    # + return - The moderators were added. 
    remote isolated function addChannelModerators(decimal channelId, Body3 payload) returns http:Response|error {
        string  path = string `/channels/${channelId}/moderators`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Remove a list of channel moderators
    #
    # + channelId - The ID of the channel. 
    # + return - The moderators were removed. 
    remote isolated function removeChannelModerators(decimal channelId, Body4 payload) returns User|error {
        string  path = string `/channels/${channelId}/moderators`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->delete(path, request, targetType=User);
        return response;
    }
    # Replace the moderators of a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The moderators were replaced. 
    remote isolated function replaceChannelModerators(decimal channelId, Body5 payload) returns User[]|error {
        string  path = string `/channels/${channelId}/moderators`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User[] response = check self.clientEp->patch(path, request, targetType=UserArr);
        return response;
    }
    # Get a specific channel moderator
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The moderator was returned. 
    remote isolated function getChannelModerator(decimal channelId, decimal userId) returns User|error {
        string  path = string `/channels/${channelId}/moderators/${userId}`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Add a specific channel moderator
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The authenticated user doesn't own the channel, a user is already a moderator of the channel, or you tried to add a user that the authenticated user doesn't follow. 
    remote isolated function addChannelModerator(decimal channelId, decimal userId) returns LegacyError|error {
        string  path = string `/channels/${channelId}/moderators/${userId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        LegacyError response = check self.clientEp-> put(path, request, targetType = LegacyError);
        return response;
    }
    # Remove a specific channel moderator
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The moderator was removed. 
    remote isolated function removeChannelModerator(decimal channelId, decimal userId) returns http:Response|error {
        string  path = string `/channels/${channelId}/moderators/${userId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the users who can view a private channel
    #
    # + channelId - The ID of the channel. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The users were returned. 
    remote isolated function getChannelPrivacyUsers(decimal channelId, string? direction = (), decimal? page = (), decimal? perPage = ()) returns User[]|error {
        string  path = string `/channels/${channelId}/privacy/users`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Permit a list of users to view a private channel
    #
    # + channelId - The ID of the channel. 
    # + return - The users can now view the private channel. 
    remote isolated function setChannelPrivacyUsers(decimal channelId, Body6 payload) returns User[]|error {
        string  path = string `/channels/${channelId}/privacy/users`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User[] response = check self.clientEp->put(path, request, targetType=UserArr);
        return response;
    }
    # Permit a specific user to view a private channel
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The user can now view the private channel. 
    remote isolated function setChannelPrivacyUser(decimal channelId, decimal userId) returns http:Response|error {
        string  path = string `/channels/${channelId}/privacy/users/${userId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Restrict a user from viewing a private channel
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The user can no longer view the private channel. 
    remote isolated function deleteChannelPrivacyUser(decimal channelId, decimal userId) returns http:Response|error {
        string  path = string `/channels/${channelId}/privacy/users/${userId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the tags that have been added to a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The tags were returned. 
    remote isolated function getChannelTags(decimal channelId) returns Tag[]|error {
        string  path = string `/channels/${channelId}/tags`;
        Tag[] response = check self.clientEp-> get(path, targetType = TagArr);
        return response;
    }
    # Add a list of tags to a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The tags were added. 
    remote isolated function addTagsToChannel(decimal channelId, Body7 payload) returns Tag[]|error {
        string  path = string `/channels/${channelId}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Tag[] response = check self.clientEp->put(path, request, targetType=TagArr);
        return response;
    }
    # Check if a tag has been added to a channel
    #
    # + channelId - The ID of the channel. 
    # + word - The word to use as the tag. 
    # + return - The tag has been added to the channel. 
    remote isolated function checkIfChannelHasTag(decimal channelId, string word) returns http:Response|error {
        string  path = string `/channels/${channelId}/tags/${word}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Add a specific tag to a channel
    #
    # + channelId - The ID of the channel. 
    # + word - The word to use as the tag. 
    # + return - The tag was added. 
    remote isolated function addChannelTag(decimal channelId, string word) returns http:Response|error {
        string  path = string `/channels/${channelId}/tags/${word}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a tag from a channel
    #
    # + channelId - The ID of the channel. 
    # + word - The word to use as the tag. 
    # + return - The tag was removed. 
    remote isolated function deleteTagFromChannel(decimal channelId, string word) returns http:Response|error {
        string  path = string `/channels/${channelId}/tags/${word}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the followers of a channel
    #
    # + channelId - The ID of the channel. 
    # + filter - The attribute by which to filter the results. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The followers were returned. 
    remote isolated function getChannelSubscribers(decimal channelId, string filter, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/channels/${channelId}/users`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the videos in a channel
    #
    # + channelId - The ID of the channel. 
    # + containingUri - The page that contains the video URI. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getChannelVideos(decimal channelId, string? containingUri = (), string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/channels/${channelId}/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Add a list of videos to a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The videos were added. 
    remote isolated function addVideosToChannel(decimal channelId, Body8 payload) returns http:Response|error {
        string  path = string `/channels/${channelId}/videos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Remove a list of videos from a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The videos were removed. 
    remote isolated function removeVideosFromChannel(decimal channelId, Body9 payload) returns Video|error {
        string  path = string `/channels/${channelId}/videos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Video response = check self.clientEp->delete(path, request, targetType=Video);
        return response;
    }
    # Get a specific video in a channel
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The video was returned. 
    remote isolated function getChannelVideo(decimal channelId, decimal videoId) returns Video|error {
        string  path = string `/channels/${channelId}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a specific video to a channel
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToChannel(decimal channelId, decimal videoId) returns http:Response|error {
        string  path = string `/channels/${channelId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a specific video from a channel
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The video was removed. 
    remote isolated function deleteVideoFromChannel(decimal channelId, decimal videoId) returns http:Response|error {
        string  path = string `/channels/${channelId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the comments on a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The comments were returned. 
    remote isolated function getCommentsAlt1(decimal channelId, decimal videoId, string? direction = (), decimal? page = (), decimal? perPage = ()) returns Comment[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/comments`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Comment[] response = check self.clientEp-> get(path, targetType = CommentArr);
        return response;
    }
    # Add a comment to a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The comment was added. 
    remote isolated function createCommentAlt1(decimal channelId, decimal videoId, Body10 payload) returns Comment|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, targetType=Comment);
        return response;
    }
    # Get all the credited users in a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The users were returned. 
    remote isolated function getVideoCreditsAlt1(decimal channelId, decimal videoId, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Credit[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/credits`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Credit[] response = check self.clientEp-> get(path, targetType = CreditArr);
        return response;
    }
    # Credit a user in a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The credit was added. 
    remote isolated function addVideoCreditAlt1(decimal channelId, decimal videoId, Body11 payload) returns Credit|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/credits`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Credit response = check self.clientEp->post(path, request, targetType=Credit);
        return response;
    }
    # Get all the users who have liked a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The users were returned. 
    remote isolated function getVideoLikesAlt1(decimal channelId, decimal videoId, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns User[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/likes`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the thumbnails of a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The thumbnails were returned. 
    remote isolated function getVideoThumbnailsAlt1(decimal channelId, decimal videoId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/pictures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a video thumbnail
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The thumbnail was created. 
    remote isolated function createVideoThumbnailAlt1(decimal channelId, decimal videoId, Body12 payload) returns Picture|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/pictures`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->post(path, request, targetType=Picture);
        return response;
    }
    # Get all the users who can view a user's private videos by default
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The users were returned. 
    remote isolated function getVideoPrivacyUsersAlt1(decimal channelId, decimal videoId, decimal? page = (), decimal? perPage = ()) returns User[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/privacy/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Permit a list of users to view a private video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The users can now view the private video. 
    remote isolated function addVideoPrivacyUsersAlt1(decimal channelId, decimal videoId) returns User[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/privacy/users`;
        http:Request request = new;
        //TODO: Update the request as needed;
        User[] response = check self.clientEp-> put(path, request, targetType = UserArr);
        return response;
    }
    # Get all the text tracks of a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The text tracks were returned. 
    remote isolated function getTextTracksAlt1(decimal channelId, decimal videoId) returns TextTrack[]|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/texttracks`;
        TextTrack[] response = check self.clientEp-> get(path, targetType = TextTrackArr);
        return response;
    }
    # Add a text track to a video
    #
    # + channelId - The ID of the channel. 
    # + videoId - The ID of the video. 
    # + return - The text track was added. 
    remote isolated function createTextTrackAlt1(decimal channelId, decimal videoId, Body13 payload) returns TextTrack|error {
        string  path = string `/channels/${channelId}/videos/${videoId}/texttracks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TextTrack response = check self.clientEp->post(path, request, targetType=TextTrack);
        return response;
    }
    # Get all content ratings
    #
    # + return - The content ratings were returned. 
    remote isolated function getContentRatings() returns ContentRating[]|error {
        string  path = string `/contentratings`;
        ContentRating[] response = check self.clientEp-> get(path, targetType = ContentRatingArr);
        return response;
    }
    # Get all Creative Commons licenses
    #
    # + return - The Creative Commons licenses were returned. 
    remote isolated function getCcLicenses() returns CreativeCommons[]|error {
        string  path = string `/creativecommons`;
        CreativeCommons[] response = check self.clientEp-> get(path, targetType = CreativeCommonsArr);
        return response;
    }
    # Get all groups
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. Option descriptions:  * `relevant` - Relevant sorting is available only for search queries. 
    # + return - The groups were returned. 
    remote isolated function getGroups(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Group[]|error {
        string  path = string `/groups`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Create a group
    #
    # + return - The group was created. 
    remote isolated function createGroup(Body14 payload) returns Group|error {
        string  path = string `/groups`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Group response = check self.clientEp->post(path, request, targetType=Group);
        return response;
    }
    # Get a specific group
    #
    # + groupId - The ID of the group. 
    # + return - The group was returned. 
    remote isolated function getGroup(decimal groupId) returns Group|error {
        string  path = string `/groups/${groupId}`;
        Group response = check self.clientEp-> get(path, targetType = Group);
        return response;
    }
    # Delete a group
    #
    # + groupId - The ID of the group. 
    # + return - The group was deleted. 
    remote isolated function deleteGroup(decimal groupId) returns http:Response|error {
        string  path = string `/groups/${groupId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the members of a group
    #
    # + groupId - The ID of the group. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The members were returned. 
    remote isolated function getGroupMembers(decimal groupId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/groups/${groupId}/users`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the videos in a group
    #
    # + groupId - The ID of the group. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getGroupVideos(decimal groupId, string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/groups/${groupId}/videos`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get a specific video in a group
    #
    # + groupId - The ID of the group. 
    # + videoId - The ID of the video. 
    # + return - The video was returned. 
    remote isolated function getGroupVideo(decimal groupId, decimal videoId) returns Video|error {
        string  path = string `/groups/${groupId}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a video to a group
    #
    # + groupId - The ID of the group. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToGroup(decimal groupId, decimal videoId) returns Video|error {
        string  path = string `/groups/${groupId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Video response = check self.clientEp-> put(path, request, targetType = Video);
        return response;
    }
    # Remove a video from a group
    #
    # + groupId - The ID of the group. 
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideoFromGroup(decimal groupId, decimal videoId) returns http:Response|error {
        string  path = string `/groups/${groupId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all languages
    #
    # + filter - The attribute by which to filter the results. Option descriptions:  * `texttracks` - Only return text track supported languages 
    # + return - The languages were returned. 
    remote isolated function getLanguages(string? filter = ()) returns Language[]|error {
        string  path = string `/languages`;
        map<anydata> queryParam = {"filter": filter};
        path = path + check getPathForQueryParam(queryParam);
        Language[] response = check self.clientEp-> get(path, targetType = LanguageArr);
        return response;
    }
    # Get a user
    #
    # + return - The user was returned. 
    remote isolated function getUserAlt1() returns User|error {
        string  path = string `/me`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Edit a user
    #
    # + return - The user was edited. 
    remote isolated function editUserAlt1(Body15 payload) returns User|error {
        string  path = string `/me`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->patch(path, request, targetType=User);
        return response;
    }
    # Get all the albums that belong to a user
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The albums were returned. 
    remote isolated function getAlbumsAlt1(string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Album[]|error {
        string  path = string `/me/albums`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Album[] response = check self.clientEp-> get(path, targetType = AlbumArr);
        return response;
    }
    # Create an album
    #
    # + return - The album was created. 
    remote isolated function createAlbumAlt1(Body16 payload) returns Album|error {
        string  path = string `/me/albums`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Album response = check self.clientEp->post(path, request, targetType=Album);
        return response;
    }
    # Get a specific album
    #
    # + albumId - The ID of the album. 
    # + return - The album was returned. 
    remote isolated function getAlbumAlt1(decimal albumId) returns Album|error {
        string  path = string `/me/albums/${albumId}`;
        Album response = check self.clientEp-> get(path, targetType = Album);
        return response;
    }
    # Delete an album
    #
    # + albumId - The ID of the album. 
    # + return - The album was deleted. 
    remote isolated function deleteAlbumAlt1(decimal albumId) returns http:Response|error {
        string  path = string `/me/albums/${albumId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit an album
    #
    # + albumId - The ID of the album. 
    # + return - The album was edited. 
    remote isolated function editAlbumAlt1(decimal albumId, Body17 payload) returns Album|error {
        string  path = string `/me/albums/${albumId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Album response = check self.clientEp->patch(path, request, targetType=Album);
        return response;
    }
    # Get all the videos in an album
    #
    # + albumId - The ID of the album. 
    # + containingUri - The page containing the video URI. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + password - The password of the album. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + weakSearch - Whether to include private videos in the search. Please note that a separate search service provides this functionality. The service performs a partial text search on the video's name. 
    # + return - The videos were returned. 
    remote isolated function getAlbumVideosAlt1(decimal albumId, string? containingUri = (), string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), string? password = (), decimal? perPage = (), string? query = (), string? sort = (), boolean? weakSearch = ()) returns Video[]|error {
        string  path = string `/me/albums/${albumId}/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "password": password, "per_page": perPage, "query": query, "sort": sort, "weak_search": weakSearch};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Replace all the videos in an album
    #
    # + albumId - The ID of the album. 
    # + return - The videos were added. 
    remote isolated function replaceVideosInAlbumAlt1(decimal albumId, Body18 payload) returns http:Response|error {
        string  path = string `/me/albums/${albumId}/videos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get a specific video in an album
    #
    # + albumId - The ID of the album. 
    # + videoId - The ID of the video. 
    # + password - The password of the album. 
    # + return - The video was returned. 
    remote isolated function getAlbumVideoAlt1(decimal albumId, decimal videoId, string? password = ()) returns Video|error {
        string  path = string `/me/albums/${albumId}/videos/${videoId}`;
        map<anydata> queryParam = {"password": password};
        path = path + check getPathForQueryParam(queryParam);
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a specific video to an album
    #
    # + albumId - The ID of the album. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToAlbumAlt1(decimal albumId, decimal videoId) returns http:Response|error {
        string  path = string `/me/albums/${albumId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a video from an album
    #
    # + albumId - The ID of the album. 
    # + videoId - The ID of the video. 
    # + return - The video was removed. 
    remote isolated function removeVideoFromAlbumAlt1(decimal albumId, decimal videoId) returns http:Response|error {
        string  path = string `/me/albums/${albumId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Set a video as the album thumbnail
    #
    # + albumId - The ID of the album. 
    # + videoId - The ID of the video. 
    # + return - The album was updated with a new thumbnail. 
    remote isolated function setVideoAsAlbumThumbnailAlt1(decimal albumId, decimal videoId, Body19 payload) returns Album|error {
        string  path = string `/me/albums/${albumId}/videos/${videoId}/set_album_thumbnail`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Album response = check self.clientEp->post(path, request, targetType=Album);
        return response;
    }
    # Get all the videos in which a user appears
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getAppearancesAlt1(string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/me/appearances`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get all the categories that a user follows
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The categories were returned. 
    remote isolated function getCategorySubscriptionsAlt1(string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Category[]|error {
        string  path = string `/me/categories`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Check if a user follows a category
    #
    # + category - The name of the category. 
    # + return - The user is following the category. 
    remote isolated function checkIfUserSubscribedToCategoryAlt1(string category) returns http:Response|error {
        string  path = string `/me/categories/${category}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Subscribe a user to a single category
    #
    # + category - The name of the category. 
    # + return - The user was subscribed. 
    remote isolated function subscribeToCategoryAlt1(decimal category) returns http:Response|error {
        string  path = string `/me/categories/${category}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Unsubscribe a user from a category
    #
    # + category - The name of the category. 
    # + return - The user was unsubscribed. 
    remote isolated function unsubscribeFromCategoryAlt1(string category) returns http:Response|error {
        string  path = string `/me/categories/${category}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the channels to which a user subscribes
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The channels were returned. 
    remote isolated function getChannelSubscriptionsAlt1(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Channel[]|error {
        string  path = string `/me/channels`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Channel[] response = check self.clientEp-> get(path, targetType = ChannelArr);
        return response;
    }
    # Check if a user follows a channel
    #
    # + channelId - The ID of the channel. 
    # + return - The user follows the channel. 
    remote isolated function checkIfUserSubscribedToChannelAlt1(decimal channelId) returns http:Response|error {
        string  path = string `/me/channels/${channelId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Subscribe a user to a specific channel
    #
    # + channelId - The ID of the channel. 
    # + return - The user is now a follower of the channel. 
    remote isolated function subscribeToChannelAlt1(decimal channelId) returns http:Response|error {
        string  path = string `/me/channels/${channelId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Unsubscribe a user from a specific channel
    #
    # + channelId - The ID of the channel. 
    # + return - The user is no longer a follower of the channel. 
    remote isolated function unsubscribeFromChannelAlt1(decimal channelId) returns http:Response|error {
        string  path = string `/me/channels/${channelId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the custom logos that belong to a user
    #
    # + return - The custom logos were returned. 
    remote isolated function getCustomLogosAlt1() returns Picture[]|error {
        string  path = string `/me/customlogos`;
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a custom logo
    #
    # + return - The custom logo was created. 
    remote isolated function createCustomLogoAlt1() returns Picture|error {
        string  path = string `/me/customlogos`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific custom logo
    #
    # + logoId - The ID of the custom logo. 
    # + return - The custom logo was returned. 
    remote isolated function getCustomLogoAlt1(decimal logoId) returns Picture|error {
        string  path = string `/me/customlogos/${logoId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Get all videos in a user's feed
    #
    # + offset - Necessary for proper pagination. You shouldn't provide this value yourself, and instead use the pagination links in the feed response. Please see our [pagination documentation](https://developer.vimeo.com/api/common-formats#using-the-pagination-parameter) for more information. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + 'type - The feed type. 
    # + return - The videos were returned. 
    remote isolated function getFeedAlt1(string? offset = (), decimal? page = (), decimal? perPage = (), string? 'type = ()) returns Activity31[]|error {
        string  path = string `/me/feed`;
        map<anydata> queryParam = {"offset": offset, "page": page, "per_page": perPage, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        Activity31[] response = check self.clientEp-> get(path, targetType = Activity31Arr);
        return response;
    }
    # Get all the followers of a user
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The user's followers were returned. 
    remote isolated function getFollowersAlt1(string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/me/followers`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the users that a user is following
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The followed users were returned. 
    remote isolated function getUserFollowingAlt1(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/me/following`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Follow a list of users
    #
    # + return - The users were followed. 
    remote isolated function followUsersAlt1(Body20 payload) returns http:Response|error {
        string  path = string `/me/following`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Check if a user is following another user
    #
    # + followUserId - The ID of the following user. 
    # + return - The authenticated user follows the user in question. 
    remote isolated function checkIfUserIsFollowingAlt1(decimal followUserId) returns http:Response|error {
        string  path = string `/me/following/${followUserId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Follow a specific user
    #
    # + followUserId - The ID of the following user. 
    # + return - The user was followed. 
    remote isolated function followUserAlt1(decimal followUserId) returns http:Response|error {
        string  path = string `/me/following/${followUserId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Unfollow a user
    #
    # + followUserId - The ID of the following user. 
    # + return - The user was unfollowed. 
    remote isolated function unfollowUserAlt1(decimal followUserId) returns http:Response|error {
        string  path = string `/me/following/${followUserId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the groups that a user has joined
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The groups were returned. 
    remote isolated function getUserGroupsAlt1(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Group[]|error {
        string  path = string `/me/groups`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Check if a user has joined a group
    #
    # + groupId - The ID of the group. 
    # + return - The user has joined the group. 
    remote isolated function checkIfUserJoinedGroupAlt1(decimal groupId) returns http:Response|error {
        string  path = string `/me/groups/${groupId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Add a user to a group
    #
    # + groupId - The ID of the group. 
    # + return - The user joined the group. 
    remote isolated function joinGroupAlt1(decimal groupId) returns http:Response|error {
        string  path = string `/me/groups/${groupId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a user from a group
    #
    # + groupId - The ID of the group. 
    # + return - The user left the group. 
    remote isolated function leaveGroupAlt1(decimal groupId) returns http:Response|error {
        string  path = string `/me/groups/${groupId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the videos that a user has liked
    #
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getLikesAlt1(string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/me/likes`;
        map<anydata> queryParam = {"filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Check if a user has liked a video
    #
    # + videoId - The ID of the video. 
    # + return - The user has liked the video. 
    remote isolated function checkIfUserLikedVideoAlt1(decimal videoId) returns http:Response|error {
        string  path = string `/me/likes/${videoId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Cause a user to like a video
    #
    # + videoId - The ID of the video. 
    # + return - The video was liked. 
    remote isolated function likeVideoAlt1(decimal videoId) returns http:Response|error {
        string  path = string `/me/likes/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Cause a user to unlike a video
    #
    # + videoId - The ID of the video. 
    # + return - The video was unliked. 
    remote isolated function unlikeVideoAlt1(decimal videoId) returns http:Response|error {
        string  path = string `/me/likes/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the On Demand pages of a user
    #
    # + direction - The sort direction of the results. 
    # + filter - The type of On Demand pages to return. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The On Demand pages were returned. 
    remote isolated function getUserVodsAlt1(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns OnDemandPage[]|error {
        string  path = string `/me/ondemand/pages`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandPage[] response = check self.clientEp-> get(path, targetType = OnDemandPageArr);
        return response;
    }
    # Create an On Demand page
    #
    # + return - The On Demand page was created. 
    remote isolated function createVodAlt1(Body21 payload) returns OnDemandPage|error {
        string  path = string `/me/ondemand/pages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandPage response = check self.clientEp->post(path, request, targetType=OnDemandPage);
        return response;
    }
    # Get all the On Demand purchases and rentals that a user has made
    #
    # + direction - The sort direction of the results. 
    # + filter - The type of On Demand videos to show. Option descriptions:  * `important` - Will show all pages which are about to expire. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The purchases and rentals were returned. 
    remote isolated function getVodPurchases(string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns OnDemandPage[]|error {
        string  path = string `/me/ondemand/purchases`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandPage[] response = check self.clientEp-> get(path, targetType = OnDemandPageArr);
        return response;
    }
    # Check if a user has made a purchase or rental from an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - You have purchased the On Demand page. 
    remote isolated function checkIfVodWasPurchasedAlt1(decimal ondemandId) returns OnDemandPage|error {
        string  path = string `/me/ondemand/purchases/${ondemandId}`;
        OnDemandPage response = check self.clientEp-> get(path, targetType = OnDemandPage);
        return response;
    }
    # Get all the pictures that belong to a user
    #
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The pictures were returned. 
    remote isolated function getPicturesAlt1(decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/me/pictures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a user picture
    #
    # + return - The user picture was created. 
    remote isolated function createPictureAlt1() returns Picture|error {
        string  path = string `/me/pictures`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific user picture
    #
    # + portraitsetId - The ID of the picture. 
    # + return - The picture was returned. 
    remote isolated function getPictureAlt1(decimal portraitsetId) returns Picture|error {
        string  path = string `/me/pictures/${portraitsetId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Delete a user picture
    #
    # + portraitsetId - The ID of the picture. 
    # + return - The picture was deleted. 
    remote isolated function deletePictureAlt1(decimal portraitsetId) returns http:Response|error {
        string  path = string `/me/pictures/${portraitsetId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a user picture
    #
    # + portraitsetId - The ID of the picture. 
    # + return - The picture was edited. 
    remote isolated function editPictureAlt1(decimal portraitsetId, Body22 payload) returns Picture|error {
        string  path = string `/me/pictures/${portraitsetId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Get all the portfolios that belong to a user
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The portfolios were returned. 
    remote isolated function getPortfoliosAlt1(string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Portfolio[]|error {
        string  path = string `/me/portfolios`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Portfolio[] response = check self.clientEp-> get(path, targetType = PortfolioArr);
        return response;
    }
    # Get a specific portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + return - The portfolio was returned. 
    remote isolated function getPortfolioAlt1(decimal portfolioId) returns Portfolio|error {
        string  path = string `/me/portfolios/${portfolioId}`;
        Portfolio response = check self.clientEp-> get(path, targetType = Portfolio);
        return response;
    }
    # Get all the videos in a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + containingUri - The page that contains the video URI. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. Option descriptions:  * `default` - This will sort to the default sort set on the portfolio. 
    # + return - The videos were returned. 
    remote isolated function getPortfolioVideosAlt1(decimal portfolioId, string? containingUri = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/me/portfolios/${portfolioId}/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get a specific video in a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + videoId - The ID of the video. 
    # + return - The video was returned. 
    remote isolated function getPortfolioVideoAlt1(decimal portfolioId, decimal videoId) returns Video|error {
        string  path = string `/me/portfolios/${portfolioId}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a video to a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToPortfolioAlt1(decimal portfolioId, decimal videoId) returns http:Response|error {
        string  path = string `/me/portfolios/${portfolioId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a video from a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideoFromPortfolioAlt1(decimal portfolioId, decimal videoId) returns http:Response|error {
        string  path = string `/me/portfolios/${portfolioId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the embed presets that a user has created
    #
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The embed presets were returned. 
    remote isolated function getEmbedPresetsAlt1(decimal? page = (), decimal? perPage = ()) returns Presets[]|error {
        string  path = string `/me/presets`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Presets[] response = check self.clientEp-> get(path, targetType = PresetsArr);
        return response;
    }
    # Get a specific embed preset
    #
    # + presetId - The ID of the preset. 
    # + return - The embed preset was returned. 
    remote isolated function getEmbedPresetAlt1(decimal presetId) returns Presets|error {
        string  path = string `/me/presets/${presetId}`;
        Presets response = check self.clientEp-> get(path, targetType = Presets);
        return response;
    }
    # Edit an embed preset
    #
    # + presetId - The ID of the preset. 
    # + return - The embed preset was edited. 
    remote isolated function editEmbedPresetAlt1(decimal presetId, Body23 payload) returns Presets|error {
        string  path = string `/me/presets/${presetId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Presets response = check self.clientEp->patch(path, request, targetType=Presets);
        return response;
    }
    # Get all the videos that have been added to an embed preset
    #
    # + presetId - The ID of the preset. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The videos were returned. 
    remote isolated function getEmbedPresetVideosAlt1(decimal presetId, decimal? page = (), decimal? perPage = ()) returns Video[]|error {
        string  path = string `/me/presets/${presetId}/videos`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get all the projects that belong to a user
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The projects were returned. 
    remote isolated function getProjectsAlt1(string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Project[]|error {
        string  path = string `/me/projects`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Project[] response = check self.clientEp-> get(path, targetType = ProjectArr);
        return response;
    }
    # Create a project
    #
    # + return - The project was created. 
    remote isolated function createProjectAlt1(Body24 payload) returns Project|error {
        string  path = string `/me/projects`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, targetType=Project);
        return response;
    }
    # Get a specific project
    #
    # + projectId - The ID of the project. 
    # + return - The project was returned. 
    remote isolated function getProjectAlt1(decimal projectId) returns Project|error {
        string  path = string `/me/projects/${projectId}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Delete a project
    #
    # + projectId - The ID of the project. 
    # + shouldDeleteClips - Whether to delete all the videos in the project along with the project itself. 
    # + return - The project was deleted. 
    remote isolated function deleteProjectAlt1(decimal projectId, boolean? shouldDeleteClips = ()) returns http:Response|error {
        string  path = string `/me/projects/${projectId}`;
        map<anydata> queryParam = {"should_delete_clips": shouldDeleteClips};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a project
    #
    # + projectId - The ID of the project. 
    # + return - The project was edited. 
    remote isolated function editProjectAlt1(decimal projectId, Body25 payload) returns Project|error {
        string  path = string `/me/projects/${projectId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->patch(path, request, targetType=Project);
        return response;
    }
    # Get all the videos in a project
    #
    # + projectId - The ID of the project. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getProjectVideosAlt1(decimal projectId, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/me/projects/${projectId}/videos`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Add a list of videos to a project
    #
    # + projectId - The ID of the project. 
    # + uris - A comma-separated list of video URIs to add. 
    # + return - The videos were added. 
    remote isolated function addVideosToProjectAlt1(decimal projectId, string uris) returns http:Response|error {
        string  path = string `/me/projects/${projectId}/videos`;
        map<anydata> queryParam = {"uris": uris};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a list of videos from a project
    #
    # + projectId - The ID of the project. 
    # + uris - A comma-separated list of the video URIs to remove. 
    # + shouldDeleteClips - Whether to delete the videos when removing them from the project. 
    # + return - The videos were removed. 
    remote isolated function removeVideosFromProjectAlt1(decimal projectId, string uris, boolean? shouldDeleteClips = ()) returns http:Response|error {
        string  path = string `/me/projects/${projectId}/videos`;
        map<anydata> queryParam = {"should_delete_clips": shouldDeleteClips, "uris": uris};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Add a specific video to a project
    #
    # + projectId - The ID of the project. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToProjectAlt1(decimal projectId, decimal videoId) returns http:Response|error {
        string  path = string `/me/projects/${projectId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a specific video from a project
    #
    # + projectId - The ID of the project. 
    # + videoId - The ID of the video. 
    # + return - The video was removed. 
    remote isolated function removeVideoFromProjectAlt1(decimal projectId, decimal videoId) returns http:Response|error {
        string  path = string `/me/projects/${projectId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the videos that a user has uploaded
    #
    # + containingUri - The page that contains the video URI. Only available when not paired with `query`. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + filterPlayable - Whether to filter by all playable videos or by all videos that are not  playable. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getVideosAlt1(string? containingUri = (), string? direction = (), string? filter = (), boolean? filterEmbeddable = (), boolean? filterPlayable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/me/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "filter_playable": filterPlayable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Upload a video
    #
    # + return - The upload procedure has begun. 
    remote isolated function uploadVideoAlt1(Body26 payload) returns Video|error {
        string  path = string `/me/videos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Video response = check self.clientEp->post(path, request, targetType=Video);
        return response;
    }
    # Check if a user owns a video
    #
    # + videoId - The ID of the video. 
    # + return - The user owns the video. 
    remote isolated function checkIfUserOwnsVideoAlt1(decimal videoId) returns Video|error {
        string  path = string `/me/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Get all the videos that a user has watched
    #
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The videos were returned. 
    remote isolated function getWatchHistory(decimal? page = (), decimal? perPage = ()) returns Video[]|error {
        string  path = string `/me/watched/videos`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Delete a user's watch history
    #
    # + return - The watch history was deleted. 
    remote isolated function deleteWatchHistory() returns http:Response|error {
        string  path = string `/me/watched/videos`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Delete a specific video from a user's watch history
    #
    # + videoId - The ID of the video. 
    # + return - The video was deleted from your watch history. 
    remote isolated function deleteFromWatchHistory(decimal videoId) returns http:Response|error {
        string  path = string `/me/watched/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the videos in a user's Watch Later queue
    #
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getWatchLaterQueueAlt1(string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/me/watchlater`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Check if a user has added a specific video to their Watch Later queue
    #
    # + videoId - The ID of the video. 
    # + return - The video appears in the user's Watch Later queue. 
    remote isolated function checkWatchLaterQueueAlt1(decimal videoId) returns Video|error {
        string  path = string `/me/watchlater/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a video to a user's Watch Later queue
    #
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToWatchLaterAlt1(decimal videoId) returns http:Response|error {
        string  path = string `/me/watchlater/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a video from a user's Watch Later queue
    #
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideoFromWatchLaterAlt1(decimal videoId) returns http:Response|error {
        string  path = string `/me/watchlater/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Exchange an authorization code for an access token
    #
    # + return - The authorization code was exchanged. 
    remote isolated function exchangeAuthCode(Body27 payload) returns Auth|error {
        string  path = string `/oauth/access_token`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Auth response = check self.clientEp->post(path, request, targetType=Auth);
        return response;
    }
    # Authorize a client with OAuth
    #
    # + return - The authorization was successful. 
    remote isolated function clientAuth(Body28 payload) returns Auth|error {
        string  path = string `/oauth/authorize/client`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Auth response = check self.clientEp->post(path, request, targetType=Auth);
        return response;
    }
    # Convert OAuth 1 access tokens to OAuth 2 access tokens
    #
    # + return - The tokens were converted. 
    remote isolated function convertAccessToken(Body29 payload) returns Auth|error {
        string  path = string `/oauth/authorize/vimeo_oauth1`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Auth response = check self.clientEp->post(path, request, targetType=Auth);
        return response;
    }
    # Verify an OAuth 2 token
    #
    # + return - The token was verified. 
    remote isolated function verifyToken() returns Auth|error {
        string  path = string `/oauth/verify`;
        Auth response = check self.clientEp-> get(path, targetType = Auth);
        return response;
    }
    # Get all On Demand genres
    #
    # + return - The On Demand genres were returned. 
    remote isolated function getVodGenres() returns OnDemandGenre[]|error {
        string  path = string `/ondemand/genres`;
        OnDemandGenre[] response = check self.clientEp-> get(path, targetType = OnDemandGenreArr);
        return response;
    }
    # Get a specific On Demand genre
    #
    # + genreId - The ID of the genre. 
    # + return - The On Demand genre was returned. 
    remote isolated function getVodGenre(string genreId) returns OnDemandGenre|error {
        string  path = string `/ondemand/genres/${genreId}`;
        OnDemandGenre response = check self.clientEp-> get(path, targetType = OnDemandGenre);
        return response;
    }
    # Get all the On Demand pages in a genre
    #
    # + genreId - The ID of the genre. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The On Demand pages were returned. 
    remote isolated function getGenreVods(string genreId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns OnDemandPage[]|error {
        string  path = string `/ondemand/genres/${genreId}/pages`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandPage[] response = check self.clientEp-> get(path, targetType = OnDemandPageArr);
        return response;
    }
    # Get a specific On Demand page in a genre
    #
    # + genreId - The ID of the genre. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand page belongs to the genre. 
    remote isolated function getGenreVod(string genreId, decimal ondemandId) returns OnDemandPage|error {
        string  path = string `/ondemand/genres/${genreId}/pages/${ondemandId}`;
        OnDemandPage response = check self.clientEp-> get(path, targetType = OnDemandPage);
        return response;
    }
    # Get a specific On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand page was returned. 
    remote isolated function getVod(decimal ondemandId) returns OnDemandPage|error {
        string  path = string `/ondemand/pages/${ondemandId}`;
        OnDemandPage response = check self.clientEp-> get(path, targetType = OnDemandPage);
        return response;
    }
    # Delete a draft of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The page draft was deleted. 
    remote isolated function deleteVodDraft(decimal ondemandId) returns http:Response|error {
        string  path = string `/ondemand/pages/${ondemandId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand page was edited. 
    remote isolated function editVod(decimal ondemandId, Body30 payload) returns OnDemandPage|error {
        string  path = string `/ondemand/pages/${ondemandId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandPage response = check self.clientEp->patch(path, request, targetType=OnDemandPage);
        return response;
    }
    # Get all the backgrounds of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The background images were returned. 
    remote isolated function getVodBackgrounds(decimal ondemandId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/backgrounds`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a background to an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The background was created. 
    remote isolated function createVodBackground(decimal ondemandId) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/backgrounds`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific background of an On Demand page
    #
    # + backgroundId - The ID of the background. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The background image was returned. 
    remote isolated function getVodBackground(decimal backgroundId, decimal ondemandId) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/backgrounds/${backgroundId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Remove a background from an On Demand page
    #
    # + backgroundId - The ID of the background. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The background image was deleted. 
    remote isolated function deleteVodBackground(decimal backgroundId, decimal ondemandId) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/backgrounds/${backgroundId}`;
        Picture response = check self.clientEp-> delete(path, targetType = Picture);
        return response;
    }
    # Edit a background of an On Demand page
    #
    # + backgroundId - The ID of the background. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The background was edited. 
    remote isolated function editVodBackground(decimal backgroundId, decimal ondemandId, Body31 payload) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/backgrounds/${backgroundId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Get all the genres of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The genres were returned. 
    remote isolated function getVodGenresByOndemandId(decimal ondemandId) returns OnDemandGenre[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/genres`;
        OnDemandGenre[] response = check self.clientEp-> get(path, targetType = OnDemandGenreArr);
        return response;
    }
    # Check whether an On Demand page belongs to a genre
    #
    # + genreId - The ID of the genre. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand page's genre was returned. 
    remote isolated function getVodGenreByOndemandId(string genreId, decimal ondemandId) returns OnDemandGenre|error {
        string  path = string `/ondemand/pages/${ondemandId}/genres/${genreId}`;
        OnDemandGenre response = check self.clientEp-> get(path, targetType = OnDemandGenre);
        return response;
    }
    # Add a genre to an On Demand page
    #
    # + genreId - The ID of the genre. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The genre was added. 
    remote isolated function addVodGenre(string genreId, decimal ondemandId) returns OnDemandGenre|error {
        string  path = string `/ondemand/pages/${ondemandId}/genres/${genreId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        OnDemandGenre response = check self.clientEp-> put(path, request, targetType = OnDemandGenre);
        return response;
    }
    # Remove a genre from an On Demand page
    #
    # + genreId - The ID of the genre. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand genre was deleted. 
    remote isolated function deleteVodGenre(string genreId, decimal ondemandId) returns http:Response|error {
        string  path = string `/ondemand/pages/${ondemandId}/genres/${genreId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the users who have liked a video on an On Demand page
    #
    # + ondemandId - The ID of the On Demand page. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The users were returned. 
    remote isolated function getVodLikes(decimal ondemandId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns User[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/likes`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the posters of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The posters were returned. 
    remote isolated function getVodPosters(decimal ondemandId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/pictures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a poster to an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The poster was added. 
    remote isolated function addVodPoster(decimal ondemandId) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/pictures`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific poster of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + posterId - The ID of the picture. 
    # + return - The poster was returned. 
    remote isolated function getVodPoster(decimal ondemandId, decimal posterId) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/pictures/${posterId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Edit a poster of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + posterId - The ID of the picture. 
    # + return - The poster was edited. 
    remote isolated function editVodPoster(decimal ondemandId, decimal posterId, Body32 payload) returns Picture|error {
        string  path = string `/ondemand/pages/${ondemandId}/pictures/${posterId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Get all the promotions on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + filter - The filter to apply to the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The promotions were returned. 
    remote isolated function getVodPromotions(decimal ondemandId, string filter, decimal? page = (), decimal? perPage = ()) returns OnDemandPromotion|error {
        string  path = string `/ondemand/pages/${ondemandId}/promotions`;
        map<anydata> queryParam = {"filter": filter, "page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandPromotion response = check self.clientEp-> get(path, targetType = OnDemandPromotion);
        return response;
    }
    # Add a promotion to an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The promotion was added. 
    remote isolated function createVodPromotion(decimal ondemandId, Body33 payload) returns OnDemandPromotion|error {
        string  path = string `/ondemand/pages/${ondemandId}/promotions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandPromotion response = check self.clientEp->post(path, request, targetType=OnDemandPromotion);
        return response;
    }
    # Get a specific promotion on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + promotionId - The ID of the promotion. 
    # + return - The promotion was returned. 
    remote isolated function getVodPromotion(decimal ondemandId, decimal promotionId) returns OnDemandPromotion|error {
        string  path = string `/ondemand/pages/${ondemandId}/promotions/${promotionId}`;
        OnDemandPromotion response = check self.clientEp-> get(path, targetType = OnDemandPromotion);
        return response;
    }
    # Remove a promotion from an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + promotionId - The ID of the promotion. 
    # + return - The promotion was deleted. 
    remote isolated function deleteVodPromotion(decimal ondemandId, decimal promotionId) returns http:Response|error {
        string  path = string `/ondemand/pages/${ondemandId}/promotions/${promotionId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the codes of a promotion on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + promotionId - The ID of the promotion. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The codes were returned. 
    remote isolated function getVodPromotionCodes(decimal ondemandId, decimal promotionId, decimal? page = (), decimal? perPage = ()) returns OnDemandPromotionCode|error {
        string  path = string `/ondemand/pages/${ondemandId}/promotions/${promotionId}/codes`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandPromotionCode response = check self.clientEp-> get(path, targetType = OnDemandPromotionCode);
        return response;
    }
    # Get all the regions of an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The regions were returned. 
    remote isolated function getVodRegions(decimal ondemandId) returns OnDemandRegion[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/regions`;
        OnDemandRegion[] response = check self.clientEp-> get(path, targetType = OnDemandRegionArr);
        return response;
    }
    # Add a list of regions to an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The list of regions was set. 
    remote isolated function setVodRegions(decimal ondemandId, Body34 payload) returns OnDemandRegion|error {
        string  path = string `/ondemand/pages/${ondemandId}/regions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandRegion response = check self.clientEp->put(path, request, targetType=OnDemandRegion);
        return response;
    }
    # Remove a list of regions from an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand regions were deleted. 
    remote isolated function deleteVodRegions(decimal ondemandId, Body35 payload) returns OnDemandRegion[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/regions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandRegion[] response = check self.clientEp->delete(path, request, targetType=OnDemandRegionArr);
        return response;
    }
    # Get a specific region of an On Demand page
    #
    # + country - The country code. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand page's region was returned. 
    remote isolated function getVodRegion(string country, decimal ondemandId) returns OnDemandRegion|error {
        string  path = string `/ondemand/pages/${ondemandId}/regions/${country}`;
        OnDemandRegion response = check self.clientEp-> get(path, targetType = OnDemandRegion);
        return response;
    }
    # Add a specific region to an On Demand page
    #
    # + country - The country code. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The region was added. 
    remote isolated function addVodRegion(string country, decimal ondemandId) returns OnDemandRegion|error {
        string  path = string `/ondemand/pages/${ondemandId}/regions/${country}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        OnDemandRegion response = check self.clientEp-> put(path, request, targetType = OnDemandRegion);
        return response;
    }
    # Remove a specific region from an On Demand page
    #
    # + country - The country code. 
    # + ondemandId - The ID of the On Demand. 
    # + return - The On Demand region was deleted. 
    remote isolated function deleteVodRegion(string country, decimal ondemandId) returns http:Response|error {
        string  path = string `/ondemand/pages/${ondemandId}/regions/${country}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the seasons on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The seasons were returned. 
    remote isolated function getVodSeasons(decimal ondemandId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns OnDemandSeason[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/seasons`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandSeason[] response = check self.clientEp-> get(path, targetType = OnDemandSeasonArr);
        return response;
    }
    # Get a specific season on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + seasonId - The ID of the season. 
    # + return - The season was returned. 
    remote isolated function getVodSeason(decimal ondemandId, decimal seasonId) returns OnDemandSeason|error {
        string  path = string `/ondemand/pages/${ondemandId}/seasons/${seasonId}`;
        OnDemandSeason response = check self.clientEp-> get(path, targetType = OnDemandSeason);
        return response;
    }
    # Get all the videos in a season on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + seasonId - The ID of the season. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getVodSeasonVideos(decimal ondemandId, decimal seasonId, string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/seasons/${seasonId}/videos`;
        map<anydata> queryParam = {"filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get all the videos on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - * The videos were returned. * The videos were returned. 
    remote isolated function getVodVideos(decimal ondemandId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/ondemand/pages/${ondemandId}/videos`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get a specific video on an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + videoId - The ID of the video. 
    # + return - The video is on the On Demand page. 
    remote isolated function getVodVideo(decimal ondemandId, decimal videoId) returns Video|error {
        string  path = string `/ondemand/pages/${ondemandId}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a video to an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToVod(decimal ondemandId, decimal videoId, Body36 payload) returns OnDemandVideo|error {
        string  path = string `/ondemand/pages/${ondemandId}/videos/${videoId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandVideo response = check self.clientEp->put(path, request, targetType=OnDemandVideo);
        return response;
    }
    # Remove a video from an On Demand page
    #
    # + ondemandId - The ID of the On Demand. 
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideoFromVod(decimal ondemandId, decimal videoId) returns http:Response|error {
        string  path = string `/ondemand/pages/${ondemandId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the On Demand regions
    #
    # + return - The On Demand regions were returned. 
    remote isolated function getRegions() returns OnDemandRegion[]|error {
        string  path = string `/ondemand/regions`;
        OnDemandRegion[] response = check self.clientEp-> get(path, targetType = OnDemandRegionArr);
        return response;
    }
    # Get a specific On Demand region
    #
    # + country - The country code. 
    # + return - The On Demand region was returned. 
    remote isolated function getRegion(string country) returns OnDemandRegion|error {
        string  path = string `/ondemand/regions/${country}`;
        OnDemandRegion response = check self.clientEp-> get(path, targetType = OnDemandRegion);
        return response;
    }
    # Get a specific tag
    #
    # + word - The tag to return. 
    # + return - The tag was returned. 
    remote isolated function getTag(string word) returns Tag|error {
        string  path = string `/tags/${word}`;
        Tag response = check self.clientEp-> get(path, targetType = Tag);
        return response;
    }
    # Get all the videos with a specific tag
    #
    # + word - The tag word. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getVideosWithTag(string word, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/tags/${word}/videos`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Revoke the current access token
    #
    # + return - The token was revoked. 
    remote isolated function deleteToken() returns Auth|error {
        string  path = string `/tokens`;
        Auth response = check self.clientEp-> delete(path, targetType = Auth);
        return response;
    }
    # Search for users
    #
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The search results were returned. 
    remote isolated function searchUsers(string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/users`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get a user
    #
    # + userId - The ID of the user. 
    # + return - The user was returned. 
    remote isolated function getUser(decimal userId) returns User|error {
        string  path = string `/users/${userId}`;
        User response = check self.clientEp-> get(path, targetType = User);
        return response;
    }
    # Edit a user
    #
    # + userId - The ID of the user. 
    # + return - The user was edited. 
    remote isolated function editUser(decimal userId, Body37 payload) returns User|error {
        string  path = string `/users/${userId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        User response = check self.clientEp->patch(path, request, targetType=User);
        return response;
    }
    # Get all the albums that belong to a user
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The albums were returned. 
    remote isolated function getAlbums(decimal userId, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Album[]|error {
        string  path = string `/users/${userId}/albums`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Album[] response = check self.clientEp-> get(path, targetType = AlbumArr);
        return response;
    }
    # Create an album
    #
    # + userId - The ID of the user. 
    # + return - The album was created. 
    remote isolated function createAlbum(decimal userId, Body38 payload) returns Album|error {
        string  path = string `/users/${userId}/albums`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Album response = check self.clientEp->post(path, request, targetType=Album);
        return response;
    }
    # Get a specific album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + return - The album was returned. 
    remote isolated function getAlbum(decimal albumId, decimal userId) returns Album|error {
        string  path = string `/users/${userId}/albums/${albumId}`;
        Album response = check self.clientEp-> get(path, targetType = Album);
        return response;
    }
    # Delete an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + return - The album was deleted. 
    remote isolated function deleteAlbum(decimal albumId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/albums/${albumId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + return - The album was edited. 
    remote isolated function editAlbum(decimal albumId, decimal userId, Body39 payload) returns Album|error {
        string  path = string `/users/${userId}/albums/${albumId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Album response = check self.clientEp->patch(path, request, targetType=Album);
        return response;
    }
    # Get all the custom upload thumbnails of an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The custom uploaded thumbnails were returned. 
    remote isolated function getAlbumCustomThumbs(decimal albumId, decimal userId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/users/${userId}/albums/${albumId}/custom_thumbnails`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a custom uploaded thumbnail
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + return - The custom thumbnail was added to the album. 
    remote isolated function createAlbumCustomThumb(decimal albumId, decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/albums/${albumId}/custom_thumbnails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific custom uploaded album thumbnail
    #
    # + albumId - The ID of the album. 
    # + thumbnailId - The ID of the custom thumbnail. 
    # + userId - The ID of the user. 
    # + return - The custom thumbnail was returned. 
    remote isolated function getAlbumCustomThumbnail(decimal albumId, decimal thumbnailId, decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/albums/${albumId}/custom_thumbnails/${thumbnailId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Remove a custom uploaded album thumbnail
    #
    # + albumId - The ID of the album. 
    # + thumbnailId - The ID of the custom thumbnail. 
    # + userId - The ID of the user. 
    # + return - The custom thumbnail was removed. 
    remote isolated function deleteAlbumCustomThumbnail(decimal albumId, decimal thumbnailId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/albums/${albumId}/custom_thumbnails/${thumbnailId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Replace a custom uploaded album thumbnail
    #
    # + albumId - The ID of the album. 
    # + thumbnailId - The ID of the custom thumbnail. 
    # + userId - The ID of the user. 
    # + return - The custom thumbnail was replaced. 
    remote isolated function replaceAlbumCustomThumb(decimal albumId, decimal thumbnailId, decimal userId, Body40 payload) returns Picture|error {
        string  path = string `/users/${userId}/albums/${albumId}/custom_thumbnails/${thumbnailId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Get all the custom logos of an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The custom logos were returned. 
    remote isolated function getAlbumLogos(decimal albumId, decimal userId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/users/${userId}/albums/${albumId}/logos`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a custom album logo
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + return - The logo was added to the album. 
    remote isolated function createAlbumLogo(decimal albumId, decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/albums/${albumId}/logos`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific custom album logo
    #
    # + albumId - The ID of the album. 
    # + logoId - The ID of the custom logo. 
    # + userId - The ID of the user. 
    # + return - The custom logo was returned. 
    remote isolated function getAlbumLogo(decimal albumId, decimal logoId, decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/albums/${albumId}/logos/${logoId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Remove a custom album logo
    #
    # + albumId - The ID of the album. 
    # + logoId - The ID of the custom logo. 
    # + userId - The ID of the user. 
    # + return - The custom logo was removed. 
    remote isolated function deleteAlbumLogo(decimal albumId, decimal logoId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/albums/${albumId}/logos/${logoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Replace a custom album logo
    #
    # + albumId - The ID of the album. 
    # + logoId - The ID of the custom logo. 
    # + userId - The ID of the user. 
    # + return - The custom logo was replaced. 
    remote isolated function replaceAlbumLogo(decimal albumId, decimal logoId, decimal userId, Body41 payload) returns Picture|error {
        string  path = string `/users/${userId}/albums/${albumId}/logos/${logoId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Get all the videos in an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + containingUri - The page containing the video URI. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + password - The password of the album. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + weakSearch - Whether to include private videos in the search. Please note that a separate search service provides this functionality. The service performs a partial text search on the video's name. 
    # + return - The videos were returned. 
    remote isolated function getAlbumVideos(decimal albumId, decimal userId, string? containingUri = (), string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), string? password = (), decimal? perPage = (), string? query = (), string? sort = (), boolean? weakSearch = ()) returns Video[]|error {
        string  path = string `/users/${userId}/albums/${albumId}/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "password": password, "per_page": perPage, "query": query, "sort": sort, "weak_search": weakSearch};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Replace all the videos in an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + return - The videos were added. 
    remote isolated function replaceVideosInAlbum(decimal albumId, decimal userId, Body42 payload) returns http:Response|error {
        string  path = string `/users/${userId}/albums/${albumId}/videos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->put(path, request, targetType=http:Response);
        return response;
    }
    # Get a specific video in an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + password - The password of the album. 
    # + return - The video was returned. 
    remote isolated function getAlbumVideo(decimal albumId, decimal userId, decimal videoId, string? password = ()) returns Video|error {
        string  path = string `/users/${userId}/albums/${albumId}/videos/${videoId}`;
        map<anydata> queryParam = {"password": password};
        path = path + check getPathForQueryParam(queryParam);
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a specific video to an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToAlbum(decimal albumId, decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/albums/${albumId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a video from an album
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was removed. 
    remote isolated function removeVideoFromAlbum(decimal albumId, decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/albums/${albumId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Set a video as the album thumbnail
    #
    # + albumId - The ID of the album. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The album was updated with a new thumbnail. 
    remote isolated function setVideoAsAlbumThumbnail(decimal albumId, decimal userId, decimal videoId, Body43 payload) returns Album|error {
        string  path = string `/users/${userId}/albums/${albumId}/videos/${videoId}/set_album_thumbnail`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Album response = check self.clientEp->post(path, request, targetType=Album);
        return response;
    }
    # Get all the videos in which a user appears
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getAppearances(decimal userId, string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/users/${userId}/appearances`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get all the categories that a user follows
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The categories were returned. 
    remote isolated function getCategorySubscriptions(decimal userId, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Category[]|error {
        string  path = string `/users/${userId}/categories`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Check if a user follows a category
    #
    # + category - The name of the category. 
    # + userId - The ID of the user. 
    # + return - The user is following the category. 
    remote isolated function checkIfUserSubscribedToCategory(string category, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/categories/${category}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Subscribe a user to a single category
    #
    # + category - The name of the category. 
    # + userId - The ID of the user. 
    # + return - The user was subscribed. 
    remote isolated function subscribeToCategory(decimal category, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/categories/${category}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Unsubscribe a user from a category
    #
    # + category - The name of the category. 
    # + userId - The ID of the user. 
    # + return - The user was unsubscribed. 
    remote isolated function unsubscribeFromCategory(string category, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/categories/${category}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the channels to which a user subscribes
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The channels were returned. 
    remote isolated function getChannelSubscriptions(decimal userId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Channel[]|error {
        string  path = string `/users/${userId}/channels`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Channel[] response = check self.clientEp-> get(path, targetType = ChannelArr);
        return response;
    }
    # Check if a user follows a channel
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The user follows the channel. 
    remote isolated function checkIfUserSubscribedToChannel(decimal channelId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/channels/${channelId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Subscribe a user to a specific channel
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The user is now a follower of the channel. 
    remote isolated function subscribeToChannel(decimal channelId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/channels/${channelId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Unsubscribe a user from a specific channel
    #
    # + channelId - The ID of the channel. 
    # + userId - The ID of the user. 
    # + return - The user is no longer a follower of the channel. 
    remote isolated function unsubscribeFromChannel(decimal channelId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/channels/${channelId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the custom logos that belong to a user
    #
    # + userId - The ID of the user. 
    # + return - The custom logos were returned. 
    remote isolated function getCustomLogos(decimal userId) returns Picture[]|error {
        string  path = string `/users/${userId}/customlogos`;
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a custom logo
    #
    # + userId - The ID of the user. 
    # + return - The custom logo was created. 
    remote isolated function createCustomLogo(decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/customlogos`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific custom logo
    #
    # + logoId - The ID of the custom logo. 
    # + userId - The ID of the user. 
    # + return - The custom logo was returned. 
    remote isolated function getCustomLogo(decimal logoId, decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/customlogos/${logoId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Get all videos in a user's feed
    #
    # + userId - The ID of the user. 
    # + offset - Necessary for proper pagination. You shouldn't provide this value yourself, and instead use the pagination links in the feed response. Please see our [pagination documentation](https://developer.vimeo.com/api/common-formats#using-the-pagination-parameter) for more information. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + 'type - The feed type. 
    # + return - The videos were returned. 
    remote isolated function getFeed(decimal userId, string? offset = (), decimal? page = (), decimal? perPage = (), string? 'type = ()) returns Activity31[]|error {
        string  path = string `/users/${userId}/feed`;
        map<anydata> queryParam = {"offset": offset, "page": page, "per_page": perPage, "type": 'type};
        path = path + check getPathForQueryParam(queryParam);
        Activity31[] response = check self.clientEp-> get(path, targetType = Activity31Arr);
        return response;
    }
    # Get all the followers of a user
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The user's followers were returned. 
    remote isolated function getFollowers(decimal userId, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/users/${userId}/followers`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the users that a user is following
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The followed users were returned. 
    remote isolated function getUserFollowing(decimal userId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns User[]|error {
        string  path = string `/users/${userId}/following`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Follow a list of users
    #
    # + userId - The ID of the user. 
    # + return - The users were followed. 
    remote isolated function followUsers(decimal userId, Body44 payload) returns http:Response|error {
        string  path = string `/users/${userId}/following`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        http:Response response = check self.clientEp->post(path, request, targetType=http:Response);
        return response;
    }
    # Check if a user is following another user
    #
    # + followUserId - The ID of the following user. 
    # + userId - The ID of the user. 
    # + return - The authenticated user follows the user in question. 
    remote isolated function checkIfUserIsFollowing(decimal followUserId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/following/${followUserId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Follow a specific user
    #
    # + followUserId - The ID of the following user. 
    # + userId - The ID of the user. 
    # + return - The user was followed. 
    remote isolated function followUser(decimal followUserId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/following/${followUserId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Unfollow a user
    #
    # + followUserId - The ID of the following user. 
    # + userId - The ID of the user. 
    # + return - The user was unfollowed. 
    remote isolated function unfollowUser(decimal followUserId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/following/${followUserId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the groups that a user has joined
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The groups were returned. 
    remote isolated function getUserGroups(decimal userId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Group[]|error {
        string  path = string `/users/${userId}/groups`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Group[] response = check self.clientEp-> get(path, targetType = GroupArr);
        return response;
    }
    # Check if a user has joined a group
    #
    # + groupId - The ID of the group. 
    # + userId - The ID of the user. 
    # + return - The user has joined the group. 
    remote isolated function checkIfUserJoinedGroup(decimal groupId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/groups/${groupId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Add a user to a group
    #
    # + groupId - The ID of the group. 
    # + userId - The ID of the user. 
    # + return - The user joined the group. 
    remote isolated function joinGroup(decimal groupId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/groups/${groupId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a user from a group
    #
    # + groupId - The ID of the group. 
    # + userId - The ID of the user. 
    # + return - The user left the group. 
    remote isolated function leaveGroup(decimal groupId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/groups/${groupId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the videos that a user has liked
    #
    # + userId - The ID of the user. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getLikes(decimal userId, string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/users/${userId}/likes`;
        map<anydata> queryParam = {"filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Check if a user has liked a video
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The user has liked the video. 
    remote isolated function checkIfUserLikedVideo(decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/likes/${videoId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Cause a user to like a video
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was liked. 
    remote isolated function likeVideo(decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/likes/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Cause a user to unlike a video
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was unliked. 
    remote isolated function unlikeVideo(decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/likes/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the On Demand pages of a user
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + filter - The type of On Demand pages to return. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The On Demand pages were returned. 
    remote isolated function getUserVods(decimal userId, string? direction = (), string? filter = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns OnDemandPage[]|error {
        string  path = string `/users/${userId}/ondemand/pages`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        OnDemandPage[] response = check self.clientEp-> get(path, targetType = OnDemandPageArr);
        return response;
    }
    # Create an On Demand page
    #
    # + userId - The ID of the user. 
    # + return - The On Demand page was created. 
    remote isolated function createVod(decimal userId, Body45 payload) returns OnDemandPage|error {
        string  path = string `/users/${userId}/ondemand/pages`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        OnDemandPage response = check self.clientEp->post(path, request, targetType=OnDemandPage);
        return response;
    }
    # Check if a user has made a purchase or rental from an On Demand page
    #
    # + userId - The ID of the user. 
    # + return - You have purchased the On Demand page. 
    remote isolated function checkIfVodWasPurchased(decimal userId) returns OnDemandPage|error {
        string  path = string `/users/${userId}/ondemand/purchases`;
        OnDemandPage response = check self.clientEp-> get(path, targetType = OnDemandPage);
        return response;
    }
    # Get all the pictures that belong to a user
    #
    # + userId - The ID of the user. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The pictures were returned. 
    remote isolated function getPictures(decimal userId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/users/${userId}/pictures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a user picture
    #
    # + userId - The ID of the user. 
    # + return - The user picture was created. 
    remote isolated function createPicture(decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/pictures`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a specific user picture
    #
    # + portraitsetId - The ID of the picture. 
    # + userId - The ID of the user. 
    # + return - The picture was returned. 
    remote isolated function getPicture(decimal portraitsetId, decimal userId) returns Picture|error {
        string  path = string `/users/${userId}/pictures/${portraitsetId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Delete a user picture
    #
    # + portraitsetId - The ID of the picture. 
    # + userId - The ID of the user. 
    # + return - The picture was deleted. 
    remote isolated function deletePicture(decimal portraitsetId, decimal userId) returns http:Response|error {
        string  path = string `/users/${userId}/pictures/${portraitsetId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a user picture
    #
    # + portraitsetId - The ID of the picture. 
    # + userId - The ID of the user. 
    # + return - The picture was edited. 
    remote isolated function editPicture(decimal portraitsetId, decimal userId, Body46 payload) returns Picture|error {
        string  path = string `/users/${userId}/pictures/${portraitsetId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Get all the portfolios that belong to a user
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The portfolios were returned. 
    remote isolated function getPortfolios(decimal userId, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Portfolio[]|error {
        string  path = string `/users/${userId}/portfolios`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Portfolio[] response = check self.clientEp-> get(path, targetType = PortfolioArr);
        return response;
    }
    # Get a specific portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + userId - The ID of the user. 
    # + return - The portfolio was returned. 
    remote isolated function getPortfolio(decimal portfolioId, decimal userId) returns Portfolio|error {
        string  path = string `/users/${userId}/portfolios/${portfolioId}`;
        Portfolio response = check self.clientEp-> get(path, targetType = Portfolio);
        return response;
    }
    # Get all the videos in a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + userId - The ID of the user. 
    # + containingUri - The page that contains the video URI. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. Option descriptions:  * `default` - This will sort to the default sort set on the portfolio. 
    # + return - The videos were returned. 
    remote isolated function getPortfolioVideos(decimal portfolioId, decimal userId, string? containingUri = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/users/${userId}/portfolios/${portfolioId}/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get a specific video in a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was returned. 
    remote isolated function getPortfolioVideo(decimal portfolioId, decimal userId, decimal videoId) returns Video|error {
        string  path = string `/users/${userId}/portfolios/${portfolioId}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a video to a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToPortfolio(decimal portfolioId, decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/portfolios/${portfolioId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a video from a portfolio
    #
    # + portfolioId - The ID of the portfolio. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideoFromPortfolio(decimal portfolioId, decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/portfolios/${portfolioId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the embed presets that a user has created
    #
    # + userId - The ID of the user. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The embed presets were returned. 
    remote isolated function getEmbedPresets(decimal userId, decimal? page = (), decimal? perPage = ()) returns Presets[]|error {
        string  path = string `/users/${userId}/presets`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Presets[] response = check self.clientEp-> get(path, targetType = PresetsArr);
        return response;
    }
    # Get a specific embed preset
    #
    # + presetId - The ID of the preset. 
    # + userId - The ID of the user. 
    # + return - The embed preset was returned. 
    remote isolated function getEmbedPreset(decimal presetId, decimal userId) returns Presets|error {
        string  path = string `/users/${userId}/presets/${presetId}`;
        Presets response = check self.clientEp-> get(path, targetType = Presets);
        return response;
    }
    # Edit an embed preset
    #
    # + presetId - The ID of the preset. 
    # + userId - The ID of the user. 
    # + return - The embed preset was edited. 
    remote isolated function editEmbedPreset(decimal presetId, decimal userId, Body47 payload) returns Presets|error {
        string  path = string `/users/${userId}/presets/${presetId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Presets response = check self.clientEp->patch(path, request, targetType=Presets);
        return response;
    }
    # Get all the videos that have been added to an embed preset
    #
    # + presetId - The ID of the preset. 
    # + userId - The ID of the user. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The videos were returned. 
    remote isolated function getEmbedPresetVideos(decimal presetId, decimal userId, decimal? page = (), decimal? perPage = ()) returns Video[]|error {
        string  path = string `/users/${userId}/presets/${presetId}/videos`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get all the projects that belong to a user
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The projects were returned. 
    remote isolated function getProjects(decimal userId, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Project[]|error {
        string  path = string `/users/${userId}/projects`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Project[] response = check self.clientEp-> get(path, targetType = ProjectArr);
        return response;
    }
    # Create a project
    #
    # + userId - The ID of the user. 
    # + return - The project was created. 
    remote isolated function createProject(decimal userId, Body48 payload) returns Project|error {
        string  path = string `/users/${userId}/projects`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->post(path, request, targetType=Project);
        return response;
    }
    # Get a specific project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + return - The project was returned. 
    remote isolated function getProject(decimal projectId, decimal userId) returns Project|error {
        string  path = string `/users/${userId}/projects/${projectId}`;
        Project response = check self.clientEp-> get(path, targetType = Project);
        return response;
    }
    # Delete a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + shouldDeleteClips - Whether to delete all the videos in the project along with the project itself. 
    # + return - The project was deleted. 
    remote isolated function deleteProject(decimal projectId, decimal userId, boolean? shouldDeleteClips = ()) returns http:Response|error {
        string  path = string `/users/${userId}/projects/${projectId}`;
        map<anydata> queryParam = {"should_delete_clips": shouldDeleteClips};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + return - The project was edited. 
    remote isolated function editProject(decimal projectId, decimal userId, Body49 payload) returns Project|error {
        string  path = string `/users/${userId}/projects/${projectId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Project response = check self.clientEp->patch(path, request, targetType=Project);
        return response;
    }
    # Get all the videos in a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getProjectVideos(decimal projectId, decimal userId, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns Video[]|error {
        string  path = string `/users/${userId}/projects/${projectId}/videos`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Add a list of videos to a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + uris - A comma-separated list of video URIs to add. 
    # + return - The videos were added. 
    remote isolated function addVideosToProject(decimal projectId, decimal userId, string uris) returns http:Response|error {
        string  path = string `/users/${userId}/projects/${projectId}/videos`;
        map<anydata> queryParam = {"uris": uris};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a list of videos from a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + uris - A comma-separated list of the video URIs to remove. 
    # + shouldDeleteClips - Whether to delete the videos when removing them from the project. 
    # + return - The videos were removed. 
    remote isolated function removeVideosFromProject(decimal projectId, decimal userId, string uris, boolean? shouldDeleteClips = ()) returns http:Response|error {
        string  path = string `/users/${userId}/projects/${projectId}/videos`;
        map<anydata> queryParam = {"should_delete_clips": shouldDeleteClips, "uris": uris};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Add a specific video to a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToProject(decimal projectId, decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/projects/${projectId}/videos/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a specific video from a project
    #
    # + projectId - The ID of the project. 
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was removed. 
    remote isolated function removeVideoFromProject(decimal projectId, decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/projects/${projectId}/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get a user's upload attempt
    #
    # + upload - The ID of the upload attempt. 
    # + userId - The ID of the user. 
    # + return - The upload attempt was returned. 
    remote isolated function getUploadAttempt(decimal upload, decimal userId) returns UploadAttempt|error {
        string  path = string `/users/${userId}/uploads/${upload}`;
        UploadAttempt response = check self.clientEp-> get(path, targetType = UploadAttempt);
        return response;
    }
    # Complete a user's streaming upload
    #
    # + upload - The ID of the upload attempt. 
    # + userId - The ID of the user. 
    # + signature - The crypto signature of the completed upload. 
    # + videoFileId - The ID of the uploaded file. 
    # + return - The streaming upload is complete. 
    remote isolated function completeStreamingUpload(decimal upload, decimal userId, string signature, decimal videoFileId) returns http:Response|error {
        string  path = string `/users/${userId}/uploads/${upload}`;
        map<anydata> queryParam = {"signature": signature, "video_file_id": videoFileId};
        path = path + check getPathForQueryParam(queryParam);
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the videos that a user has uploaded
    #
    # + userId - The ID of the user. 
    # + containingUri - The page that contains the video URI. Only available when not paired with `query`. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + filterPlayable - Whether to filter by all playable videos or by all videos that are not  playable. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getVideos(decimal userId, string? containingUri = (), string? direction = (), string? filter = (), boolean? filterEmbeddable = (), boolean? filterPlayable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/users/${userId}/videos`;
        map<anydata> queryParam = {"containing_uri": containingUri, "direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "filter_playable": filterPlayable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Upload a video
    #
    # + userId - The ID of the user. 
    # + return - The upload procedure has begun. 
    remote isolated function uploadVideo(decimal userId, Body50 payload) returns Video|error {
        string  path = string `/users/${userId}/videos`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Video response = check self.clientEp->post(path, request, targetType=Video);
        return response;
    }
    # Check if a user owns a video
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The user owns the video. 
    remote isolated function checkIfUserOwnsVideo(decimal userId, decimal videoId) returns Video|error {
        string  path = string `/users/${userId}/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Get all the videos in a user's Watch Later queue
    #
    # + userId - The ID of the user. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. 
    # + filterEmbeddable - Whether to filter the results by embeddable videos (`true`) or non-embeddable videos (`false`). Required only if **filter** is `embeddable`. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The videos were returned. 
    remote isolated function getWatchLaterQueue(decimal userId, string? direction = (), string? filter = (), boolean? filterEmbeddable = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Video[]|error {
        string  path = string `/users/${userId}/watchlater`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "filter_embeddable": filterEmbeddable, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Check if a user has added a specific video to their Watch Later queue
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video appears in the user's Watch Later queue. 
    remote isolated function checkWatchLaterQueue(decimal userId, decimal videoId) returns Video|error {
        string  path = string `/users/${userId}/watchlater/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Add a video to a user's Watch Later queue
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was added. 
    remote isolated function addVideoToWatchLater(decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/watchlater/${videoId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove a video from a user's Watch Later queue
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideoFromWatchLater(decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/users/${userId}/watchlater/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Search for videos
    #
    # + query - Search query. 
    # + direction - The sort direction of the results. 
    # + filter - The attribute by which to filter the results. `CC` and related filters target videos with the corresponding Creative Commons licenses. For more information, see our [Creative Commons](https://vimeo.com/creativecommons) page. 
    # + links - A comma-separated list of video URLs to find. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + uris - The comma-separated list of videos to find. 
    # + return - The search results were returned. 
    remote isolated function searchVideos(string query, string? direction = (), string? filter = (), string? links = (), decimal? page = (), decimal? perPage = (), string? sort = (), string? uris = ()) returns Video[]|error {
        string  path = string `/videos`;
        map<anydata> queryParam = {"direction": direction, "filter": filter, "links": links, "page": page, "per_page": perPage, "query": query, "sort": sort, "uris": uris};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
        return response;
    }
    # Get a specific video
    #
    # + videoId - The ID of the video. 
    # + return - The video was returned. 
    remote isolated function getVideo(decimal videoId) returns Video|error {
        string  path = string `/videos/${videoId}`;
        Video response = check self.clientEp-> get(path, targetType = Video);
        return response;
    }
    # Delete a video
    #
    # + videoId - The ID of the video. 
    # + return - The video was deleted. 
    remote isolated function deleteVideo(decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a video
    #
    # + videoId - The ID of the video. 
    # + return - The video was edited. 
    remote isolated function editVideo(decimal videoId, Body51 payload) returns Video|error {
        string  path = string `/videos/${videoId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Video response = check self.clientEp->patch(path, request, targetType=Video);
        return response;
    }
    # Get all the channels to which a user can add or remove a specific video
    #
    # + videoId - The ID of the video. 
    # + return - The channels were returned. 
    remote isolated function getAvailableVideoChannels(decimal videoId) returns Channel[]|error {
        string  path = string `/videos/${videoId}/available_channels`;
        Channel[] response = check self.clientEp-> get(path, targetType = ChannelArr);
        return response;
    }
    # Get all the categories to which a video belongs
    #
    # + videoId - The ID of the video. 
    # + return - The categories were returned. 
    remote isolated function getVideoCategories(decimal videoId) returns Category[]|error {
        string  path = string `/videos/${videoId}/categories`;
        Category[] response = check self.clientEp-> get(path, targetType = CategoryArr);
        return response;
    }
    # Suggest categories for a video
    #
    # + videoId - The ID of the video. 
    # + return - The categories were suggested. 
    remote isolated function suggestVideoCategory(decimal videoId, Body52 payload) returns Category|error {
        string  path = string `/videos/${videoId}/categories`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Category response = check self.clientEp->put(path, request, targetType=Category);
        return response;
    }
    # Get all the comments on a video
    #
    # + videoId - The ID of the video. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The comments were returned. 
    remote isolated function getComments(decimal videoId, string? direction = (), decimal? page = (), decimal? perPage = ()) returns Comment[]|error {
        string  path = string `/videos/${videoId}/comments`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Comment[] response = check self.clientEp-> get(path, targetType = CommentArr);
        return response;
    }
    # Add a comment to a video
    #
    # + videoId - The ID of the video. 
    # + return - The comment was added. 
    remote isolated function createComment(decimal videoId, Body53 payload) returns Comment|error {
        string  path = string `/videos/${videoId}/comments`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, targetType=Comment);
        return response;
    }
    # Get a specific video comment
    #
    # + commentId - The ID of the comment. 
    # + videoId - The ID of the video. 
    # + return - The comment was returned. 
    remote isolated function getComment(decimal commentId, decimal videoId) returns Comment|error {
        string  path = string `/videos/${videoId}/comments/${commentId}`;
        Comment response = check self.clientEp-> get(path, targetType = Comment);
        return response;
    }
    # Delete a video comment
    #
    # + commentId - The ID of the comment. 
    # + videoId - The ID of the video. 
    # + return - The comment was deleted. 
    remote isolated function deleteComment(decimal commentId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/comments/${commentId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a video comment
    #
    # + commentId - The ID of the comment. 
    # + videoId - The ID of the video. 
    # + return - The comment was edited. 
    remote isolated function editComment(decimal commentId, decimal videoId, Body54 payload) returns Comment|error {
        string  path = string `/videos/${videoId}/comments/${commentId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->patch(path, request, targetType=Comment);
        return response;
    }
    # Get all the replies to a video comment
    #
    # + commentId - The ID of the comment. 
    # + videoId - The ID of the video. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The replies were returned. 
    remote isolated function getCommentReplies(decimal commentId, decimal videoId, decimal? page = (), decimal? perPage = ()) returns Comment[]|error {
        string  path = string `/videos/${videoId}/comments/${commentId}/replies`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Comment[] response = check self.clientEp-> get(path, targetType = CommentArr);
        return response;
    }
    # Add a reply to a video comment
    #
    # + commentId - The ID of the comment. 
    # + videoId - The ID of the video. 
    # + return - The reply was added. 
    remote isolated function createCommentReply(decimal commentId, decimal videoId, Body55 payload) returns Comment|error {
        string  path = string `/videos/${videoId}/comments/${commentId}/replies`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Comment response = check self.clientEp->post(path, request, targetType=Comment);
        return response;
    }
    # Get all the credited users in a video
    #
    # + videoId - The ID of the video. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + query - The search query to use to filter the results. 
    # + sort - The way to sort the results. 
    # + return - The users were returned. 
    remote isolated function getVideoCredits(decimal videoId, string? direction = (), decimal? page = (), decimal? perPage = (), string? query = (), string? sort = ()) returns Credit[]|error {
        string  path = string `/videos/${videoId}/credits`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "query": query, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        Credit[] response = check self.clientEp-> get(path, targetType = CreditArr);
        return response;
    }
    # Credit a user in a video
    #
    # + videoId - The ID of the video. 
    # + return - The credit was added. 
    remote isolated function addVideoCredit(decimal videoId, Body56 payload) returns Credit|error {
        string  path = string `/videos/${videoId}/credits`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Credit response = check self.clientEp->post(path, request, targetType=Credit);
        return response;
    }
    # Get a specific credited user in a video
    #
    # + creditId - The ID of the credit. 
    # + videoId - The ID of the video. 
    # + return - The credit was returned. 
    remote isolated function getVideoCredit(decimal creditId, decimal videoId) returns Credit|error {
        string  path = string `/videos/${videoId}/credits/${creditId}`;
        Credit response = check self.clientEp-> get(path, targetType = Credit);
        return response;
    }
    # Delete a credit for a user in a video
    #
    # + creditId - The ID of the credit. 
    # + videoId - The ID of the video. 
    # + return - The credit was deleted. 
    remote isolated function deleteVideoCredit(decimal creditId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/credits/${creditId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a credit for a user in a video
    #
    # + creditId - The ID of the credit. 
    # + videoId - The ID of the video. 
    # + return - The credit was edited. 
    remote isolated function editVideoCredit(decimal creditId, decimal videoId, Body57 payload) returns Credit|error {
        string  path = string `/videos/${videoId}/credits/${creditId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Credit response = check self.clientEp->patch(path, request, targetType=Credit);
        return response;
    }
    # Get all the users who have liked a video
    #
    # + videoId - The ID of the video. 
    # + direction - The sort direction of the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + sort - The way to sort the results. 
    # + return - The users were returned. 
    remote isolated function getVideoLikes(decimal videoId, string? direction = (), decimal? page = (), decimal? perPage = (), string? sort = ()) returns User[]|error {
        string  path = string `/videos/${videoId}/likes`;
        map<anydata> queryParam = {"direction": direction, "page": page, "per_page": perPage, "sort": sort};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Get all the thumbnails of a video
    #
    # + videoId - The ID of the video. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The thumbnails were returned. 
    remote isolated function getVideoThumbnails(decimal videoId, decimal? page = (), decimal? perPage = ()) returns Picture[]|error {
        string  path = string `/videos/${videoId}/pictures`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Picture[] response = check self.clientEp-> get(path, targetType = PictureArr);
        return response;
    }
    # Add a video thumbnail
    #
    # + videoId - The ID of the video. 
    # + return - The thumbnail was created. 
    remote isolated function createVideoThumbnail(decimal videoId, Body58 payload) returns Picture|error {
        string  path = string `/videos/${videoId}/pictures`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->post(path, request, targetType=Picture);
        return response;
    }
    # Get a video thumbnail
    #
    # + pictureId - The ID of the picture. 
    # + videoId - The ID of the video. 
    # + return - The thumbnail was returned. 
    remote isolated function getVideoThumbnail(decimal pictureId, decimal videoId) returns Picture|error {
        string  path = string `/videos/${videoId}/pictures/${pictureId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Delete a video thumbnail
    #
    # + pictureId - The ID of the picture. 
    # + videoId - The ID of the video. 
    # + return - The thumbnail was deleted. 
    remote isolated function deleteVideoThumbnail(decimal pictureId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/pictures/${pictureId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a video thumbnail
    #
    # + pictureId - The ID of the picture. 
    # + videoId - The ID of the video. 
    # + return - The thumbnail was edited. 
    remote isolated function editVideoThumbnail(decimal pictureId, decimal videoId, Body59 payload) returns Picture|error {
        string  path = string `/videos/${videoId}/pictures/${pictureId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Picture response = check self.clientEp->patch(path, request, targetType=Picture);
        return response;
    }
    # Check if an embed preset has been added to a video
    #
    # + presetId - The ID of the preset. 
    # + videoId - The ID of the video. 
    # + return - The embed presets exists. 
    remote isolated function getVideoEmbedPreset(decimal presetId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/presets/${presetId}`;
        http:Response response = check self.clientEp-> get(path, targetType = http:Response);
        return response;
    }
    # Add an embed preset to a video
    #
    # + presetId - The ID of the preset. 
    # + videoId - The ID of the video. 
    # + return - The embed preset was assigned. 
    remote isolated function addVideoEmbedPreset(decimal presetId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/presets/${presetId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Remove an embed preset from a video
    #
    # + presetId - The ID of the preset. 
    # + videoId - The ID of the video. 
    # + return - The embed preset was unassigned. 
    remote isolated function deleteVideoEmbedPreset(decimal presetId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/presets/${presetId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the domains on which a video can be embedded
    #
    # + videoId - The ID of the video. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The domains were returned. 
    remote isolated function getVideoPrivacyDomains(decimal videoId, decimal? page = (), decimal? perPage = ()) returns Domain[]|error {
        string  path = string `/videos/${videoId}/privacy/domains`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Domain[] response = check self.clientEp-> get(path, targetType = DomainArr);
        return response;
    }
    # Permit a video to be embedded on a domain
    #
    # + domain - The domain name. 
    # + videoId - The ID of the video. 
    # + return - The video is now embeddable on the domain. 
    remote isolated function addVideoPrivacyDomain(string domain, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/privacy/domains/${domain}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        http:Response response = check self.clientEp-> put(path, request, targetType = http:Response);
        return response;
    }
    # Restrict a video from being embedded on a domain
    #
    # + domain - The domain name. 
    # + videoId - The ID of the video. 
    # + return - The video was disallowed from being embedded on the domain. 
    remote isolated function deleteVideoPrivacyDomain(string domain, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/privacy/domains/${domain}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the users who can view a user's private videos by default
    #
    # + videoId - The ID of the video. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The users were returned. 
    remote isolated function getVideoPrivacyUsers(decimal videoId, decimal? page = (), decimal? perPage = ()) returns User[]|error {
        string  path = string `/videos/${videoId}/privacy/users`;
        map<anydata> queryParam = {"page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        User[] response = check self.clientEp-> get(path, targetType = UserArr);
        return response;
    }
    # Permit a list of users to view a private video
    #
    # + videoId - The ID of the video. 
    # + return - The users can now view the private video. 
    remote isolated function addVideoPrivacyUsers(decimal videoId) returns User[]|error {
        string  path = string `/videos/${videoId}/privacy/users`;
        http:Request request = new;
        //TODO: Update the request as needed;
        User[] response = check self.clientEp-> put(path, request, targetType = UserArr);
        return response;
    }
    # Permit a specific user to view a private video
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The user can now view the private video. 
    remote isolated function addVideoPrivacyUser(decimal userId, decimal videoId) returns User|error {
        string  path = string `/videos/${videoId}/privacy/users/${userId}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        User response = check self.clientEp-> put(path, request, targetType = User);
        return response;
    }
    # Restrict a user from viewing a private video
    #
    # + userId - The ID of the user. 
    # + videoId - The ID of the video. 
    # + return - The user was disallowed from viewing the private video. 
    remote isolated function deleteVideoPrivacyUser(decimal userId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/privacy/users/${userId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the tags of a video
    #
    # + videoId - The ID of the video. 
    # + return - The tags were returned. 
    remote isolated function getVideoTags(decimal videoId) returns Tag[]|error {
        string  path = string `/videos/${videoId}/tags`;
        Tag[] response = check self.clientEp-> get(path, targetType = TagArr);
        return response;
    }
    # Add a list of tags to a video
    #
    # + videoId - The ID of the video. 
    # + return - The tags that were added. 
    remote isolated function addVideoTags(decimal videoId, Body60 payload) returns Tag[]|error {
        string  path = string `/videos/${videoId}/tags`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        Tag[] response = check self.clientEp->put(path, request, targetType=TagArr);
        return response;
    }
    # Check if a tag has been added to a video
    #
    # + videoId - The ID of the video. 
    # + word - The tag word. 
    # + return - The tag has been added. 
    remote isolated function checkVideoForTag(decimal videoId, string word) returns Tag|error {
        string  path = string `/videos/${videoId}/tags/${word}`;
        Tag response = check self.clientEp-> get(path, targetType = Tag);
        return response;
    }
    # Add a specific tag to a video
    #
    # + videoId - The ID of the video. 
    # + word - The tag word. 
    # + return - The tag was added. 
    remote isolated function addVideoTag(decimal videoId, string word) returns Tag|error {
        string  path = string `/videos/${videoId}/tags/${word}`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Tag response = check self.clientEp-> put(path, request, targetType = Tag);
        return response;
    }
    # Remove a tag from a video
    #
    # + videoId - The ID of the video. 
    # + word - The tag word. 
    # + return - The tag was deleted. 
    remote isolated function deleteVideoTag(decimal videoId, string word) returns http:Response|error {
        string  path = string `/videos/${videoId}/tags/${word}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Get all the text tracks of a video
    #
    # + videoId - The ID of the video. 
    # + return - The text tracks were returned. 
    remote isolated function getTextTracks(decimal videoId) returns TextTrack[]|error {
        string  path = string `/videos/${videoId}/texttracks`;
        TextTrack[] response = check self.clientEp-> get(path, targetType = TextTrackArr);
        return response;
    }
    # Add a text track to a video
    #
    # + videoId - The ID of the video. 
    # + return - The text track was added. 
    remote isolated function createTextTrack(decimal videoId, Body61 payload) returns TextTrack|error {
        string  path = string `/videos/${videoId}/texttracks`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TextTrack response = check self.clientEp->post(path, request, targetType=TextTrack);
        return response;
    }
    # Get a specific text track
    #
    # + texttrackId - The ID of the text track. 
    # + videoId - The ID of the video. 
    # + return - The text track was returned. 
    remote isolated function getTextTrack(decimal texttrackId, decimal videoId) returns TextTrack|error {
        string  path = string `/videos/${videoId}/texttracks/${texttrackId}`;
        TextTrack response = check self.clientEp-> get(path, targetType = TextTrack);
        return response;
    }
    # Delete a text track
    #
    # + texttrackId - The ID of the text track. 
    # + videoId - The ID of the video. 
    # + return - The text track was deleted. 
    remote isolated function deleteTextTrack(decimal texttrackId, decimal videoId) returns http:Response|error {
        string  path = string `/videos/${videoId}/texttracks/${texttrackId}`;
        http:Response response = check self.clientEp-> delete(path, targetType = http:Response);
        return response;
    }
    # Edit a text track
    #
    # + texttrackId - The ID of the text track. 
    # + videoId - The ID of the video. 
    # + return - The text track was edited. 
    remote isolated function editTextTrack(decimal texttrackId, decimal videoId, Body62 payload) returns TextTrack|error {
        string  path = string `/videos/${videoId}/texttracks/${texttrackId}`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        TextTrack response = check self.clientEp->patch(path, request, targetType=TextTrack);
        return response;
    }
    # Add a new custom logo to a video
    #
    # + videoId - The ID of the video. 
    # + return - Standard request. 
    remote isolated function createVideoCustomLogo(decimal videoId) returns Picture|error {
        string  path = string `/videos/${videoId}/timelinethumbnails`;
        http:Request request = new;
        //TODO: Update the request as needed;
        Picture response = check self.clientEp-> post(path, request, targetType = Picture);
        return response;
    }
    # Get a custom video logo
    #
    # + thumbnailId - The ID of the picture. 
    # + videoId - The ID of the video. 
    # + return - The custom logo was returned. 
    remote isolated function getVideoCustomLogo(decimal thumbnailId, decimal videoId) returns Picture|error {
        string  path = string `/videos/${videoId}/timelinethumbnails/${thumbnailId}`;
        Picture response = check self.clientEp-> get(path, targetType = Picture);
        return response;
    }
    # Add a version to a video
    #
    # + videoId - The ID of the video. 
    # + return - Standard request. 
    remote isolated function createVideoVersion(decimal videoId, Body63 payload) returns VideoVersions|error {
        string  path = string `/videos/${videoId}/versions`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        VideoVersions response = check self.clientEp->post(path, request, targetType=VideoVersions);
        return response;
    }
    # Get all the related videos of a video
    #
    # + videoId - The ID of the video. 
    # + filter - The attribute by which to filter the results. 
    # + page - The page number of the results to show. 
    # + perPage - The number of items to show on each page of results, up to a maximum of 100. 
    # + return - The related videos were returned. 
    remote isolated function getRelatedVideos(decimal videoId, string? filter = (), decimal? page = (), decimal? perPage = ()) returns Video[]|error {
        string  path = string `/videos/${videoId}/videos`;
        map<anydata> queryParam = {"filter": filter, "page": page, "per_page": perPage};
        path = path + check getPathForQueryParam(queryParam);
        Video[] response = check self.clientEp-> get(path, targetType = VideoArr);
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
