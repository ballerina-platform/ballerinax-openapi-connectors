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
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|OAuth2RefreshTokenGrantConfig auth;
    # The HTTP version understood by the client
    http:HttpVersion httpVersion = http:HTTP_2_0;
    # Configurations related to HTTP/1.x protocol
    ClientHttp1Settings http1Settings?;
    # Configurations related to HTTP/2 protocol
    http:ClientHttp2Settings http2Settings?;
    # The maximum time to wait (in seconds) for a response before closing the connection
    decimal timeout = 60;
    # The choice of setting `forwarded`/`x-forwarded` header
    string forwarded = "disable";
    # Configurations associated with request pooling
    http:PoolConfiguration poolConfig?;
    # HTTP caching related configurations
    http:CacheConfig cache?;
    # Specifies the way of handling compression (`accept-encoding`) header
    http:Compression compression = http:COMPRESSION_AUTO;
    # Configurations associated with the behaviour of the Circuit Breaker
    http:CircuitBreakerConfig circuitBreaker?;
    # Configurations associated with retrying
    http:RetryConfig retryConfig?;
    # Configurations associated with inbound response size limits
    http:ResponseLimitConfigs responseLimits?;
    # SSL/TLS-related options
    http:ClientSecureSocket secureSocket?;
    # Proxy server related options
    http:ProxyConfig proxy?;
    # Enables the inbound payload validation functionality which provided by the constraint package. Enabled by default
    boolean validation = true;
|};

# Provides settings related to HTTP/1.x protocol.
public type ClientHttp1Settings record {|
    # Specifies whether to reuse a connection for multiple requests
    http:KeepAlive keepAlive = http:KEEPALIVE_AUTO;
    # The chunking behaviour of the request
    http:Chunking chunking = http:CHUNKING_AUTO;
    # Proxy server related options
    ProxyConfig proxy?;
|};

# Proxy server configurations to be used with the HTTP client endpoint.
public type ProxyConfig record {|
    # Host name of the proxy server
    string host = "";
    # Proxy server port
    int port = 0;
    # Proxy server username
    string userName = "";
    # Proxy server password
    @display {label: "", kind: "password"}
    string password = "";
|};

# OAuth2 Refresh Token Grant Configs
public type OAuth2RefreshTokenGrantConfig record {|
    *http:OAuth2RefreshTokenGrantConfig;
    # Refresh URL
    string refreshUrl = "https://api.ebay.com/identity/v1/oauth2/token";
|};

public type StringArr string[];

# This complex type specifies the details of a geographical address.
public type ContactAddress record {
    # The first line of the street address.
    string addressLine1?;
    # The second line of the street address. Use this field for additional address information, such as a suite or apartment number.
    string addressLine2?;
    # The city in which the address is located.
    string city?;
    # The country of the address, represented as two-letter ISO 3166 country code. For example, US represents the United States and DE represents Germany. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/bas:CountryCodeEnum'>eBay API documentation</a>
    string countryCode?;
    # The county (not country) in which the address is located. Counties typically contain multiple cities or towns.
    string county?;
    # The postal code of the address.
    string postalCode?;
    # The state or province in which the address is located. States and provinces often contain multiple counties.
    string stateOrProvince?;
};

# This complex type defines an order from which a seller is including one or more line items in a single package to be shipped.
public type Order record {
    # The e-commerce platform or environment where the order was created. Use the value EBAY to get the rates available for eBay orders.
    string channel?;
    # The unique ID of the order supplied by the channel of origin. For eBay orders, this would be the orderId.
    string orderId?;
};

