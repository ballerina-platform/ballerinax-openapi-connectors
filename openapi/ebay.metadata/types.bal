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

# A unique ID for a sales tax jurisdiction.
public type SalesTaxJurisdiction record {
    # The unique ID for a sales tax jurisdiction.
    string salesTaxJurisdictionId?;
};

public type ListingStructurePolicyResponse record {
    # Returns a list of category IDs plus a flag indicating whether or not each listed category supports item variations.
    ListingStructurePolicy[] listingStructurePolicies?;
    # A list of the warnings that were generated as a result of the request. This field is not returned if no warnings were generated by the request.
    Error[] warnings?;
};

# A container that defines the elements of error and warning messages.
public type Error record {
    # The category type for this error or warning. It takes an ErrorCategory object which can have one of three values: Application: Indicates an exception or error occurred in the application code or at runtime. Examples include catching an exception in a service's business logic, system failures, or request errors from a dependency. Business: Used when your service or a dependent service refused to continue processing on the resource because of a business rule violation such as &quot;Seller does not ship item to Antarctica&quot; or &quot;Buyer ineligible to purchase an alcoholic item&quot;. Business errors are not syntactical input errors. Request: Used when there is anything wrong with the request, such as authentication, syntactical errors, rate limiting or missing headers, bad HTTP header values, and so on.
    string category?;
    # Name of the domain containing the service or application.
    string domain?;
    # A positive integer that uniquely identifies the specific error condition that occurred. Your application can use error codes as identifiers in your customized error-handling algorithms.
    int errorId?;
    # Identifies specific request elements associated with the error, if any. inputRefId's response is format specific. For JSON, use JSONPath notation.
    string[] inputRefIds?;
    # An expanded version of message that should be around 100-200 characters long, but is not required to be such.
    string longMessage?;
    # An end user and app developer friendly device agnostic message. It explains what the error or warning is, and how to fix it (in a general sense). Its value is at most 50 characters long. If applicable, the value is localized in the end user's requested locale.
    string message?;
    # Identifies specific response elements associated with the error, if any. Path format is the same as inputRefId.
    string[] outputRefIds?;
    # This optional complex field type contains a list of one or more context-specific ErrorParameter objects, with each item in the list entry being a parameter (or input field name) that caused an error condition. Each ErrorParameter object consists of two fields, a name and a value.
    ErrorParameter[] parameters?;
    # Name of the domain's subsystem or subdivision. For example, checkout is a subdomain in the buying domain.
    string subdomain?;
};

# Container for a error parameter.
public type ErrorParameter record {
    # Name of the entity that threw the error.
    string name?;
    # A description of the error.
    string value?;
};

public type ItemConditionPolicyResponse record {
    # A list of category IDs and the policies for how to indicate an item's condition in each of the listed categories.
    ItemConditionPolicy[] itemConditionPolicies?;
    # A list of the warnings that were generated as a result of the request. This field is not returned if no warnings were generated by the request.
    Error[] warnings?;
};

# This container defines the category policies that relate to domestic and international return policies (the return shipping is made via a domestic or an international shipping service, respectively).
public type ReturnPolicyDetails record {
    # If set to true, this flag indicates you can supply a detailed return policy description within your return policy (for example, by populating the returnInstructions field in the Account API's createReturnPolicy). User-supplied return policy details are allowed only in the DE, ES, FR, and IT marketplaces.
    boolean policyDescriptionEnabled?;
    # A list of refund methods allowed for the associated category.
    string[] refundMethods?;
    # A list of return methods allowed for the associated category.
    string[] returnMethods?;
    # A list of return periods allowed for the associated category. Note that different APIs require you to enter the return period in different ways. For example, the Account API uses the complex TimeDuration type, which takes two values (a unit and a value), whereas the Trading API takes a single value (such as Days_30).
    TimeDuration[] returnPeriods?;
    # If set to true, this flag indicates the seller can configure how they handle domestic returns.
    boolean returnsAcceptanceEnabled?;
    # A list of allowed values for who pays for the return shipping cost. Note that for SNAD returns, the seller is always responsible for the return shipping cost.
    string[] returnShippingCostPayers?;
};

public type ReturnPolicyResponse record {
    # A list of elements, where each contains a category ID and a flag that indicates whether or not listings in that category require a return policy.
    ReturnPolicy[] returnPolicies?;
    # A list of the warnings that were generated as a result of the request. This field is not returned if no warnings were generated by the request.
    Error[] warnings?;
};

public type ListingStructurePolicy record {
    # The category ID to which the listing-structure policy applies.
    string categoryId?;
    # A value that indicates the root node of the category tree used for the response set. Each marketplace is based on a category tree whose root node is indicated by this unique category ID value. All category policy information returned by this call pertains to the categories included below this root node of the tree. A category tree is a hierarchical framework of eBay categories that begins at the root node of the tree and extends to include all the child nodes in the tree. Each child node in the tree is an eBay category that is represented by a unique categoryId value. Within a category tree, the root node has no parent node and leaf nodes are nodes that have no child nodes.
    string categoryTreeId?;
    # This flag denotes whether or not the associated category supports listings with item variations. If set to true, the category does support item variations.
    boolean variationsSupported?;
};

