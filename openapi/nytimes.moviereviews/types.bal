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

public type Movie record {
    string? byline?;
    int? critics_pick?;
    string? date_updated?;
    string? display_title?;
    string? headline?;
    MovieLink? link?;
    string? mpaa_rating?;
    MovieMultimedia? multimedia?;
    string? opening_date?;
    string? publication_date?;
    string? summary_short?;
};

public type MovieMultimediaResource record {
    int height?;
    string src?;
    string 'type?;
    int width?;
};

public type Critic record {
    string? bio?;
    string? display_name?;
    CriticMultimedia? multimedia?;
    string? seo_name?;
    string? sort_name?;
    string? status?;
};

public type InlineResponse2001 record {
    string copyright?;
    int num_results?;
    Movie[] results?;
    string status?;
};

public type InlineResponse200 record {
    string copyright?;
    int num_results?;
    Critic[] results?;
    string status?;
};

public type MovieMultimedia record {
    MovieMultimediaResource 'resource?;
};

public type CriticMultimediaResource record {
    string credit?;
    int height?;
    string src?;
    string 'type?;
    int width?;
};

public type CriticMultimedia record {
    CriticMultimediaResource 'resource?;
};

public type MovieLink record {
    string suggested_link_text?;
    string 'type?;
    string url?;
};