# This complex type contains the request payload for the createFromShippingQuote method.
public type CreateShipmentFromQuoteRequest record {
    # Supply a list of one or more shipping options that the seller wants to purchase for this shipment. The baseShippingCost field that's associated with the selected shipping rate is the cost of the base service offered in the rate. In addition to the base service, sellers can add additional shipping services to the base service. Shipping options include things such as shipping insurance or a recipient's signature upon delivery. The cost of any added services is summed with the base shipping cost to determine the final cost for the shipment. All options added to the shipment must be chosen from the set of shipping options offered with the selected rate.
    AdditionalOption[] additionalOptions?;
    # Optional text to be printed on the shipping label if the selected shipping carrier supports custom messages on their labels.
    string labelCustomMessage?;
    # The seller's desired label size. Any supplied value is applied only if the shipping carrier supports multiple label sizes, otherwise the carrier's default label size is used. 4x6
    string labelSize?;
    # The eBay-assigned ID of the shipping rate that the seller selected for the shipment. This value is generated by a call to createShippingQuote and is returned in the rates.rateId field.
    string rateId?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact returnTo?;
    # The unique eBay-assigned ID of the shipping quote that was generated by a call to createShippingQuote.
    string shippingQuoteId?;
};

# This complex type contains live quote information about a shipping service that's available for a given shipping quote request, including the shipping carrier and service, delivery window, shipping cost, and additional shipping options.
public type Rate record {
    # Contains service and pricing information for one or more shipping options that are offered by the carrier and can be purchased in addition to the base shipping service provided by this rate. Shipping options can include items such as INSURANCE and SIGNATURE.
    AdditionalOption[] additionalOptions?;
    # A complex type that describes the value of a monetary amount as represented by a global currency.
    Amount baseShippingCost?;
    # The name of the time zone region, as defined in the IANA Time Zone Database, to which the package is being shipped. Delivery dates are calculated relative to this time zone. Note: This is different from a Coordinated Universal Time (UTC) offset. For example, the America/Los_Angeles time zone identifies a region with the UTC standard time offset of -08:00, but so do several other time zones, including America/Tijuana,America/Dawson, and Pacific/Pitcairn.
    string destinationTimeZone?;
    # The latest stated date and time the shipment will be delivered at this rate. The time stamp is formatted as an ISO 8601 string, which is based on the 24-hour Coordinated Universal Time (UTC) clock. Format: [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS].[SSS]Z Example: 2018-08-20T07:09:00.000Z
    string maxEstimatedDeliveryDate?;
    # The estimated earliest date and time the shipment will be delivered at this rate. The time stamp is formatted as an ISO 8601 UTC string.
    string minEstimatedDeliveryDate?;
    # A list of pickup networks compatible with the shipping service.
    string[] pickupNetworks?;
    # A list of available pickup slots for the package.
    PickupSlot[] pickupSlots?;
    # The type of pickup or drop-off service associated with the pickupSlots time frames. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/api:PickupTypeEnum'>eBay API documentation</a>
    string pickupType?;
    # The unique eBay-assigned ID for this shipping rate.
    string rateId?;
    # A list of reasons this rate is recommended. Available values are: BUYER_CHOSEN &mdash; The rate meets or exceeds the requirements of the buyer's preferred shipping option. CHEAPEST_ON_TIME &mdash; The rate is the cheapest rate available that will provide delivery within the seller's time frame commitment. EBAY_PLUS_OK &mdash; The rate complies with the shipping requirements of the eBay Plus program. FASTEST_ON_TIME &mdash; The rate has the fastest shipping time, and will provide delivery within the seller's time frame commitment. GUARANTEED_DELIVERY_OK &mdash; The rate complies with the shipping requirements of the eBay Guaranteed Delivery program.
    string[] rateRecommendation?;
    # The code name of the shipping carrier who will provide the service identified by shippingServiceCode.
    string shippingCarrierCode?;
    # The common name of the shipping carrier.
    string shippingCarrierName?;
    # The code name of the shipping service to be provided by the carrier identified by shippingCarrierCode.
    string shippingServiceCode?;
    # The common name of the shipping service.
    string shippingServiceName?;
};

# A complex type that describes the value of a monetary amount as represented by a global currency.
public type Amount record {
    # The base currency applied to the value field to establish a monetary amount. The currency is represented as a 3-letter ISO 4217 currency code. For example, the code for the Canadian Dollar is CAD. Default: The default currency of the eBay marketplace that hosts the listing. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/bas:CurrencyCodeEnum'>eBay API documentation</a>
    string currency?;
    # The monetary amount in the specified currency.
    string value?;
};