# This type returns a list of properties (and their associated values) that are excluded from requiring an ePID value (from the eBay Catalog) for items that are listed in the associated category.
public type Exclusion record {
    # A list of brands that are excluded from requiring a link to the eBay Catalog for the associated categoryId. If productRequired is set to true, items that are of a brand returned in this field are excluded from the need to specify a value for the ePID field in their item description in order to be listed in the associated category.
    string[] brands?;
};

public type NegotiatedPricePolicy record {
    # This flag denotes whether or not the category supports the setting of a price at which best offers are automatically accepted. If set to true, the category does support the setting of an automatic price for best-offers.
    boolean bestOfferAutoAcceptEnabled?;
    # This flag denotes whether or not the category supports the setting of an auto-decline price for best offers. If set to true, the category does support the setting of an automatic-decline price for best-offers.
    boolean bestOfferAutoDeclineEnabled?;
    # This flag denotes whether or not the category supports the setting for an automatic counter-offer on best offers. If set to true, the category does support the setting of an automatic counter-offer price for best-offers.
    boolean bestOfferCounterEnabled?;
    # The category ID to which the negotiated-price policies apply.
    string categoryId?;
    # A value that indicates the root node of the category tree used for the response set. Each marketplace is based on a category tree whose root node is indicated by this unique category ID value. All category policy information returned by this call pertains to the categories included below this root node of the tree. A category tree is a hierarchical framework of eBay categories that begins at the root node of the tree and extends to include all the child nodes in the tree. Each child node in the tree is an eBay category that is represented by a unique categoryId value. Within a category tree, the root node has no parent node and leaf nodes are nodes that have no child nodes.
    string categoryTreeId?;
};

public type ReturnPolicy record {
    # The category ID to which the return policies apply.
    string categoryId?;
    # A value that indicates the root node of the category tree used for the response set. Each marketplace is based on a category tree whose root node is indicated by this unique category ID value. All category policy information returned by this call pertains to the categories included below this root node of the tree. A category tree is a hierarchical framework of eBay categories that begins at the root node of the tree and extends to include all the child nodes in the tree. Each child node in the tree is an eBay category that is represented by a unique categoryId value. Within a category tree, the root node has no parent node and leaf nodes are nodes that have no child nodes.
    string categoryTreeId?;
    # This container defines the category policies that relate to domestic and international return policies (the return shipping is made via a domestic or an international shipping service, respectively).
    ReturnPolicyDetails domestic?;
    # This container defines the category policies that relate to domestic and international return policies (the return shipping is made via a domestic or an international shipping service, respectively).
    ReturnPolicyDetails international?;
    # If set to true, this flag indicates that you must specify a return policy for items listed in the associated category. Note that not accepting returns (setting returnsAcceptedEnabled to false) is a valid return policy.
    boolean required?;
};

# This complex type returns a category ID and a flag that indicates whether or not items listed in that category require the declaration of an ePID value, which links the item to the eBay Catalog. The type also lists any items that are excepted from the requirement to included an ePID value.
public type ProductAdoptionPolicy record {
    # The category ID to which the listing policies apply.
    string categoryId?;
    # A value that indicates the root node of the category tree used for the response set. Each marketplace is based on a category tree whose root node is indicated by this unique category ID value. All category policy information returned by this call pertains to the categories included below this root node of the tree. A category tree is a hierarchical framework of eBay categories that begins at the root node of the tree and extends to include all the child nodes in the tree. Each child node in the tree is an eBay category that is represented by a unique categoryId value. Within a category tree, the root node has no parent node and leaf nodes are nodes that have no child nodes.
    string categoryTreeId?;
    # This type returns a list of properties (and their associated values) that are excluded from requiring an ePID value (from the eBay Catalog) for items that are listed in the associated category.
    Exclusion exclusion?;
    # If set to true, items must include an ePID value in their item description before they can be listed in the category identified by the associated categoryId. In contrast, a value of false indicates that items listed in the associated category do not require ePID values. Important! It is possible for a productAdoptionPolicies container to not contain this productRequired field. This occurs if the eBay category is not part of the PBSE Phase 1 or Phase 2 mandate. In these scenarios, please treat the response the same as if this field were present and contained a value of false.
    boolean productRequired?;
};

# This complex type contains a list of sales tax jurisdictions.
public type SalesTaxJurisdictions record {
    # A list of sales tax jurisdictions.
    SalesTaxJurisdiction[] salesTaxJurisdictions?;
};

