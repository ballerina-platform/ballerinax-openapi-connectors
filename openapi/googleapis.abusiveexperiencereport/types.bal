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

# Response message for ListViolatingSites.
public type ViolatingSitesResponse record {
    # The list of violating sites.
    SiteSummaryResponse[] violatingSites?;
};

# Response message for GetSiteSummary.
public type SiteSummaryResponse record {
    # The site's Abusive Experience Report status.
    string abusiveStatus?;
    # The time at which [enforcement](https://support.google.com/webtools/answer/7538608) against the site began or will begin. Not set when the filter_status is OFF.
    string enforcementTime?;
    # The site's [enforcement status](https://support.google.com/webtools/answer/7538608).
    string filterStatus?;
    # The time at which the site's status last changed.
    string lastChangeTime?;
    # A link to the full Abusive Experience Report for the site. Not set in ViolatingSitesResponse. Note that you must complete the [Search Console verification process](https://support.google.com/webmasters/answer/9008080) for the site before you can access the full report.
    string reportUrl?;
    # The name of the reviewed site, e.g. `google.com`.
    string reviewedSite?;
    # Whether the site is currently under review.
    boolean underReview?;
};