# This complex type defines the dimensions of a package to be shipped.
public type Dimensions record {
    # The numeric value of the height of the package.
    string height?;
    # The numeric value of the length of the package.
    string length?;
    # The unit of measure used to express the height, length, and width of the package. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/api:LengthUnitOfMeasureEnum'>eBay API documentation</a>
    string unit?;
    # The numeric value of the width of the package.
    string width?;
};

# A container that defines the elements of error and warning message.
public type Error record {
    # The category type for this error or warning. It takes a string that can have one of three values: Application: Indicates an exception or error occurred in the application code or at runtime. Examples include catching an exception in a service's business logic, system failures, or request errors from a dependency. Business: Used when your service or a dependent service refused to continue processing on the resource because of a business rule violation such as Seller does not ship item to Antarctica or Buyer ineligible to purchase an alcoholic item. Business errors are not syntactical input errors. Request: Used when there is anything wrong with the request, such as authentication, syntactical errors, rate limiting or missing headers, bad HTTP header values, and so on.
    string category?;
    # Name of the domain containing the service or application.
    string domain?;
    # A positive integer that uniquely identifies the specific error condition that occurred. Your application can use error codes as identifiers in your customized error-handling algorithms.
    int errorId?;
    # Identifies specific request elements associated with the error, if any. inputRefId's response is format specific. For JSON, use JSONPath notation.
    string[] inputRefIds?;
    # An expanded version of message that should be around 100-200 characters long, but is not required to be such.
    string longMessage?;
    # An end user and app-developer friendly device agnostic message. It explains what the error or warning is, and how to fix it (in a general sense). Its value is at most 50 characters long. If applicable, the value is localized in the end user's requested locale.
    string message?;
    # Identifies specific response elements associated with the error, if any. Path format is the same as inputRefId.
    string[] outputRefIds?;
    # This optional complex field type contains a list of one or more context-specific ErrorParameter objects, with each item in the list entry being a parameter (or input field name) that caused an error condition. Each ErrorParameter object consists of two fields, a name and a value.
    ErrorParameter[] parameters?;
    # Name of the domain's subsystem or subdivision. For example, checkout is a subdomain in the buying domain.
    string subdomain?;
};

# This complex type defines a shipment for a specific package (for example, a box or letter). Shipments are always linked to a purchased shipping label.
public type Shipment record {
    # This type defines a shipment cancellation by the date and time the cancellation request was made and the current status of the request.
    ShipmentCancellation cancellation?;
    # The date and time the shipment was created, formatted as an ISO 8601 string, which is based on the 24-hour Coordinated Universal Time (UTC) clock. Format: [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS].[SSS]Z Example: 2018-08-20T07:09:00.000Z
    string creationDate?;
    # If supported by the selected shipping carrier, this field can contain optional seller text to be printed on the shipping label.
    string labelCustomMessage?;
    # The direct URL the seller can use to download an image of the shipping label. By default, the file format is PDF. See downloadLabelFile for requesting different response file formats.
    string labelDownloadUrl?;
    # The seller's desired label size. The support for multi-sized labels is shipping-carrier specific and if the size requested in the creaateFromShippingQuote call matches a size the carrier supports, the value will be represented here in the shipment. Currently, the only valid value is: 4x6
    string labelSize?;
    # This list value is optionally assigned by the seller. When present, each element in the returned list contains seller-assigned information about an order (such as an order number). Because a package can contain all or part of one or more orders, this field provides a way for sellers to identify the packages that contain specific orders.
    Order[] orders?;
    # This complex type specifies the dimensions and weight of a package.
    PackageSpecification packageSpecification?;
    # The rate that has been selected and purchased for the shipment, as referenced by the rateId value.
    PurchasedRate rate?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact returnTo?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact shipFrom?;
    # The unique eBay-assigned ID for the shipment. The ID is generated when the shipment is created by a call to createFromShippingQuote.
    string shipmentId?;
    # A unique carrier-assigned ID string that can be used to track the shipment.
    string shipmentTrackingNumber?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact shipTo?;
};