public type AutomotivePartsCompatibilityPolicy record {
    # The category ID to which the automotive-parts-compatibility policies apply.
    string categoryId?;
    # A value that indicates the root node of the category tree used for the response set. Each marketplace is based on a category tree whose root node is indicated by this unique category ID value. All category policy information returned by this call pertains to the categories included below this root node of the tree. A category tree is a hierarchical framework of eBay categories that begins at the root node of the tree and extends to include all the child nodes in the tree. Each child node in the tree is an eBay category that is represented by a unique categoryId value. Within a category tree, the root node has no parent node and leaf nodes are nodes that have no child nodes.
    string categoryTreeId?;
    # Indicates whether the category supports parts compatibility by either ASSEMBLY or by SPECIFICATION. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/metadata/types/sel:CompatibilityTypeEnum'>eBay API documentation</a>
    string compatibilityBasedOn?;
    # Indicates the compatibility classification of the part based on high-level vehicle types.
    string[] compatibleVehicleTypes?;
    # Specifies the maximum number of compatible vehicle-applications allowed per item.
    int maxNumberOfCompatibleVehicles?;
};

public type NegotiatedPricePolicyResponse record {
    # A list of category IDs and the policies related to negotiated-price items for each of the listed categories.
    NegotiatedPricePolicy[] negotiatedPricePolicies?;
    # A list of the warnings that were generated as a result of the request. This field is not returned if no warnings were generated by the request.
    Error[] warnings?;
};

# A complex type that specifies a period of time using a specified time-measurement unit.
public type TimeDuration record {
    # A time-measurement unit that specifies a singular period of time. A span of time is defined when you apply the value specified in the value field to the value specified for unit. Time-measurement units can be YEAR, MONTH, DAY, and so on. See TimeDurationUnitEnum for a complete list of possible time-measurement units. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/metadata/types/ba:TimeDurationUnitEnum'>eBay API documentation</a>
    string unit?;
    # An integer that represents an amount of time, as measured by the time-measurement unit specified in the unit field.
    int value?;
};

public type AutomotivePartsCompatibilityPolicyResponse record {
    # A list of category IDs and the automotive-parts-compatibility policies for each of the listed categories.
    AutomotivePartsCompatibilityPolicy[] automotivePartsCompatibilityPolicies?;
    # A list of the warnings that were generated as a result of the request. This field is not returned if no warnings were generated by the request.
    Error[] warnings?;
};

public type ItemConditionPolicy record {
    # The category ID to which the item-condition policy applies.
    string categoryId?;
    # A value that indicates the root node of the category tree used for the response set. Each marketplace is based on a category tree whose root node is indicated by this unique category ID value. All category policy information returned by this call pertains to the categories included below this root node of the tree. A category tree is a hierarchical framework of eBay categories that begins at the root node of the tree and extends to include all the child nodes in the tree. Each child node in the tree is an eBay category that is represented by a unique categoryId value. Within a category tree, the root node has no parent node and leaf nodes are nodes that have no child nodes.
    string categoryTreeId?;
    # This flag denotes whether or not you must list the item condition in a listing for the specified category. If set to true, you must specify an item condition for the associated category.
    boolean itemConditionRequired?;
    # The item-condition values allowed in the category. Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any active listings on any eBay marketplace that had 'Manufacturer Refurbished' as the item condition should have been automatically updated by eBay to the 'Seller Refurbished' item condition (Condition ID 2500). Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center.
    ItemCondition[] itemConditions?;
};

# Note: In all eBay marketplaces, Condition ID 2000 now maps to an item condition of 'Certified Refurbished', and not 'Manufacturer Refurbished'. To list an item as 'Certified Refurbished', a seller must be pre-qualified by eBay for this feature. Any seller who is not eligible for this feature will be blocked if they try to create a new listing or revise an existing listing with this item condition. Any active listings on any eBay marketplace that had 'Manufacturer Refurbished' as the item condition should have been automatically updated by eBay to the 'Seller Refurbished' item condition (Condition ID 2500). Any seller that is interested in eligibility requirements to list with 'Certified Refurbished' should see the Certified refurbished program page in Seller Center.
public type ItemCondition record {
    # The human-readable label for the condition (e.g., &quot;New&quot;). This value is typically localized for each site. Note that the display name can vary by category. For example, the description for condition ID 1000 could be called &quot;New: with Tags&quot; in one category and &quot;Brand New&quot; in another. For details on condition IDs and descriptions, see Item condition ID and name values.
    string conditionDescription?;
    # The ID value of the selected item condition. For information on the supported condition ID values, see Item condition ID and name values.
    string conditionId?;
};

# This is the response object returned by a call to getProductAdoptionPolicies.
public type ProductAdoptionPolicyResponse record {
    # A list of category IDs from the marketplace specified in the request where each returned element represents a leaf node in the category tree. Each element in the list contains the policies governing whether or not items listed in that category must include an ePID value (which links the item to the eBay Catalog).
    ProductAdoptionPolicy[] productAdoptionPolicies?;
    # A list of the warnings that were generated as a result of the request. This field is not returned if no warnings were generated by the request.
    Error[] warnings?;
};