# Container for an error parameter.
public type ErrorParameter record {
    # Name of the entity that threw the error.
    string name?;
    # A description of the error.
    string value?;
};

# The rate that has been selected and purchased for the shipment, as referenced by the rateId value.
public type PurchasedRate record {
    # An list of additional, optional features that have been purchased for the shipment.
    AdditionalOption[] additionalOptions?;
    # A complex type that describes the value of a monetary amount as represented by a global currency.
    Amount baseShippingCost?;
    # The time zone of the destination according to Time Zone Database. For example, America/Los_Angeles.
    string destinationTimeZone?;
    # A string value representing maximum (latest) estimated delivery time, formatted as an ISO 8601 string, which is based on the 24-hour Coordinated Universal Time (UTC) clock. Format: [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS].[SSS]Z Example: 2018-08-20T07:09:00.000Z
    string maxEstimatedDeliveryDate?;
    # A string value representing minimum (earliest) estimated delivery time, formatted as an ISO 8601ISO 8601 UTC string.
    string minEstimatedDeliveryDate?;
    # A list of pickup networks compatible with the shipping service.
    string[] pickupNetworks?;
    # This unique eBay-assigned ID value is returned only if the shipment has been configured for a scheduled pickup.
    string pickupSlotId?;
    # The type of pickup or drop off configured for the shipment. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/api:PickupTypeEnum'>eBay API documentation</a>
    string pickupType?;
    # The eBay-generated ID of the shipping rate that the seller has chosen to purchase for the shipment.
    string rateId?;
    # The ID code for the carrier that was selected for the package shipment.
    string shippingCarrierCode?;
    # The name of the shipping carrier.
    string shippingCarrierName?;
    # The unique eBay-generated ID of the shipping quote from which the seller selected a shipping rate (rateId).
    string shippingQuoteId?;
    # String ID code for the shipping service selected for the package shipment. This is a service that the shipping carrier supplies.
    string shippingServiceCode?;
    # The name of the shipping service.
    string shippingServiceName?;
    # A complex type that describes the value of a monetary amount as represented by a global currency.
    Amount totalShippingCost?;
};

# This complex type contains information about the weight of an object such as a shipping package.
public type Weight record {
    # The unit of measurement used to specify the weight of a shipping package. Both the unit and value fields are required if the weight container is used. If the English system of measurement is being used, the applicable values for weight units are POUND and OUNCE. If the metric system of measurement is being used, the applicable values for weight units are KILOGRAM and GRAM. The metric system is used by most countries outside of the US. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/api:WeightUnitOfMeasureEnum'>eBay API documentation</a>
    string unit?;
    # The numeric value of the weight of the package, as measured by the value of unit.
    string value?;
};

# This complex type contains contact information for an individual buyer or seller.
public type Contact record {
    # The company name with which the contact is associated.
    string companyName?;
    # This complex type specifies the details of a geographical address.
    ContactAddress contactAddress?;
    # The contact's full name.
    string fullName?;
    # This complex type contains a string field representing a telephone number.
    PhoneNumber primaryPhone?;
};

# This complex type contains information about a shipping option that can be purchased in addition to the base shipping cost of a recommended rate. Additional options for each rate are defined, named, and offered by the selected shipping carrier. Examples include shipping insurance or the requirement for a recipient signature.
public type AdditionalOption record {
    # A complex type that describes the value of a monetary amount as represented by a global currency.
    Amount additionalCost?;
    # The name of a shipping option that can be purchased in addition to the base shipping cost of this rate. The value supplied in this field must match exactly the option name as supplied by the selected rate.
    string optionType?;
};

# This complex type describes a shipping quote, which contains the parameters for a package shipment. The shipping quote contains a list of live quotes or rates for the shipment. Rates are offerd by a carrier for a particular service, of set of services, for shipping the package. Included in the shipping quote are the package specifications, the shipment's origin and destination addresses, and the shipping parameters specified by the seller. Use the rateId value to select the specific service you want when you create a shipment by calling createFromShippingQuote.
public type ShippingQuote record {
    # The date and time this quote was created, expressed as an ISO 8601 UTC string.
    string creationDate?;
    # The last date and time that this quote will be honored, expressed as an ISO 8601 UTC string. After this time the quote expires and the expressed rates can no longer be purchased.
    string expirationDate?;
    # This list value is optionally assigned by the seller. When present, each element in the returned list contains seller-assigned information about an order (such as an order number). Because a package can contain all or part of one or more orders, this field provides a way for sellers to identify the packages that contain specific orders.
    Order[] orders?;
    # This complex type specifies the dimensions and weight of a package.
    PackageSpecification packageSpecification?;
    # A list of rates where each rate, as identified by a rateId, contains information about a specific shipping service offered by a carrier. Rates include shipping carrier and service, the to and from locations, the pickup and delivery windows, the seller's shipping parameters, the service constraints, and the cost for the base service and a list of additional shipping options. Each rate offered is supported by a label service where you can purchase the rate, and associated shipping label, via a call to createFromShippingQuote.
    Rate[] rates?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact shipFrom?;
    # The unique eBay-assigned ID for this shipping quote. The value of this field is associated with a specific package, based on its origin, destination, and size.
    string shippingQuoteId?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact shipTo?;
    # A list of any warnings triggered by the request.
    Error[] warnings?;
};

# This complex type defines a time window for the pickup of a package.
public type PickupSlot record {
    # The date and time the pickup slot ends, formatted as an ISO 8601 string, which is based on the 24-hour Coordinated Universal Time (UTC) clock. Format: [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS].[SSS]Z Example: 2018-08-20T07:09:00.000Z
    string pickupSlotEndTime?;
    # Seller-defined name for the pickup slot.
    string pickupSlotId?;
    # The date and time the pickup slot begins, formatted as an ISO 8601 UTC string.
    string pickupSlotStartTime?;
    # The time zone of the pickup location, returned as Time Zone Database ID (also know as an Olson time zone ID).
    string pickupSlotTimeZone?;
};

# This type defines a shipment cancellation by the date and time the cancellation request was made and the current status of the request.
public type ShipmentCancellation record {
    # The time and date the request was made to cancel the shipment, formatted as an ISO 8601 UTC string.
    string cancellationRequestedDate?;
    # This enum specifies the current cancellation status of a shipment, if a cancellation request has been made. For implementation help, refer to <a href='https://developer.ebay.com/api-docs/sell/logistics/types/api:ShipmentCancellationStatusEnum'>eBay API documentation</a>
    string cancellationStatus?;
};

# This complex type contains a string field representing a telephone number.
public type PhoneNumber record {
    # A telephone number.
    string phoneNumber?;
};

# This complex type specifies the dimensions and weight of a package.
public type PackageSpecification record {
    # This complex type defines the dimensions of a package to be shipped.
    Dimensions dimensions?;
    # This complex type contains information about the weight of an object such as a shipping package.
    Weight weight?;
};

# This complex type defines the request body for createShippingQuote. Sellers request a quote for a shipment by defining the To and From addresses for the package, plus the package's size. Carriers respond by offering up a rate for the service of theirs that best fits seller's needs.
public type ShippingQuoteRequest record {
    # A seller-defined list that contains information about the orders in the package. This allows sellers to include information about the line items in the package with the shipment information. A package can contain any number of line items from one or more orders, providing they all ship in the same package. Maximum list size: 10
    Order[] orders?;
    # This complex type specifies the dimensions and weight of a package.
    PackageSpecification packageSpecification?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact shipFrom?;
    # This complex type contains contact information for an individual buyer or seller.
    Contact shipTo?;
};
