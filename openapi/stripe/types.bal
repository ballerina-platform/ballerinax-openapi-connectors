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

import ballerina/constraint;
import ballerina/http;

# Provides a set of configurations for controlling the behaviours when communicating with a remote HTTP endpoint.
@display {label: "Connection Config"}
public type ConnectionConfig record {|
    # Configurations related to client authentication
    http:BearerTokenConfig|http:CredentialsConfig auth;
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

public type Line_itemDiscountsItemsNull string|Discount;

@constraint:String {maxLength: 5000}
public type Subscriptiondefaulttaxrates1ItemsString string;

@constraint:String {maxLength: 5000}
public type CustomerPreferredlocalesItemsString string;

@constraint:String {maxLength: 5000}
public type ProductImagesItemsString string;

@constraint:String {maxLength: 5000}
public type Account_requirementsCurrentlydueItemsString string;

@constraint:String {maxLength: 5000}
public type Account_requirementsEventuallydueItemsString string;

@constraint:String {maxLength: 5000}
public type Account_requirementsPastdueItemsString string;

@constraint:String {maxLength: 5000}
public type Account_requirementsPendingverificationItemsString string;

@constraint:String {maxLength: 5000}
public type Payment_method_details_interac_presentPreferredlocalesItemsString string;

@constraint:String {maxLength: 5000}
public type TaxratesItemsString string;

@constraint:String {maxLength: 5000}
public type Gelato_document_reportFilesItemsString string;

@constraint:String {maxLength: 5000}
public type Subscription_items_item_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type SubscriptiondefaulttaxratesItemsString string;

@constraint:String {maxLength: 5000}
public type Setup_intentPaymentmethodtypesItemsString string;

@constraint:String {maxLength: 5000}
public type AccounttaxidsItemsString string;

@constraint:String {maxLength: 5000}
public type DefaulttaxratesItemsString string;

@constraint:String {maxLength: 5000}
public type Invoices_invoice_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type V1_subscriptions_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Financial_reporting_finance_report_run_run_parametersColumnsItemsString string;

@constraint:String {maxLength: 5000}
public type TaxratearrayItemsString string;

@constraint:String {maxLength: 5000}
public type Portal_subscription_update_productPricesItemsString string;

@constraint:String {maxLength: 5000}
public type Country_specSupportedpaymentcurrenciesItemsString string;

@constraint:String {maxLength: 5000}
public type Country_specSupportedpaymentmethodsItemsString string;

@constraint:String {maxLength: 5000}
public type Country_specSupportedtransfercountriesItemsString string;

@constraint:String {maxLength: 5000}
public type V1_subscription_schedules_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Payment_method_attach_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Person_requirementsCurrentlydueItemsString string;

@constraint:String {maxLength: 5000}
public type Person_requirementsEventuallydueItemsString string;

@constraint:String {maxLength: 5000}
public type Person_requirementsPastdueItemsString string;

@constraint:String {maxLength: 5000}
public type Person_requirementsPendingverificationItemsString string;

@constraint:String {maxLength: 5000}
public type Subscriptions_subscription_exposed_id_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Invoice_void_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Coupon_applies_toProductsItemsString string;

@constraint:String {maxLength: 5000}
public type Payment_methods_payment_method_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Products_id_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Schedule_cancel_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Invoice_pay_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type NetworksAvailableItemsString string;

@constraint:String {maxLength: 5000}
public type V1_payment_methods_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type V1_products_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Prices_price_bodyExpandItemsString string;

public type CustomfieldsItemsObject record {
    @constraint:String {maxLength: 30}
    string name;
    @constraint:String {maxLength: 30}
    string value;
};

@constraint:String {maxLength: 5000}
public type Payment_method_detach_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Country_spec_verification_field_detailsAdditionalItemsString string;

@constraint:String {maxLength: 5000}
public type Country_spec_verification_field_detailsMinimumItemsString string;

@constraint:String {maxLength: 5000}
public type Invoice_mark_uncollectible_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Account_capability_requirementsCurrentlydueItemsString string;

@constraint:String {maxLength: 5000}
public type Account_capability_requirementsEventuallydueItemsString string;

@constraint:String {maxLength: 5000}
public type Account_capability_requirementsPastdueItemsString string;

@constraint:String {maxLength: 5000}
public type Account_capability_requirementsPendingverificationItemsString string;

@constraint:String {maxLength: 5000}
public type CheckoutsessionPaymentmethodtypesItemsString string;

@constraint:String {maxLength: 5000}
public type Subscription_item_usage_records_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Invoice_send_bodyExpandItemsString string;

public type QuoteDefaulttaxratesItemsNull string|Tax_rate;

public type QuoteDiscountsItemsNull string|Discount;

@constraint:String {maxLength: 5000}
public type Customers_customer_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Customers_customer_bodyPreferredlocalesItemsString string;

public type InvoiceAccounttaxidsItemsNull string|Tax_id|Deleted_tax_id;

public type InvoiceDiscountsItemsNull string|Discount|Deleted_discount;

@constraint:String {maxLength: 5000}
public type V1_customers_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type V1_customers_bodyPreferredlocalesItemsString string;

@constraint:String {maxLength: 5000}
public type Reportingreport_typeDefaultcolumnsItemsString string;

@constraint:String {maxLength: 5000}
public type Schedule_release_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Webhook_endpointEnabledeventsItemsString string;

@constraint:String {maxLength: 5000}
public type V1_prices_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Payment_intentPaymentmethodtypesItemsString string;

@constraint:String {maxLength: 5000}
public type Subscription_schedules_schedule_bodyExpandItemsString string;

@constraint:String {maxLength: 5000}
public type Invoice_item_threshold_reasonLineitemidsItemsString string;

public type InvoiceitemDiscountsItemsNull string|Discount;

@constraint:String {maxLength: 5000}
public type V1_invoices_bodyDefaulttaxratesItemsString string;

@constraint:String {maxLength: 5000}
public type V1_invoices_bodyExpandItemsString string;

# 
public type Payment_method_details record {
    # 
    Payment_method_details_ach_credit_transfer ach_credit_transfer?;
    # 
    Payment_method_details_ach_debit ach_debit?;
    # 
    Payment_method_details_acss_debit acss_debit?;
    # 
    Payment_method_details_afterpay_clearpay afterpay_clearpay?;
    # 
    Payment_flows_private_payment_methods_alipay_details alipay?;
    # 
    Payment_method_details_au_becs_debit au_becs_debit?;
    # 
    Payment_method_details_bacs_debit bacs_debit?;
    # 
    Payment_method_details_bancontact bancontact?;
    # 
    Payment_method_details_boleto boleto?;
    # 
    Payment_method_details_card card?;
    # 
    Payment_method_details_card_present card_present?;
    # 
    Payment_method_details_eps eps?;
    # 
    Payment_method_details_fpx fpx?;
    # 
    Payment_method_details_giropay giropay?;
    # 
    Payment_method_details_grabpay grabpay?;
    # 
    Payment_method_details_ideal ideal?;
    # 
    Payment_method_details_interac_present interac_present?;
    # 
    Payment_method_details_klarna klarna?;
    # 
    Payment_method_details_multibanco multibanco?;
    # 
    Payment_method_details_oxxo oxxo?;
    # 
    Payment_method_details_p24 p24?;
    # 
    Payment_method_details_sepa_debit sepa_debit?;
    # 
    Payment_method_details_sofort sofort?;
    # 
    Payment_method_details_stripe_account stripe_account?;
    # The type of transaction-specific details of the payment method used in the payment, one of `ach_credit_transfer`, `ach_debit`, `acss_debit`, `alipay`, `au_becs_debit`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `stripe_account`, or `wechat`.
    # An additional hash is included on `payment_method_details` with a name matching this value.
    # It contains information specific to the payment method.
    @constraint:String {maxLength: 5000}
    string 'type;
    # 
    Payment_method_details_wechat wechat?;
    # 
    Payment_method_details_wechat_pay wechat_pay?;
};

# 
public type Line_item record {
    # The amount, in %s.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The amount of discount calculated per discount for this line item.
    Discounts_resource_discount_amount[]? discount_amounts?;
    # If true, discounts will apply to this line item. Always false for prorations.
    boolean discountable;
    # The discounts applied to the invoice line item. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
    (string|Discount)[]? discounts?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The ID of the [invoice item](https://stripe.com/docs/api/invoiceitems) associated with this line item if any.
    @constraint:String {maxLength: 5000}
    string invoice_item?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Note that for line items with `type=subscription` this will reflect the metadata of the subscription that caused the line item to be created.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "line_item" 'object;
    # 
    Invoice_line_item_period period;
    # The price of the line item.
    Price? price?;
    # Whether this is a proration.
    boolean proration;
    # The quantity of the subscription, if the line item is a subscription or a proration.
    int? quantity?;
    # The subscription that the invoice item pertains to, if any.
    string? subscription?;
    # The subscription item that generated this invoice item. Left empty if the line item is not an explicit result of a subscription.
    @constraint:String {maxLength: 5000}
    string subscription_item?;
    # The amount of tax calculated per tax rate for this line item
    Invoice_tax_amount[] tax_amounts?;
    # The tax rates which apply to the line item.
    Tax_rate[] tax_rates?;
    # A string identifying the type of the source of this line item, either an `invoiceitem` or a `subscription`.
    "invoiceitem"|"subscription" 'type;
};

# 
public type Mandate_bacs_debit record {
    # The status of the mandate on the Bacs network. Can be one of `pending`, `revoked`, `refused`, or `accepted`.
    "accepted"|"pending"|"refused"|"revoked" network_status;
    # The unique reference identifying the mandate on the Bacs network.
    @constraint:String {maxLength: 5000}
    string reference;
    # The URL that will contain the mandate that the customer has signed.
    @constraint:String {maxLength: 5000}
    string url;
};

public type Subscription_default_tax_rates_1 Subscriptiondefaulttaxrates1ItemsString[]|"";

# `Customer` objects allow you to perform recurring charges, and to track
# multiple charges, that are associated with the same customer. The API allows
# you to create, delete, and update your customers. You can retrieve individual
# customers as well as a list of all your customers.
# 
# Related guide: [Save a card during payment](https://stripe.com/docs/payments/save-during-payment).
public type Customer record {
    # The customer's address.
    Address? address?;
    # Current balance, if any, being stored on the customer. If negative, the customer has credit to apply to their next invoice. If positive, the customer has an amount owed that will be added to their next invoice. The balance does not refer to any unpaid invoices; it solely takes into account amounts that have yet to be successfully applied to any invoice. This balance is only taken into account as invoices are finalized.
    int balance?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) the customer can be charged in for recurring billing purposes.
    string? currency?;
    # ID of the default payment source for the customer.
    # 
    # If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) field instead.
    string|Alipay_account|Bank_account|Bitcoin_receiver|Card|Source? default_source?;
    # When the customer's latest invoice is billed by charging automatically, `delinquent` is `true` if the invoice's latest charge failed. When the customer's latest invoice is billed by sending an invoice, `delinquent` is `true` if the invoice isn't paid by its due date.
    # 
    # If an invoice is marked uncollectible by [dunning](https://stripe.com/docs/billing/automatic-collection), `delinquent` doesn't get reset to `false`.
    boolean? delinquent?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Describes the current discount active on the customer, if there is one.
    Discount? discount?;
    # The customer's email address.
    string? email?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The prefix for the customer used to generate unique invoice numbers.
    string? invoice_prefix?;
    # 
    Invoice_setting_customer_setting invoice_settings?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata?;
    # The customer's full name or business name.
    string? name?;
    # The suffix of the customer's next invoice number, e.g., 0001.
    int next_invoice_sequence?;
    # String representing the object's type. Objects of the same type share the same value.
    "customer" 'object;
    # The customer's phone number.
    string? phone?;
    # The customer's preferred locales (languages), ordered by preference.
    CustomerPreferredlocalesItemsString[]? preferred_locales?;
    # Mailing and shipping address for the customer. Appears on invoices emailed to this customer.
    Shipping? shipping?;
    # The customer's payment sources, if any.
    ApmsSourcesSourceList sources?;
    # The customer's current subscriptions, if any.
    SubscriptionList subscriptions?;
    # 
    Customer_tax tax?;
    # Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`. When set to `reverse`, invoice and receipt PDFs include the text **"Reverse charge"**.
    "exempt"|"none"|"reverse" tax_exempt?;
    # The customer's tax IDs.
    TaxIDsList tax_ids?;
};

# Products describe the specific goods or services you offer to your customers.
# For example, you might offer a Standard and Premium version of your goods or service; each version would be a separate Product.
# They can be used in conjunction with [Prices](https://stripe.com/docs/api#prices) to configure pricing in Checkout and Subscriptions.
# 
# Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) or accept [one-time payments with Checkout](https://stripe.com/docs/payments/checkout/client#create-products) and more about [Products and Prices](https://stripe.com/docs/billing/prices-guide)
public type Product record {
    # Whether the product is currently available for purchase.
    boolean active;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
    string? description?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    ProductImagesItemsString[] images;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
    @constraint:String {maxLength: 5000}
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    "product" 'object;
    # The dimensions of this product for shipping purposes.
    Package_dimensions? package_dimensions?;
    # Whether this product is shipped (i.e., physical goods).
    boolean? shippable?;
    # Extra information about a product which will appear on your customer's credit card statement. In the case that multiple products are billed at once, the first statement descriptor will be used.
    string? statement_descriptor?;
    # A [tax code](https://stripe.com/docs/tax/tax-codes) ID.
    string|Tax_code? tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
    string? unit_label?;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int updated;
    # A URL of a publicly-accessible webpage for this product.
    string? url?;
};

# 
public type Payment_method_details_oxxo record {
    # OXXO reference number
    string? number?;
};

# Issue a credit note to adjust an invoice's amount after the invoice is finalized.
# 
# Related guide: [Credit Notes](https://stripe.com/docs/billing/invoices/credit-notes).
public type Credit_note record {
    # The integer amount in %s representing the total amount of the credit note, including tax.
    int amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the customer.
    string|Customer|Deleted_customer customer;
    # Customer balance transaction related to this credit note.
    string|Customer_balance_transaction? customer_balance_transaction?;
    # The integer amount in %s representing the total amount of discount that was credited.
    int discount_amount;
    # The aggregate amounts calculated per discount for all line items.
    Discounts_resource_discount_amount[] discount_amounts;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # ID of the invoice.
    string|Invoice invoice;
    # Line items that make up the credit note
    CreditNoteLinesList lines;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Customer-facing text that appears on the credit note PDF.
    string? memo?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # A unique number that identifies this particular credit note and appears on the PDF of the credit note and its associated invoice.
    @constraint:String {maxLength: 5000}
    string number;
    # String representing the object's type. Objects of the same type share the same value.
    "credit_note" 'object;
    # Amount that was credited outside of Stripe.
    int? out_of_band_amount?;
    # The link to download the PDF of the credit note.
    @constraint:String {maxLength: 5000}
    string pdf;
    # Reason for issuing this credit note, one of `duplicate`, `fraudulent`, `order_change`, or `product_unsatisfactory`
    "duplicate"|"fraudulent"|"order_change"|"product_unsatisfactory" reason?;
    # Refund related to this credit note.
    string|Refund? refund?;
    # Status of this credit note, one of `issued` or `void`. Learn more about [voiding credit notes](https://stripe.com/docs/billing/invoices/credit-notes#voiding).
    "issued"|"void" status;
    # The integer amount in %s representing the amount of the credit note, excluding tax and invoice level discounts.
    int subtotal;
    # The aggregate amounts calculated per tax rate for all line items.
    Credit_note_tax_amount[] tax_amounts;
    # The integer amount in %s representing the total amount of the credit note, including tax and all discount.
    int total;
    # Type of this credit note, one of `pre_payment` or `post_payment`. A `pre_payment` credit note means it was issued when the invoice was open. A `post_payment` credit note means it was issued when the invoice was paid.
    "post_payment"|"pre_payment" 'type;
    # The time that the credit note was voided.
    int? voided_at?;
};

# 
public type Account_requirements record {
    # Date by which the fields in `currently_due` must be collected to keep the account enabled. These fields may disable the account sooner if the next threshold is reached before they are collected.
    int? current_deadline?;
    # Fields that need to be collected to keep the account enabled. If not collected by `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
    Account_requirementsCurrentlydueItemsString[]? currently_due?;
    # If the account is disabled, this string describes why. Can be `requirements.past_due`, `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`, `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.
    string? disabled_reason?;
    # Fields that are `currently_due` and need to be collected again because validation or verification failed.
    Account_requirements_error[]? errors?;
    # Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in `currently_due` as well, and `current_deadline` becomes set.
    Account_requirementsEventuallydueItemsString[]? eventually_due?;
    # Fields that weren't collected by `current_deadline`. These fields need to be collected to enable the account.
    Account_requirementsPastdueItemsString[]? past_due?;
    # Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to `eventually_due`, `currently_due`, or `past_due`.
    Account_requirementsPendingverificationItemsString[]? pending_verification?;
};

# 
public type Gelato_verification_report_options record {
    # 
    Gelato_report_document_options document?;
    # 
    Gelato_report_id_number_options id_number?;
};

# 
public type Payment_method_acss_debit record {
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Institution number of the bank account.
    string? institution_number?;
    # Last four digits of the bank account number.
    string? last4?;
    # Transit number of the bank account.
    string? transit_number?;
};

public type Billing_details_address record {
    @constraint:String {maxLength: 5000}
    string city?;
    @constraint:String {maxLength: 5000}
    string country?;
    @constraint:String {maxLength: 5000}
    string line1?;
    @constraint:String {maxLength: 5000}
    string line2?;
    @constraint:String {maxLength: 5000}
    string postal_code?;
    @constraint:String {maxLength: 5000}
    string state?;
};

# 
public type Payment_method_details_interac_present record {
    # Card brand. Can be `interac`, `mastercard` or `visa`.
    string? brand?;
    # The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`).
    string? cardholder_name?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Authorization response cryptogram.
    string? emv_auth_data?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string? funding?;
    # ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
    string? generated_card?;
    # The last four digits of the card.
    string? last4?;
    # Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? network?;
    # EMV tag 5F2D. Preferred languages specified by the integrated circuit chip.
    Payment_method_details_interac_presentPreferredlocalesItemsString[]? preferred_locales?;
    # How card details were read in this transaction.
    "contact_emv"|"contactless_emv"|"contactless_magstripe_mode"|"magnetic_stripe_fallback"|"magnetic_stripe_track2" read_method?;
    # A collection of fields required to be displayed on receipts. Only required for EMV transactions.
    Payment_method_details_interac_present_receipt? receipt?;
};

public type GetInvoicesUpcomingRequestBody record {
    Item_billing_thresholds_param|"" billing_thresholds?;
    boolean clear_usage?;
    boolean deleted?;
    @constraint:String {maxLength: 5000}
    string id?;
    record {|string...;|}|"" metadata?;
    @constraint:String {maxLength: 5000}
    string price?;
    Recurring_price_data_1 price_data?;
    int quantity?;
    TaxratesItemsString[]|"" tax_rates?;
};

# 
public type Source_redirect_flow record {
    # The failure reason for the redirect, either `user_abort` (the customer aborted or dropped out of the redirect flow), `declined` (the authentication failed or the transaction was declined), or `processing_error` (the redirect failed due to a technical error). Present only if the redirect status is `failed`.
    string? failure_reason?;
    # The URL you provide to redirect the customer to after they authenticated their payment.
    @constraint:String {maxLength: 5000}
    string return_url;
    # The status of the redirect, either `pending` (ready to be used by your customer to authenticate the transaction), `succeeded` (succesful authentication, cannot be reused) or `not_required` (redirect should not be used) or `failed` (failed authentication, cannot be reused).
    @constraint:String {maxLength: 5000}
    string status;
    # The URL provided to you to redirect a customer to as part of a `redirect` authentication flow.
    @constraint:String {maxLength: 2048}
    string url;
};

public type Subscription_schedules_param_1 record {
    int days_until_due?;
};

# The cardholder’s billing information
public type Issuing_cardholder_address record {
    # 
    Address address;
};

# 
public type Invoice_setting_quote_setting record {
    # Number of days within which a customer must pay invoices generated by this quote. This value will be `null` for quotes where `collection_method=charge_automatically`.
    int? days_until_due?;
};

# 
public type Offline_acceptance record {
};

# Result from a document check
public type Gelato_document_report record {
    # Address as it appears in the document.
    Address? address?;
    # Date of birth as it appears in the document.
    Gelato_data_document_report_date_of_birth? dob?;
    # Details on the verification error. Present when status is `unverified`.
    Gelato_document_report_error? 'error?;
    # Expiration date of the document.
    Gelato_data_document_report_expiration_date? expiration_date?;
    # Array of [File](https://stripe.com/docs/api/files) ids containing images for this document.
    Gelato_document_reportFilesItemsString[]? files?;
    # First name as it appears in the document.
    string? first_name?;
    # Issued date of the document.
    Gelato_data_document_report_issued_date? issued_date?;
    # Issuing country of the document.
    string? issuing_country?;
    # Last name as it appears in the document.
    string? last_name?;
    # Document ID number.
    string? number?;
    # Status of this `document` check.
    "unverified"|"verified" status;
    # Type of the document.
    "driving_license"|"id_card"|"passport" 'type?;
};

# 
public type Deleted_radarValue_list record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "radar.value_list" 'object;
};

# The dimensions of this product for shipping purposes.
public type Package_dimensions_specs record {
    decimal height;
    decimal length;
    decimal weight;
    decimal width;
};

# 
public type Payment_method_details_bancontact record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Payment_method? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    # Can be one of `en`, `de`, `fr`, or `nl`
    "de"|"en"|"fr"|"nl" preferred_language?;
    # Owner's verified full name. Values are verified or provided by Bancontact directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# A `Transfer` object is created when you move funds between Stripe accounts as
# part of Connect.
# 
# Before April 6, 2017, transfers also represented movement of funds from a
# Stripe account to a card or bank account. This behavior has since been split
# out into a [Payout](https://stripe.com/docs/api#payout_object) object, with corresponding payout endpoints. For more
# information, read about the
# [transfer/payout split](https://stripe.com/docs/transfer-payout-split).
# 
# Related guide: [Creating Separate Charges and Transfers](https://stripe.com/docs/connect/charges-transfers).
public type Transfer record {
    # Amount in %s to be transferred.
    int amount;
    # Amount in %s reversed (can be less than the amount attribute on the transfer if a partial reversal was issued).
    int amount_reversed;
    # Balance transaction that describes the impact of this transfer on your account balance.
    string|Balance_transaction? balance_transaction?;
    # Time that this record of the transfer was first created.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # ID of the Stripe account the transfer was sent to.
    string|Account? destination?;
    # If the destination is a Stripe account, this will be the ID of the payment that the destination account received for the transfer.
    string|Charge destination_payment?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "transfer" 'object;
    # A list of reversals that have been applied to the transfer.
    TransferReversalList reversals;
    # Whether the transfer has been fully reversed. If the transfer is only partially reversed, this attribute will still be false.
    boolean reversed;
    # ID of the charge or payment that was used to fund the transfer. If null, the transfer was funded from the available balance.
    string|Charge? source_transaction?;
    # The source balance this transfer came from. One of `card`, `fpx`, or `bank_account`.
    string? source_type?;
    # A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
    string? transfer_group?;
};

# Account Links are the means by which a Connect platform grants a connected account permission to access
# Stripe-hosted applications, such as Connect Onboarding.
# 
# Related guide: [Connect Onboarding](https://stripe.com/docs/connect/connect-onboarding).
public type Account_link record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The timestamp at which this account link will expire.
    int expires_at;
    # String representing the object's type. Objects of the same type share the same value.
    "account_link" 'object;
    # The URL for the account link.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Promotion_codes_resource_restrictions record {
    # A Boolean indicating if the Promotion Code should only be redeemed for Customers without any successful payments or invoices
    boolean first_time_transaction;
    # Minimum amount required to redeem this Promotion Code into a Coupon (e.g., a purchase must be $100 or more to work).
    int? minimum_amount?;
    # Three-letter [ISO code](https://stripe.com/docs/currencies) for minimum_amount
    string? minimum_amount_currency?;
};

# 
public type Source_mandate_notification_sepa_debit_data record {
    # SEPA creditor ID.
    @constraint:String {maxLength: 5000}
    string creditor_identifier?;
    # Last 4 digits of the account number associated with the debit.
    @constraint:String {maxLength: 5000}
    string last4?;
    # Mandate reference associated with the debit.
    @constraint:String {maxLength: 5000}
    string mandate_reference?;
};

# The line items that will appear on the next invoice after this quote is accepted. This does not include pending invoice items that exist on the customer but may still be included in the next invoice.
public type QuotesResourceListLineItems_1 record {
    # Details about each object.
    Item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

public type Source_type_three_d_secure record {
    string? address_line1_check?;
    string? address_zip_check?;
    boolean? authenticated?;
    string? brand?;
    string? card?;
    string? country?;
    string? customer?;
    string? cvc_check?;
    string? dynamic_last4?;
    int? exp_month?;
    int? exp_year?;
    string fingerprint?;
    string? funding?;
    string? last4?;
    string? name?;
    string three_d_secure?;
    string? tokenization_method?;
};

# A Connection Token is used by the Stripe Terminal SDK to connect to a reader.
# 
# Related guide: [Fleet Management](https://stripe.com/docs/terminal/creating-locations).
public type TerminalConnection_token record {
    # The id of the location that this connection token is scoped to. Note that location scoping only applies to internet-connected readers. For more details, see [the docs on scoping connection tokens](https://stripe.com/docs/terminal/readers/fleet-management#connection-tokens).
    @constraint:String {maxLength: 5000}
    string location?;
    # String representing the object's type. Objects of the same type share the same value.
    "terminal.connection_token" 'object;
    # Your application should pass this token to the Stripe Terminal SDK.
    @constraint:String {maxLength: 5000}
    string secret;
};

public type Subscription_cancel_at int|"";

# To share the contents of a `File` object with non-Stripe users, you can
# create a `FileLink`. `FileLink`s contain a URL that can be used to
# retrieve the contents of the file without authentication.
public type File_link record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Whether this link is already expired.
    boolean expired;
    # Time at which the link expires.
    int? expires_at?;
    # The file object this link points to.
    string|File file;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "file_link" 'object;
    # The publicly accessible URL to download the file.
    string? url?;
};

# 
public type Portal_subscription_update record {
    # The types of subscription updates that are supported for items listed in the `products` attribute. When empty, subscriptions are not updateable.
    ("price"|"promotion_code"|"quantity")[] default_allowed_updates;
    # Whether the feature is enabled.
    boolean enabled;
    # The list of products that support subscription updates.
    Portal_subscription_update_product[]? products?;
    # Determines how to handle prorations resulting from subscription updates. Valid values are `none`, `create_prorations`, and `always_invoice`.
    "always_invoice"|"create_prorations"|"none" proration_behavior;
};

# 
public type Balance_amount record {
    # Balance amount.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # 
    Balance_amount_by_source_type source_types?;
};

# 
public type Bitcoin_receiver record {
    # True when this bitcoin receiver has received a non-zero amount of bitcoin.
    boolean active;
    # The amount of `currency` that you are collecting as payment.
    int amount;
    # The amount of `currency` to which `bitcoin_amount_received` has been converted.
    int amount_received;
    # The amount of bitcoin that the customer should send to fill the receiver. The `bitcoin_amount` is denominated in Satoshi: there are 10^8 Satoshi in one bitcoin.
    int bitcoin_amount;
    # The amount of bitcoin that has been sent by the customer to this receiver.
    int bitcoin_amount_received;
    # This URI can be displayed to the customer as a clickable link (to activate their bitcoin client) or as a QR code (for mobile wallets).
    @constraint:String {maxLength: 5000}
    string bitcoin_uri;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which the bitcoin will be converted.
    string currency;
    # The customer ID of the bitcoin receiver.
    string? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The customer's email address, set by the API call that creates the receiver.
    string? email?;
    # This flag is initially false and updates to true when the customer sends the `bitcoin_amount` to this receiver.
    boolean filled;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # A bitcoin address that is specific to this receiver. The customer can send bitcoin to this address to fill the receiver.
    @constraint:String {maxLength: 5000}
    string inbound_address;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "bitcoin_receiver" 'object;
    # The ID of the payment created from the receiver, if any. Hidden when viewing the receiver with a publishable key.
    string? payment?;
    # The refund address of this bitcoin receiver.
    string? refund_address?;
    # A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
    BitcoinTransactionList transactions?;
    # This receiver contains uncaptured funds that can be used for a payment or refunded.
    boolean uncaptured_funds;
    # Indicate if this source is used for payment.
    boolean? used_for_payment?;
};

# 
public type Apple_pay_domain record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    @constraint:String {maxLength: 5000}
    string domain_name;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "apple_pay_domain" 'object;
};

# 
public type Payment_method_details_boleto record {
    # Uniquely identifies this customer tax_id (CNPJ or CPF)
    @constraint:String {maxLength: 5000}
    string tax_id;
};

# 
public type Deleted_bank_account record {
    # Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
    string? currency?;
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "bank_account" 'object;
};

# 
public type Payment_method_options_card_present record {
};

# Automatic tax configuration details
public type Schedules_phase_automatic_tax record {
    # Whether Stripe automatically computes tax on invoices created during this phase.
    boolean enabled;
};

# 
public type Account_card_payments_settings record {
    # 
    Account_decline_charge_on decline_on?;
    # The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge. `statement_descriptor_prefix` is useful for maximizing descriptor space for the dynamic portion.
    string? statement_descriptor_prefix?;
};

# 
public type Payment_method_au_becs_debit record {
    # Six-digit number identifying bank and branch associated with this bank account.
    string? bsb_number?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
};

# 
public type Notification_event_data record {
    # Object containing the API resource relevant to the event. For example, an `invoice.created` event will have a full [invoice object](https://stripe.com/docs/api#invoice_object) as the value of the object key.
    record {} 'object;
    # Object containing the names of the attributes that have changed, and their previous values (sent along only with *.updated events).
    record {} previous_attributes?;
};

# 
public type Payment_method_details_card_present record {
    # Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? brand?;
    # The cardholder name as read from the card, in [ISO 7813](https://en.wikipedia.org/wiki/ISO/IEC_7813) format. May include alphanumeric characters, special characters and first/last name separator (`/`).
    string? cardholder_name?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Authorization response cryptogram.
    string? emv_auth_data?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string? funding?;
    # ID of a card PaymentMethod generated from the card_present PaymentMethod that may be attached to a Customer for future transactions. Only present if it was possible to generate a card PaymentMethod.
    string? generated_card?;
    # The last four digits of the card.
    string? last4?;
    # Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? network?;
    # How card details were read in this transaction.
    "contact_emv"|"contactless_emv"|"contactless_magstripe_mode"|"magnetic_stripe_fallback"|"magnetic_stripe_track2" read_method?;
    # A collection of fields required to be displayed on receipts. Only required for EMV transactions.
    Payment_method_details_card_present_receipt? receipt?;
};

public type Subscription_items_item_body record {|
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. When updating, pass an empty string to remove previously-defined thresholds.
    Billing_thresholds|"" billing_thresholds?;
    # Specifies which fields in the response should be expanded.
    Subscription_items_item_bodyExpandItemsString[] expand?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    Additional_properties|"" metadata?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted.
    boolean off_session?;
    # Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.
    # 
    # Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice's payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method.
    # 
    # Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).
    # 
    # Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
    "allow_incomplete"|"default_incomplete"|"error_if_incomplete"|"pending_if_incomplete" payment_behavior?;
    # The ID of the price object. When changing a subscription item's price, `quantity` is set to 1 unless a `quantity` parameter is provided.
    @constraint:String {maxLength: 5000}
    string price?;
    # Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
    Recurring_price_data price_data?;
    # Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.
    # 
    # Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.
    # 
    # Prorations can be disabled by passing `none`.
    "always_invoice"|"create_prorations"|"none" proration_behavior?;
    # If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply the same proration that was previewed with the [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint.
    int proration_date?;
    # The quantity you'd like to apply to the subscription item you're creating.
    int quantity?;
    # A list of [Tax Rate](https://stripe.com/docs/api/tax_rates) ids. These Tax Rates will override the [`default_tax_rates`](https://stripe.com/docs/api/subscriptions/create#create_subscription-default_tax_rates) on the Subscription. When updating, pass an empty string to remove previously-defined tax rates.
    Tax_rate_array|"" tax_rates?;
|};

# Point in Time
public type Gelato_data_verified_outputs_date record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type Invoice_setting_subscription_schedule_setting record {
    # Number of days within which a customer must pay invoices generated by this subscription schedule. This value will be `null` for subscription schedules where `billing=charge_automatically`.
    int? days_until_due?;
};

# 
public type Deleted_discount record {
    # The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
    string? checkout_session?;
    # A coupon contains information about a percent-off or amount-off discount you
    # might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
    # [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
    Coupon coupon;
    # The ID of the customer associated with this discount.
    string|Customer|Deleted_customer? customer?;
    # Always true for a deleted object
    true deleted;
    # The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
    @constraint:String {maxLength: 5000}
    string id;
    # The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
    string? invoice?;
    # The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
    string? invoice_item?;
    # String representing the object's type. Objects of the same type share the same value.
    "discount" 'object;
    # The promotion code applied to create this discount.
    string|Promotion_code? promotion_code?;
    # Date that the coupon was applied.
    int 'start;
    # The subscription that this coupon is applied to, if it is applied to a particular subscription.
    string? subscription?;
};

public type Subscription_default_tax_rates SubscriptiondefaulttaxratesItemsString[]|"";

# A VerificationReport is the result of an attempt to collect and verify data from a user.
# The collection of verification checks performed is determined from the `type` and `options`
# parameters used. You can find the result of each verification check performed in the
# appropriate sub-resource: `document`, `id_number`, `selfie`.
# 
# Each VerificationReport contains a copy of any data collected by the user as well as
# reference IDs which can be used to access collected images through the [FileUpload](https://stripe.com/docs/api/files)
# API. To configure and create VerificationReports, use the
# [VerificationSession](https://stripe.com/docs/api/identity/verification_sessions) API.
# 
# Related guides: [Accessing verification results](https://stripe.com/docs/identity/verification-sessions#results).
public type IdentityVerification_report record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Result from a document check
    Gelato_document_report document?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Result from an id_number check
    Gelato_id_number_report id_number?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "identity.verification_report" 'object;
    # 
    Gelato_verification_report_options options;
    # Result from a selfie check
    Gelato_selfie_report selfie?;
    # Type of report.
    "document"|"id_number" 'type;
    # ID of the VerificationSession that created this report.
    string? verification_session?;
};

# 
public type Source_mandate_notification_acss_debit_data record {
    # The statement descriptor associate with the debit.
    @constraint:String {maxLength: 5000}
    string statement_descriptor?;
};

# The customer's current subscriptions, if any.
public type SubscriptionList record {
    # Details about each object.
    Subscription[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments.
# For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment.
# Later, you can use [PaymentIntents](https://stripe.com/docs/api#payment_intents) to drive the payment flow.
# 
# Create a SetupIntent as soon as you're ready to collect your customer's payment credentials.
# Do not maintain long-lived, unconfirmed SetupIntents as they may no longer be valid.
# The SetupIntent then transitions through multiple [statuses](https://stripe.com/docs/payments/intents#intent-statuses) as it guides
# you through the setup process.
# 
# Successful SetupIntents result in payment credentials that are optimized for future payments.
# For example, cardholders in [certain regions](/guides/strong-customer-authentication) may need to be run through
# [Strong Customer Authentication](https://stripe.com/docs/strong-customer-authentication) at the time of payment method collection
# in order to streamline later [off-session payments](https://stripe.com/docs/payments/setup-intents).
# If the SetupIntent is used with a [Customer](https://stripe.com/docs/api#setup_intent_object-customer), upon success,
# it will automatically attach the resulting payment method to that Customer.
# We recommend using SetupIntents or [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage) on
# PaymentIntents to save payment methods in order to prevent saving invalid or unoptimized payment methods.
# 
# By using SetupIntents, you ensure that your customers experience the minimum set of required friction,
# even as regulations change over time.
# 
# Related guide: [Setup Intents API](https://stripe.com/docs/payments/setup-intents).
public type Setup_intent record {
    # ID of the Connect application that created the SetupIntent.
    string|Application? application?;
    # Reason for cancellation of this SetupIntent, one of `abandoned`, `requested_by_customer`, or `duplicate`.
    "abandoned"|"duplicate"|"requested_by_customer" cancellation_reason?;
    # The client secret of this SetupIntent. Used for client-side retrieval using a publishable key.
    # 
    # The client secret can be used to complete payment setup from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
    string? client_secret?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # ID of the Customer this SetupIntent belongs to, if one exists.
    # 
    # If present, the SetupIntent's payment method will be attached to the Customer on successful setup. Payment methods attached to other Customers cannot be used with this SetupIntent.
    string|Customer|Deleted_customer? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The error encountered in the previous SetupIntent confirmation.
    Api_errors? last_setup_error?;
    # The most recent SetupAttempt for this SetupIntent.
    string|Setup_attempt? latest_attempt?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # ID of the multi use Mandate generated by the SetupIntent.
    string|Mandate? mandate?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # If present, this property tells you what actions you need to take in order for your customer to continue payment setup.
    Setup_intent_next_action? next_action?;
    # String representing the object's type. Objects of the same type share the same value.
    "setup_intent" 'object;
    # The account (if any) for which the setup is intended.
    string|Account? on_behalf_of?;
    # ID of the payment method used with this SetupIntent.
    string|Payment_method? payment_method?;
    # Payment-method-specific configuration for this SetupIntent.
    Setup_intent_payment_method_options? payment_method_options?;
    # The list of payment method types (e.g. card) that this SetupIntent is allowed to set up.
    Setup_intentPaymentmethodtypesItemsString[] payment_method_types;
    # ID of the single_use Mandate generated by the SetupIntent.
    string|Mandate? single_use_mandate?;
    # [Status](https://stripe.com/docs/payments/intents#intent-statuses) of this SetupIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `canceled`, or `succeeded`.
    "canceled"|"processing"|"requires_action"|"requires_confirmation"|"requires_payment_method"|"succeeded" status;
    # Indicates how the payment method is intended to be used in the future.
    # 
    # Use `on_session` if you intend to only reuse the payment method when the customer is in your checkout flow. Use `off_session` if your customer may or may not be in your checkout flow. If not provided, this value defaults to `off_session`.
    @constraint:String {maxLength: 5000}
    string usage;
};

# List of items contained within this value list.
public type RadarListListItemList record {
    # Details about each object.
    RadarValue_list_item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

public type Tax_param_1 record {
    string|"" ip_address?;
};

# 
public type Payment_method_details_wechat record {
};

# 
public type UsageEventsResourceUsageRecordSummaryList record {
    Usage_record_summary[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Gelato_report_id_number_options record {
};

# A list of refunds that have been applied to the charge.
public type RefundList record {
    # Details about each object.
    Refund[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Payment_method_details_bacs_debit record {
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # ID of the mandate used to make this payment.
    string? mandate?;
    # Sort code of the bank account. (e.g., `10-20-30`)
    string? sort_code?;
};

# 
public type Quotes_resource_computed record {
    # The definitive totals and line items the customer will be charged on a recurring basis. Takes into account the line items with recurring prices and discounts with `duration=forever` coupons only. Defaults to `null` if no inputted line items with recurring prices.
    Quotes_resource_recurring? recurring?;
    # 
    Quotes_resource_upfront upfront;
};

# 
public type Issuing_authorization_verification_data record {
    # Whether the cardholder provided an address first line and if it matched the cardholder’s `billing.address.line1`.
    "match"|"mismatch"|"not_provided" address_line1_check;
    # Whether the cardholder provided a postal code and if it matched the cardholder’s `billing.address.postal_code`.
    "match"|"mismatch"|"not_provided" address_postal_code_check;
    # Whether the cardholder provided a CVC and if it matched Stripe’s record.
    "match"|"mismatch"|"not_provided" cvc_check;
    # Whether the cardholder provided an expiry date and if it matched Stripe’s record.
    "match"|"mismatch"|"not_provided" expiry_check;
};

# 
public type Source_owner record {
    # Owner's address.
    Address? address?;
    # Owner's email address.
    string? email?;
    # Owner's full name.
    string? name?;
    # Owner's phone number (including extension).
    string? phone?;
    # Verified owner's address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? verified_address?;
    # Verified owner's email address. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_email?;
    # Verified owner's full name. Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
    # Verified owner's phone number (including extension). Verified values are verified or provided by the payment method directly (and if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_phone?;
};

public type Source_type_giropay record {
    string? bank_code?;
    string? bank_name?;
    string? bic?;
    string? statement_descriptor?;
};

# 
public type Tax_deducted_at_source record {
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "tax_deducted_at_source" 'object;
    # The end of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.
    int period_end;
    # The start of the invoicing period. This TDS applies to Stripe fees collected during this invoicing period.
    int period_start;
    # The TAN that was supplied to Stripe when TDS was assessed
    @constraint:String {maxLength: 5000}
    string tax_deduction_account_number;
};

# An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.
# 
# Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
public type IssuingCardholder record {
    # The cardholder’s billing information
    Issuing_cardholder_address billing;
    # Additional information about a `company` cardholder.
    Issuing_cardholder_company? company?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The cardholder's email address.
    string? email?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Additional information about an `individual` cardholder.
    Issuing_cardholder_individual? individual?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # The cardholder's name. This will be printed on cards issued to them.
    @constraint:String {maxLength: 5000}
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    "issuing.cardholder" 'object;
    # The cardholder's phone number. This is required for all cardholders who will be creating EU cards. See the [3D Secure documentation](https://stripe.com/docs/issuing/3d-secure#when-is-3d-secure-applied) for more details.
    string? phone_number?;
    # 
    Issuing_cardholder_requirements requirements;
    # Rules that control spending across this cardholder's cards. Refer to our [documentation](https://stripe.com/docs/issuing/controls/spending-controls) for more details.
    Issuing_cardholder_authorization_controls? spending_controls?;
    # Specifies whether to permit authorizations on this cardholder's cards.
    "active"|"blocked"|"inactive" status;
    # One of `individual` or `company`.
    "company"|"individual" 'type;
};

# 
public type Ephemeral_key record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Time at which the key will expire. Measured in seconds since the Unix epoch.
    int expires;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "ephemeral_key" 'object;
    # The key's secret. You can use this value to make authorized requests to the Stripe API.
    @constraint:String {maxLength: 5000}
    string secret?;
};

# 
public type Notification_event_request record {
    # ID of the API request that caused the event. If null, the event was automatic (e.g., Stripe's automatic subscription handling). Request logs are available in the [dashboard](https://dashboard.stripe.com/logs), but currently not in the API.
    string? id?;
    # The idempotency key transmitted during the request, if any. *Note: This property is populated only for events on or after May 23, 2017*.
    string? idempotency_key?;
};

# A portal configuration describes the functionality and behavior of a portal session.
public type Billing_portalConfiguration record {
    # Whether the configuration is active and can be used to create portal sessions.
    boolean active;
    # ID of the Connect Application that created the configuration.
    string? application?;
    # 
    Portal_business_profile business_profile;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The default URL to redirect customers to when they click on the portal's link to return to your website. This can be [overriden](https://stripe.com/docs/api/customer_portal/sessions/create#create_portal_session-return_url) when creating the session.
    string? default_return_url?;
    # 
    Portal_features features;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Whether the configuration is the default. If `true`, this configuration can be managed in the Dashboard and portal sessions will use this configuration unless it is overriden when creating the session.
    boolean is_default;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "billing_portal.configuration" 'object;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int updated;
};

# 
public type Customer_tax record {
    # Surfaces if automatic tax computation is possible given the current customer location information.
    "failed"|"not_collecting"|"supported"|"unrecognized_location" automatic_tax;
    # A recent IP address of the customer used for tax reporting and tax location inference.
    string? ip_address?;
    # The customer's location as identified by Stripe Tax.
    Customer_tax_location? location?;
};

# 
public type Connect_collection_transfer record {
    # Amount transferred, in %s.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the account that funds are being collected for.
    string|Account destination;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "connect_collection_transfer" 'object;
};

# 
public type Payment_method_details_fpx record {
    # The customer's bank. Can be one of `affin_bank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.
    "affin_bank"|"alliance_bank"|"ambank"|"bank_islam"|"bank_muamalat"|"bank_rakyat"|"bsn"|"cimb"|"deutsche_bank"|"hong_leong_bank"|"hsbc"|"kfh"|"maybank2e"|"maybank2u"|"ocbc"|"pb_enterprise"|"public_bank"|"rhb"|"standard_chartered"|"uob" bank;
    # Unique transaction id generated by FPX for every request from the merchant
    string? transaction_id?;
};

# 
public type Payment_method_options_oxxo record {
    # The number of calendar days before an OXXO invoice expires. For example, if you create an OXXO invoice on Monday and you set expires_after_days to 2, the OXXO invoice will expire on Wednesday at 23:59 America/Mexico_City time.
    int expires_after_days;
};

# 
public type Subscription_billing_thresholds record {
    # Monetary threshold that triggers the subscription to create an invoice
    int? amount_gte?;
    # Indicates if the `billing_cycle_anchor` should be reset when a threshold is reached. If true, `billing_cycle_anchor` will be updated to the date/time the threshold was last reached; otherwise, the value will remain unchanged. This value may not be `true` if the subscription contains items with plans that have `aggregate_usage=last_ever`.
    boolean? reset_billing_cycle_anchor?;
};

public type Subscription_billing_cycle_anchor_1 "now"|"unchanged"|int;

# 
public type Payment_method_details_au_becs_debit record {
    # Bank-State-Branch number of the bank account.
    string? bsb_number?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # ID of the mandate used to make this payment.
    @constraint:String {maxLength: 5000}
    string mandate?;
};

public type Automatic_tax_param_1 record {
    boolean enabled;
};

# A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
public type FileFileLinkList record {
    # Details about each object.
    File_link[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Payment_method_details_card_wallet_amex_express_checkout record {
};

public type Automatic_tax_param_2 record {
    boolean enabled;
};

# 
public type Issuing_cardholder_individual record {
    # The date of birth of this cardholder.
    Issuing_cardholder_individual_dob? dob?;
    # The first name of this cardholder.
    @constraint:String {maxLength: 5000}
    string first_name;
    # The last name of this cardholder.
    @constraint:String {maxLength: 5000}
    string last_name;
    # Government-issued ID document for this cardholder.
    Issuing_cardholder_verification? verification?;
};

public type Source_type_ideal record {
    string? bank?;
    string? bic?;
    string? iban_last4?;
    string? statement_descriptor?;
};

# These fields can be used to create a new product that this price will belong to.
public type Inline_product_params record {
    # Whether the product is currently available for purchase. Defaults to true.
    boolean active?;
    # The ID of the product that this price will belong to.
    @constraint:String {maxLength: 5000}
    string id?;
    # Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to metadata
    record {|string...;|} metadata?;
    # The product’s name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions
    @constraint:String {maxLength: 5000}
    string name;
    # An arbitrary string to be displayed on your customer’s credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all
    @constraint:String {maxLength: 22}
    string statement_descriptor?;
    # A tax code ID
    @constraint:String {maxLength: 5000}
    string tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions
    @constraint:String {maxLength: 12}
    string unit_label?;
};

# 
public type Payment_method_details_card_wallet_visa_checkout record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# 
public type Price_tier record {
    # Price for the entire tier.
    int? flat_amount?;
    # Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
    string? flat_amount_decimal?;
    # Per unit price for units relevant to the tier.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
    # Up to and including to this quantity will be contained in the tier.
    int? up_to?;
};

# `Exchange Rate` objects allow you to determine the rates that Stripe is
# currently using to convert from one currency to another. Since this number is
# variable throughout the day, there are various reasons why you might want to
# know the current rate (for example, to dynamically price an item for a user
# with a default payment in a foreign currency).
# 
# If you want a guarantee that the charge is made with a certain exchange rate
# you expect is current, you can pass in `exchange_rate` to charges endpoints.
# If the value is no longer up to date, the charge won't go through. Please
# refer to our [Exchange Rates API](https://stripe.com/docs/exchange-rates) guide for more
# details.
public type Exchange_rate record {
    # Unique identifier for the object. Represented as the three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html) in lowercase.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "exchange_rate" 'object;
    # Hash where the keys are supported currencies and the values are the exchange rate at which the base id currency converts to the key currency.
    record {||} rates;
};

# Point in Time
public type Gelato_data_document_report_issued_date record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type Payment_method_details_card_wallet record {
    # 
    Payment_method_details_card_wallet_amex_express_checkout amex_express_checkout?;
    # 
    Payment_method_details_card_wallet_apple_pay apple_pay?;
    # (For tokenized numbers only.) The last four digits of the device account number.
    string? dynamic_last4?;
    # 
    Payment_method_details_card_wallet_google_pay google_pay?;
    # 
    Payment_method_details_card_wallet_masterpass masterpass?;
    # 
    Payment_method_details_card_wallet_samsung_pay samsung_pay?;
    # The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
    "amex_express_checkout"|"apple_pay"|"google_pay"|"masterpass"|"samsung_pay"|"visa_checkout" 'type;
    # 
    Payment_method_details_card_wallet_visa_checkout visa_checkout?;
};

# 
public type Charge_transfer_data record {
    # The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account.
    int? amount?;
    # ID of an existing, connected Stripe account to transfer funds to if `transfer_data` was specified in the charge request.
    string|Account destination;
};

public type Optional_fields_address record {
    @constraint:String {maxLength: 5000}
    string city?;
    @constraint:String {maxLength: 5000}
    string country?;
    @constraint:String {maxLength: 5000}
    string line1?;
    @constraint:String {maxLength: 5000}
    string line2?;
    @constraint:String {maxLength: 5000}
    string postal_code?;
    @constraint:String {maxLength: 5000}
    string state?;
};

public type Invoices_invoice_body record {|
    # The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
    AccounttaxidsItemsString[]|"" account_tax_ids?;
    # A fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
    int application_fee_amount?;
    # Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice.
    boolean auto_advance?;
    # Settings for automatic tax lookup for this invoice.
    Automatic_tax_param automatic_tax?;
    # Either `charge_automatically` or `send_invoice`. This field can be updated only on `draft` invoices.
    "charge_automatically"|"send_invoice" collection_method?;
    # A list of up to 4 custom fields to be displayed on the invoice. If a value for `custom_fields` is specified, the list specified will replace the existing custom field list on this invoice. Pass an empty string to remove previously-defined fields.
    Invoice_settings_custom_fields|"" custom_fields?;
    # The number of days from which the invoice is created until it is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
    int days_until_due?;
    # ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    # ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
    @constraint:String {maxLength: 5000}
    string default_source?;
    # The tax rates that will apply to any line item that does not have `tax_rates` set. Pass an empty string to remove previously-defined tax rates.
    DefaulttaxratesItemsString[]|"" default_tax_rates?;
    # An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
    @constraint:String {maxLength: 1500}
    string description?;
    # The discounts that will apply to the invoice. Pass an empty string to remove previously-defined discounts.
    Discounts_data_param|"" discounts?;
    # The date on which payment for this invoice is due. Only valid for invoices where `collection_method=send_invoice`. This field can only be updated on `draft` invoices.
    int due_date?;
    # Specifies which fields in the response should be expanded.
    Invoices_invoice_bodyExpandItemsString[] expand?;
    # Footer to be displayed on the invoice.
    @constraint:String {maxLength: 5000}
    string footer?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
    # The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.
    string|"" on_behalf_of?;
    # Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
    Payment_settings payment_settings?;
    # Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`.
    @constraint:String {maxLength: 22}
    string statement_descriptor?;
    # If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge. This will be unset if you POST an empty value.
    Discounts_data_param|"" transfer_data?;
|};

# 
public type Setup_intent_next_action record {
    # 
    Setup_intent_next_action_redirect_to_url redirect_to_url?;
    # Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`, `alipay_handle_redirect`, or `oxxo_display_details`.
    @constraint:String {maxLength: 5000}
    string 'type;
    # When confirming a SetupIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
    record {} use_stripe_sdk?;
    # 
    Setup_intent_next_action_verify_with_microdeposits verify_with_microdeposits?;
};

# 
public type Three_d_secure_usage record {
    # Whether 3D Secure is supported on this card.
    boolean supported;
};

public type V1_subscriptions_body record {|
    # A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 20 items.
    Add_invoice_item_entry[] add_invoice_items?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
    decimal application_fee_percent?;
    # Automatic tax settings for this subscription.
    Automatic_tax_config automatic_tax?;
    # For new subscriptions, a past timestamp to backdate the subscription's start date to. If set, the first invoice will contain a proration for the timespan between the start date and the current time. Can be combined with trials and the billing cycle anchor.
    int backdate_start_date?;
    # A future timestamp to anchor the subscription's [billing cycle](https://stripe.com/docs/subscriptions/billing-cycle). This is used to determine the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
    int billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
    Billing_threshold_params|"" billing_thresholds?;
    # A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
    int cancel_at?;
    # Boolean indicating whether this subscription should cancel at the end of the current period.
    boolean cancel_at_period_end?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
    "charge_automatically"|"send_invoice" collection_method?;
    # The ID of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
    @constraint:String {maxLength: 5000}
    string coupon?;
    # The identifier of the customer to subscribe.
    @constraint:String {maxLength: 5000}
    string customer;
    # Number of days a customer has to pay invoices generated by this subscription. Valid only for subscriptions where `collection_method` is set to `send_invoice`.
    int days_until_due?;
    # ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    # ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    @constraint:String {maxLength: 5000}
    string default_source?;
    # The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
    Tax_rate_array|"" default_tax_rates?;
    # Specifies which fields in the response should be expanded.
    V1_subscriptions_bodyExpandItemsString[] expand?;
    # A list of up to 20 subscription items, each with an attached price.
    Subscription_item_create_params[] items?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    Additional_properties|"" metadata?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted.
    boolean off_session?;
    # Use `allow_incomplete` to create subscriptions with `status=incomplete` if the first invoice cannot be paid. Creating subscriptions with this status allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.
    # 
    # Use `default_incomplete` to create Subscriptions with `status=incomplete` when the first invoice requires payment, otherwise start as active. Subscriptions transition to `status=active` when successfully confirming the payment intent on the first invoice. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method. If the payment intent is not confirmed within 23 hours subscriptions transition to `status=incomplete_expired`, which is a terminal state.
    # 
    # Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's first invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not create a subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
    # 
    # `pending_if_incomplete` is only used with updates and cannot be passed when creating a subscription.
    "allow_incomplete"|"default_incomplete"|"error_if_incomplete"|"pending_if_incomplete" payment_behavior?;
    # Payment settings to pass to invoices created by the subscription.
    Payment_settings_1 payment_settings?;
    # Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
    Pending_invoice_item_interval_params|"" pending_invoice_item_interval?;
    # The API ID of a promotion code to apply to this subscription. A promotion code applied to a subscription will only affect invoices created for that particular subscription.
    @constraint:String {maxLength: 5000}
    string promotion_code?;
    # Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) resulting from the `billing_cycle_anchor`. Valid values are `create_prorations` or `none`.
    # 
    # Passing `create_prorations` will cause proration invoice items to be created when applicable. Prorations can be disabled by passing `none`. If no value is passed, the default is `create_prorations`.
    "always_invoice"|"create_prorations"|"none" proration_behavior?;
    # If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
    Transfer_data_specs_2 transfer_data?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
    "now"|int trial_end?;
    # Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
    boolean trial_from_plan?;
    # Integer representing the number of trial period days before the customer is charged for the first time. This will always overwrite any trials that might apply via a subscribed plan.
    int trial_period_days?;
|};

# All invoices will be billed using the specified settings
public type Subscription_schedules_param record {
    int days_until_due?;
};

public type Range_query_specs record {
    int gt?;
    int gte?;
    int lt?;
    int lte?;
};

# 
public type Mandate_sepa_debit record {
    # The unique reference of the mandate.
    @constraint:String {maxLength: 5000}
    string reference;
    # The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Country_spec_verification_fields record {
    # 
    Country_spec_verification_field_details company;
    # 
    Country_spec_verification_field_details individual;
};

# 
public type CardList record {
    Card[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Portal_customer_update record {
    # The types of customer updates that are supported. When empty, customers are not updateable.
    ("address"|"email"|"phone"|"shipping"|"tax_id")[] allowed_updates;
    # Whether the feature is enabled.
    boolean enabled;
};

# 
public type Platform_tax_fee record {
    # The Connected account that incurred this charge.
    @constraint:String {maxLength: 5000}
    string account;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "platform_tax_fee" 'object;
    # The payment object that caused this tax to be inflicted.
    @constraint:String {maxLength: 5000}
    string source_transaction;
    # The type of tax (VAT).
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Payment_method_grabpay record {
};

# 
public type Payment_method_ideal record {
    # The customer's bank, if provided. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    "abn_amro"|"asn_bank"|"bunq"|"handelsbanken"|"ing"|"knab"|"moneyou"|"rabobank"|"regiobank"|"revolut"|"sns_bank"|"triodos_bank"|"van_lanschot" bank?;
    # The Bank Identifier Code of the customer's bank, if the bank was provided.
    "ABNANL2A"|"ASNBNL21"|"BUNQNL2A"|"FVLBNL22"|"HANDNL2A"|"INGBNL2A"|"KNABNL2H"|"MOYONL21"|"RABONL2U"|"RBRBNL21"|"REVOLT21"|"SNSBNL2A"|"TRIONL2U" bic?;
};

# As a [card issuer](https://stripe.com/docs/issuing), you can dispute transactions that the cardholder does not recognize, suspects to be fraudulent, or has other issues with.
# 
# Related guide: [Disputing Transactions](https://stripe.com/docs/issuing/purchases/disputes)
public type IssuingDispute record {
    # Disputed amount. Usually the amount of the `transaction`, but can differ (usually because of currency fluctuation).
    int amount;
    # List of balance transactions associated with the dispute.
    Balance_transaction[]? balance_transactions?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The currency the `transaction` was made in.
    string currency;
    # Evidence for the dispute. Evidence contains exactly two non-null fields: the reason for the dispute and the associated evidence field for the selected reason
    Issuing_dispute_evidence evidence;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "issuing.dispute" 'object;
    # Current status of the dispute.
    "expired"|"lost"|"submitted"|"unsubmitted"|"won" status;
    # The transaction being disputed.
    string|IssuingTransaction 'transaction;
};

# 
public type Financial_reporting_finance_report_run_run_parameters record {
    # The set of output columns requested for inclusion in the report run.
    Financial_reporting_finance_report_run_run_parametersColumnsItemsString[] columns?;
    # Connected account ID by which to filter the report run.
    @constraint:String {maxLength: 5000}
    string connected_account?;
    # Currency of objects to be included in the report run.
    string currency?;
    # Ending timestamp of data to be included in the report run (exclusive).
    int interval_end?;
    # Starting timestamp of data to be included in the report run.
    int interval_start?;
    # Payout ID by which to filter the report run.
    @constraint:String {maxLength: 5000}
    string payout?;
    # Category of balance transactions to be included in the report run.
    @constraint:String {maxLength: 5000}
    string reporting_category?;
    # Defaults to `Etc/UTC`. The output timezone for all timestamps in the report. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones). Has no effect on `interval_start` or `interval_end`.
    @constraint:String {maxLength: 5000}
    string timezone?;
};

# 
public type Transfer_schedule record {
    # The number of days charges for the account will be held before being paid out.
    int delay_days;
    # How frequently funds will be paid out. One of `manual` (payouts only created via API call), `daily`, `weekly`, or `monthly`.
    @constraint:String {maxLength: 5000}
    string interval;
    # The day of the month funds will be paid out. Only shown if `interval` is monthly. Payouts scheduled between the 29th and 31st of the month are sent on the last day of shorter months.
    int monthly_anchor?;
    # The day of the week funds will be paid out, of the style 'monday', 'tuesday', etc. Only shown if `interval` is weekly.
    @constraint:String {maxLength: 5000}
    string weekly_anchor?;
};

# 
public type Invoices_payment_method_options record {
    # If paying by `bancontact`, this sub-hash contains details about the Bancontact payment method options to pass to the invoice’s PaymentIntent.
    Invoice_payment_method_options_bancontact? bancontact?;
    # If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the invoice’s PaymentIntent.
    Invoice_payment_method_options_card? card?;
};

# 
public type Payment_intent_payment_method_options_acss_debit record {
    # 
    Payment_intent_payment_method_options_mandate_options_acss_debit mandate_options?;
    # Bank account verification method.
    "automatic"|"instant"|"microdeposits" verification_method?;
};

# 
public type Quotes_resource_from_quote record {
    # Whether this quote is a revision of a different quote.
    boolean is_revision;
    # The quote that was cloned.
    string|Quote quote;
};

# 
public type Issuing_dispute_duplicate_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the card statement showing that the product had already been paid for.
    string|File? card_statement?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Copy of the receipt showing that the product had been paid for in cash.
    string|File? cash_receipt?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Image of the front and back of the check that was used to pay for the product.
    string|File? check_image?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Transaction (e.g., ipi_...) that the disputed transaction is a duplicate of. Of the two or more transactions that are copies of each other, this is original undisputed one.
    string? original_transaction?;
};

# 
public type Transfer_data record {
    # Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    int amount?;
    # The account (if any) the payment will be attributed to for tax
    # reporting, and where funds from the payment will be transferred to upon
    # payment success.
    string|Account destination;
};

# 
public type Credit_note_line_item record {
    # The integer amount in %s representing the gross amount being credited for this line item, excluding (exclusive) tax and discounts.
    int amount;
    # Description of the item being credited.
    string? description?;
    # The integer amount in %s representing the discount being credited for this line item.
    int discount_amount;
    # The amount of discount calculated per discount for this line item
    Discounts_resource_discount_amount[] discount_amounts;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # ID of the invoice line item being credited
    @constraint:String {maxLength: 5000}
    string invoice_line_item?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "credit_note_line_item" 'object;
    # The number of units of product being credited.
    int? quantity?;
    # The amount of tax calculated per tax rate for this line item
    Credit_note_tax_amount[] tax_amounts;
    # The tax rates which apply to the line item.
    Tax_rate[] tax_rates;
    # The type of the credit note line item, one of `invoice_line_item` or `custom_line_item`. When the type is `invoice_line_item` there is an additional `invoice_line_item` property on the resource the value of which is the id of the credited line item on the invoice.
    "custom_line_item"|"invoice_line_item" 'type;
    # The cost of each unit of product being credited.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
};

public type Tax_rate_array TaxratearrayItemsString[];

# List of subscription items, each with an attached price.
public type SubscriptionItemList record {
    # Details about each object.
    Subscription_item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Payment_method_details_eps record {
    # The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.
    "arzte_und_apotheker_bank"|"austrian_anadi_bank_ag"|"bank_austria"|"bankhaus_carl_spangler"|"bankhaus_schelhammer_und_schattera_ag"|"bawag_psk_ag"|"bks_bank_ag"|"brull_kallmus_bank_ag"|"btv_vier_lander_bank"|"capital_bank_grawe_gruppe_ag"|"dolomitenbank"|"easybank_ag"|"erste_bank_und_sparkassen"|"hypo_alpeadriabank_international_ag"|"hypo_bank_burgenland_aktiengesellschaft"|"hypo_noe_lb_fur_niederosterreich_u_wien"|"hypo_oberosterreich_salzburg_steiermark"|"hypo_tirol_bank_ag"|"hypo_vorarlberg_bank_ag"|"marchfelder_bank"|"oberbank_ag"|"raiffeisen_bankengruppe_osterreich"|"schoellerbank_ag"|"sparda_bank_wien"|"volksbank_gruppe"|"volkskreditbank_ag"|"vr_bank_braunau" bank?;
    # Owner's verified full name. Values are verified or provided by EPS directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    # EPS rarely provides this information so the attribute is usually empty.
    string? verified_name?;
};

# 
public type Shipping record {
    # 
    Address address?;
    # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
    string? carrier?;
    # Recipient name.
    string? name?;
    # Recipient phone (including extension).
    string? phone?;
    # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
    string? tracking_number?;
};

# 
public type Payment_method_card_wallet record {
    # 
    Payment_method_card_wallet_amex_express_checkout amex_express_checkout?;
    # 
    Payment_method_card_wallet_apple_pay apple_pay?;
    # (For tokenized numbers only.) The last four digits of the device account number.
    string? dynamic_last4?;
    # 
    Payment_method_card_wallet_google_pay google_pay?;
    # 
    Payment_method_card_wallet_masterpass masterpass?;
    # 
    Payment_method_card_wallet_samsung_pay samsung_pay?;
    # The type of the card wallet, one of `amex_express_checkout`, `apple_pay`, `google_pay`, `masterpass`, `samsung_pay`, or `visa_checkout`. An additional hash is included on the Wallet subhash with a name matching this value. It contains additional information specific to the card wallet type.
    "amex_express_checkout"|"apple_pay"|"google_pay"|"masterpass"|"samsung_pay"|"visa_checkout" 'type;
    # 
    Payment_method_card_wallet_visa_checkout visa_checkout?;
};

# 
public type Payment_method_details_interac_present_receipt record {
    # The type of account being debited or credited
    "checking"|"savings"|"unknown" account_type?;
    # EMV tag 9F26, cryptogram generated by the integrated circuit chip.
    string? application_cryptogram?;
    # Mnenomic of the Application Identifier.
    string? application_preferred_name?;
    # Identifier for this transaction.
    string? authorization_code?;
    # EMV tag 8A. A code returned by the card issuer.
    string? authorization_response_code?;
    # How the cardholder verified ownership of the card.
    string? cardholder_verification_method?;
    # EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
    string? dedicated_file_name?;
    # The outcome of a series of EMV functions performed by the card reader.
    string? terminal_verification_results?;
    # An indication of various EMV functions performed during the transaction.
    string? transaction_status_information?;
};

# 
public type Setup_intent_payment_method_options_sepa_debit record {
    # 
    Setup_intent_payment_method_options_mandate_options_sepa_debit mandate_options?;
};

# A coupon contains information about a percent-off or amount-off discount you
# might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
# [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
public type Coupon record {
    # Amount (in the `currency` specified) that will be taken off the subtotal of any invoices for this customer.
    int? amount_off?;
    # Contains information about what this coupon applies to
    Coupon_applies_to applies_to?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # If `amount_off` has been set, the three-letter [ISO code for the currency](https://stripe.com/docs/currencies) of the amount to take off.
    string? currency?;
    # One of `forever`, `once`, and `repeating`. Describes how long a customer who applies this coupon will get the discount.
    "forever"|"once"|"repeating" duration;
    # If `duration` is `repeating`, the number of months the coupon applies. Null if coupon `duration` is `forever` or `once`.
    int? duration_in_months?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Maximum number of times this coupon can be redeemed, in total, across all customers, before it is no longer valid.
    int? max_redemptions?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # Name of the coupon displayed to customers on for instance invoices or receipts.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    "coupon" 'object;
    # Percent that will be taken off the subtotal of any invoices for this customer for the duration of the coupon. For example, a coupon with percent_off of 50 will make a %s100 invoice %s50 instead.
    decimal? percent_off?;
    # Date after which the coupon can no longer be redeemed.
    int? redeem_by?;
    # Number of times this coupon has been applied to a customer.
    int times_redeemed;
    # Taking account of the above properties, whether this coupon can still be applied to a customer.
    boolean valid;
};

# 
public type Radar_review_resource_session record {
    # The browser used in this browser session (e.g., `Chrome`).
    string? browser?;
    # Information about the device used for the browser session (e.g., `Samsung SM-G930T`).
    string? device?;
    # The platform for the browser session (e.g., `Macintosh`).
    string? platform?;
    # The version for the browser session (e.g., `61.0.3163.100`).
    string? version?;
};

public type Period_1 record {
    int end;
    int 'start;
};

# 
public type Source_order_item record {
    # The amount (price) for this order item.
    int? amount?;
    # This currency of this order item. Required when `amount` is present.
    string? currency?;
    # Human-readable description for this order item.
    string? description?;
    # The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
    string? parent?;
    # The quantity of this order item. When type is `sku`, this is the number of instances of the SKU to be ordered.
    int quantity?;
    # The type of this order item. Must be `sku`, `tax`, or `shipping`.
    string? 'type?;
};

# 
public type Portal_subscription_update_product record {
    # The list of price IDs which, when subscribed to, a subscription can be updated.
    Portal_subscription_update_productPricesItemsString[] prices;
    # The product ID.
    @constraint:String {maxLength: 5000}
    string product;
};

# 
public type Payment_method_details_card record {
    # Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? brand?;
    # Check results by Card networks on Card address and CVC at time of payment.
    Payment_method_details_card_checks? checks?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    string? funding?;
    # Installment details for this payment (Mexico only).
    # 
    # For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).
    Payment_method_details_card_installments? installments?;
    # The last four digits of the card.
    string? last4?;
    # Identifies which network this charge was processed on. Can be `amex`, `cartes_bancaires`, `diners`, `discover`, `interac`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    string? network?;
    # Populated if this transaction used 3D Secure authentication.
    Three_d_secure_details? three_d_secure?;
    # If this Card is part of a card wallet, this contains the details of the card wallet.
    Payment_method_details_card_wallet? wallet?;
};

# 
public type Issuing_transaction_purchase_details record {
    # Information about the flight that was purchased with this transaction.
    Issuing_transaction_flight_data? flight?;
    # Information about fuel that was purchased with this transaction.
    Issuing_transaction_fuel_data? fuel?;
    # Information about lodging that was purchased with this transaction.
    Issuing_transaction_lodging_data? lodging?;
    # The line items in the purchase.
    Issuing_transaction_receipt_data[]? receipt?;
    # A merchant-specific order number.
    string? reference?;
};

public type CreatedFilterOptions record {
    int gt?;
    int gte?;
    int lt?;
    int lte?;
};

# 
public type Payment_intent_next_action record {
    # 
    Payment_intent_next_action_alipay_handle_redirect alipay_handle_redirect?;
    # 
    Payment_intent_next_action_boleto boleto_display_details?;
    # 
    Payment_intent_next_action_display_oxxo_details oxxo_display_details?;
    # 
    Payment_intent_next_action_redirect_to_url redirect_to_url?;
    # Type of the next action to perform, one of `redirect_to_url`, `use_stripe_sdk`, `alipay_handle_redirect`, or `oxxo_display_details`.
    @constraint:String {maxLength: 5000}
    string 'type;
    # When confirming a PaymentIntent with Stripe.js, Stripe.js depends on the contents of this dictionary to invoke authentication flows. The shape of the contents is subject to change and is only intended to be used by Stripe.js.
    record {} use_stripe_sdk?;
    # 
    Payment_intent_next_action_verify_with_microdeposits verify_with_microdeposits?;
    # 
    Payment_intent_next_action_wechat_pay_display_qr_code wechat_pay_display_qr_code?;
    # 
    Payment_intent_next_action_wechat_pay_redirect_to_android_app wechat_pay_redirect_to_android_app?;
    # 
    Payment_intent_next_action_wechat_pay_redirect_to_ios_app wechat_pay_redirect_to_ios_app?;
};

# 
public type Payment_method_details_sepa_debit record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Branch code of bank associated with the bank account.
    string? branch_code?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four characters of the IBAN.
    string? last4?;
    # ID of the mandate used to make this payment.
    string? mandate?;
};

public type Source_type_card_present record {
    string application_cryptogram?;
    string application_preferred_name?;
    string? authorization_code?;
    string authorization_response_code?;
    string? brand?;
    string? country?;
    string cvm_type?;
    string? data_type?;
    string dedicated_file_name?;
    string emv_auth_data?;
    string? evidence_customer_signature?;
    string? evidence_transaction_certificate?;
    int? exp_month?;
    int? exp_year?;
    string fingerprint?;
    string? funding?;
    string? last4?;
    string? pos_device_id?;
    string pos_entry_mode?;
    string? read_method?;
    string? reader?;
    string terminal_verification_results?;
    string transaction_status_information?;
};

public type Source_type_eps record {
    string? reference?;
    string? statement_descriptor?;
};

# Result from a selfie check
public type Gelato_selfie_report record {
    # ID of the [File](https://stripe.com/docs/api/files) holding the image of the identity document used in this check.
    string? document?;
    # Details on the verification error. Present when status is `unverified`.
    Gelato_selfie_report_error? 'error?;
    # ID of the [File](https://stripe.com/docs/api/files) holding the image of the selfie used in this check.
    string? selfie?;
    # Status of this `selfie` check.
    "unverified"|"verified" status;
};

# If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
public type Param record {
    # The account number for the bank account
    @constraint:String {maxLength: 5000}
    string account_number;
    # Bank-State-Branch number of the bank account
    @constraint:String {maxLength: 5000}
    string bsb_number;
};

# 
public type Inline_response_200_3 record {
    Subscription_schedule[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000, pattern: re `^/v1/subscription_schedules`}
    string url;
};

# 
public type Setup_attempt_payment_method_details_sofort record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Payment_method? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the Sofort authorization page that the customer is redirected to.
    # Can be one of `en`, `de`, `fr`, or `nl`
    "de"|"en"|"fr"|"nl" preferred_language?;
    # Owner's verified full name. Values are verified or provided by Sofort directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

public type Inline_response_200_1 Customer|Deleted_customer;

# 
public type Inline_response_200_2 record {
    Subscription[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000, pattern: re `^/v1/subscriptions`}
    string url;
};

# Stores representations of [stock keeping units](http://en.wikipedia.org/wiki/Stock_keeping_unit).
# SKUs describe specific product variations, taking into account any combination of: attributes,
# currency, and cost. For example, a product may be a T-shirt, whereas a specific SKU represents
# the `size: large`, `color: red` version of that shirt.
# 
# Can also be used to manage inventory.
# 
# Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
public type Sku record {
    # Whether the SKU is available for purchase.
    boolean active;
    # A dictionary of attributes and values for the attributes defined by the product. If, for example, a product's attributes are `["size", "gender"]`, a valid SKU has the following dictionary of attributes: `{"size": "Medium", "gender": "Unisex"}`.
    record {|string...;|} attributes;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The URL of an image for this SKU, meant to be displayable to the customer.
    string? image?;
    # Description of the SKU’s inventory
    Sku_inventory inventory;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "sku" 'object;
    # The dimensions of this SKU for shipping purposes.
    Package_dimensions? package_dimensions?;
    # The cost of the item as a positive integer in the smallest currency unit (that is, 100 cents to charge $1.00, or 100 to charge ¥100, Japanese Yen being a zero-decimal currency).
    int price;
    # The ID of the product this SKU is associated with. The product must be currently active.
    string|Product product;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int updated;
};

# Stripe needs to collect certain pieces of information about each account
# created. These requirements can differ depending on the account's country. The
# Country Specs API makes these rules available to your integration.
# 
# You can also view the information from this API call as [an online
# guide](/docs/connect/required-verification-information).
public type Country_spec record {
    # The default currency for this country. This applies to both payment methods and bank accounts.
    @constraint:String {maxLength: 5000}
    string default_currency;
    # Unique identifier for the object. Represented as the ISO country code for this country.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "country_spec" 'object;
    # Currencies that can be accepted in the specific country (for transfers).
    record {|string[]...;|} supported_bank_account_currencies;
    # Currencies that can be accepted in the specified country (for payments).
    Country_specSupportedpaymentcurrenciesItemsString[] supported_payment_currencies;
    # Payment methods available in the specified country. You may need to enable some payment methods (e.g., [ACH](https://stripe.com/docs/ach)) on your account before they appear in this list. The `stripe` payment method refers to [charging through your platform](https://stripe.com/docs/connect/destination-charges).
    Country_specSupportedpaymentmethodsItemsString[] supported_payment_methods;
    # Countries that can accept transfers from the specified country.
    Country_specSupportedtransfercountriesItemsString[] supported_transfer_countries;
    # 
    Country_spec_verification_fields verification_fields;
};

# 
public type Payment_method_card_present record {
};

public type Recurring_price_data_1 record {
    string currency;
    @constraint:String {maxLength: 5000}
    string product;
    Recurring_adhoc recurring;
    "exclusive"|"inclusive"|"unspecified" tax_behavior?;
    int unit_amount?;
    string unit_amount_decimal?;
};

public type V1_subscription_schedules_body record {|
    # The identifier of the customer to create the subscription schedule for.
    @constraint:String {maxLength: 5000}
    string customer?;
    # Object representing the subscription schedule's default settings.
    Default_settings_params default_settings?;
    # Configures how the subscription schedule behaves when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running.`cancel` will end the subscription schedule and cancel the underlying subscription.
    "cancel"|"none"|"release"|"renew" end_behavior?;
    # Specifies which fields in the response should be expanded.
    V1_subscription_schedules_bodyExpandItemsString[] expand?;
    # Migrate an existing subscription to be managed by a subscription schedule. If this parameter is set, a subscription schedule will be created using the subscription's item(s), set to auto-renew using the subscription's interval. When using this parameter, other parameters (such as phase values) cannot be set. To create a subscription schedule with other modifications, we recommend making two separate API calls.
    @constraint:String {maxLength: 5000}
    string from_subscription?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
    # List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase.
    Phase_configuration_params[] phases?;
    # When the subscription schedule starts. We recommend using `now` so that it starts the subscription immediately. You can also use a Unix timestamp to backdate the subscription so that it starts on a past date, or set a future date for the subscription to start on.
    int|"now" start_date?;
|};

# 
public type Subscriptions_resource_payment_method_options record {
    # This sub-hash contains details about the Bancontact payment method options to pass to invoices created by the subscription.
    Invoice_payment_method_options_bancontact? bancontact?;
    # This sub-hash contains details about the Card payment method options to pass to invoices created by the subscription.
    Invoice_payment_method_options_card? card?;
};

public type Custom_field_params record {
    @constraint:String {maxLength: 30}
    string name;
    @constraint:String {maxLength: 30}
    string value;
};

# 
public type Address record {
    # City, district, suburb, town, or village.
    string? city?;
    # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    string? country?;
    # Address line 1 (e.g., street, PO Box, or company name).
    string? line1?;
    # Address line 2 (e.g., apartment, suite, unit, or building).
    string? line2?;
    # ZIP or postal code.
    string? postal_code?;
    # State, county, province, or region.
    string? state?;
};

# 
public type Portal_subscription_pause record {
    # Whether the feature is enabled.
    boolean enabled;
};

# 
public type Payment_pages_checkout_session_tax_id record {
    # The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, or `unknown`
    "ae_trn"|"au_abn"|"au_arn"|"br_cnpj"|"br_cpf"|"ca_bn"|"ca_gst_hst"|"ca_pst_bc"|"ca_pst_mb"|"ca_pst_sk"|"ca_qst"|"ch_vat"|"cl_tin"|"es_cif"|"eu_vat"|"gb_vat"|"hk_br"|"id_npwp"|"il_vat"|"in_gst"|"jp_cn"|"jp_rn"|"kr_brn"|"li_uid"|"mx_rfc"|"my_frp"|"my_itn"|"my_sst"|"no_vat"|"nz_gst"|"ru_inn"|"ru_kpp"|"sa_vat"|"sg_gst"|"sg_uen"|"th_vat"|"tw_vat"|"unknown"|"us_ein"|"za_vat" 'type;
    # The value of the tax ID.
    string? value?;
};

# 
public type Source_transaction_gbp_credit_transfer_data record {
    # Bank account fingerprint associated with the Stripe owned bank account receiving the transfer.
    @constraint:String {maxLength: 5000}
    string fingerprint?;
    # The credit transfer rails the sender used to push this transfer. The possible rails are: Faster Payments, BACS, CHAPS, and wire transfers. Currently only Faster Payments is supported.
    @constraint:String {maxLength: 5000}
    string funding_method?;
    # Last 4 digits of sender account number associated with the transfer.
    @constraint:String {maxLength: 5000}
    string last4?;
    # Sender entered arbitrary information about the transfer.
    @constraint:String {maxLength: 5000}
    string reference?;
    # Sender account number associated with the transfer.
    @constraint:String {maxLength: 5000}
    string sender_account_number?;
    # Sender name associated with the transfer.
    @constraint:String {maxLength: 5000}
    string sender_name?;
    # Sender sort code associated with the transfer.
    @constraint:String {maxLength: 5000}
    string sender_sort_code?;
};

# Tokenization is the process Stripe uses to collect sensitive card or bank
# account details, or personally identifiable information (PII), directly from
# your customers in a secure manner. A token representing this information is
# returned to your server to use. You should use our
# [recommended payments integrations](https://stripe.com/docs/payments) to perform this process
# client-side. This ensures that no sensitive card data touches your server,
# and allows your integration to operate in a PCI-compliant way.
# 
# If you cannot use client-side tokenization, you can also create tokens using
# the API with either your publishable or secret API key. Keep in mind that if
# your integration uses this method, you are responsible for any PCI compliance
# that may be required, and you must keep your secret API key safe. Unlike with
# client-side tokenization, your customer's information is not sent directly to
# Stripe, so we cannot determine how it is handled or stored.
# 
# Tokens cannot be stored or used more than once. To store card or bank account
# information for later use, you can create [Customer](https://stripe.com/docs/api#customers)
# objects or [Custom accounts](https://stripe.com/docs/api#external_accounts). Note that
# [Radar](https://stripe.com/docs/radar), our integrated solution for automatic fraud protection,
# performs best with integrations that use client-side tokenization.
# 
# Related guide: [Accept a payment](https://stripe.com/docs/payments/accept-a-payment-charges#web-create-token)
public type Token record {
    # These bank accounts are payment methods on `Customer` objects.
    # 
    # On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer
    # destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts).
    # They can be bank accounts or debit cards as well, and are documented in the links above.
    # 
    # Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
    Bank_account bank_account?;
    # You can store multiple cards on a customer in order to charge the customer
    # later. You can also store multiple debit cards on a recipient in order to
    # transfer to those cards later.
    # 
    # Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
    Card card?;
    # IP address of the client that generated the token.
    string? client_ip?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "token" 'object;
    # Type of the token: `account`, `bank_account`, `card`, or `pii`.
    @constraint:String {maxLength: 5000}
    string 'type;
    # Whether this token has already been used (tokens can be used only once).
    boolean used;
};

# 
public type Setup_intent_payment_method_options record {
    # 
    Setup_intent_payment_method_options_acss_debit acss_debit?;
    # 
    Setup_intent_payment_method_options_card card?;
    # 
    Setup_intent_payment_method_options_sepa_debit sepa_debit?;
};

# 
public type Legal_entity_company_verification_document record {
    # The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.
    string|File? back?;
    # A user-displayable string describing the verification state of this document.
    string? details?;
    # One of `document_corrupt`, `document_expired`, `document_failed_copy`, `document_failed_greyscale`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_not_readable`, `document_not_uploaded`, `document_type_not_supported`, or `document_too_large`. A machine-readable code specifying the verification state for this document.
    string? details_code?;
    # The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `additional_verification`.
    string|File? front?;
};

# 
public type Payment_intent_next_action_redirect_to_url record {
    # If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
    string? return_url?;
    # The URL you must redirect your customer to in order to authenticate the payment.
    string? url?;
};

public type Billing_threshold_params record {
    int amount_gte?;
    boolean reset_billing_cycle_anchor?;
};

public type Source_type_ach_credit_transfer record {
    string? account_number?;
    string? bank_name?;
    string? fingerprint?;
    string? refund_account_holder_name?;
    string? refund_account_holder_type?;
    string? refund_routing_number?;
    string? routing_number?;
    string? swift_code?;
};

public type Discounts_1 Discounts_data_param|"";

# 
public type Dispute_evidence_details record {
    # Date by which evidence must be submitted in order to successfully challenge dispute. Will be null if the customer's bank or credit card company doesn't allow a response for this particular dispute.
    int? due_by?;
    # Whether evidence has been staged for this dispute.
    boolean has_evidence;
    # Whether the last evidence submission was submitted past the due date. Defaults to `false` if no evidence submissions have occurred. If `true`, then delivery of the latest evidence is *not* guaranteed.
    boolean past_due;
    # The number of times evidence has been submitted. Typically, you may only submit evidence once.
    int submission_count;
};

# 
public type Payment_method_details_acss_debit record {
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Institution number of the bank account
    string? institution_number?;
    # Last four digits of the bank account number.
    string? last4?;
    # ID of the mandate used to make this payment.
    @constraint:String {maxLength: 5000}
    string mandate?;
    # Transit number of the bank account.
    string? transit_number?;
};

public type Payment_method_attach_body record {|
    # The ID of the customer to which to attach the PaymentMethod.
    @constraint:String {maxLength: 5000}
    string customer;
    # Specifies which fields in the response should be expanded.
    Payment_method_attach_bodyExpandItemsString[] expand?;
|};

# 
public type Issuing_dispute_other_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Description of the merchandise or service that was purchased.
    string? product_description?;
    # Whether the product was a merchandise or service.
    "merchandise"|"service" product_type?;
};

# 
public type Payment_pages_checkout_session_tax_id_collection record {
    # Indicates whether tax ID collection is enabled for the session
    boolean enabled;
};

# 
public type Payment_method_card record {
    # Card brand. Can be `amex`, `diners`, `discover`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
    @constraint:String {maxLength: 5000}
    string brand;
    # Checks on Card address and CVC if provided.
    Payment_method_card_checks? checks?;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    @constraint:String {maxLength: 5000}
    string funding;
    # Details of the original PaymentMethod that created this object.
    Payment_method_card_generated_card? generated_from?;
    # The last four digits of the card.
    @constraint:String {maxLength: 5000}
    string last4;
    # Contains information about card networks that can be used to process the payment.
    Networks? networks?;
    # Contains details on how this Card maybe be used for 3D Secure authentication.
    Three_d_secure_usage? three_d_secure_usage?;
    # If this Card is part of a card wallet, this contains the details of the card wallet.
    Payment_method_card_wallet? wallet?;
};

# 
public type Invoice_transfer_data record {
    # The amount in %s that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination.
    int? amount?;
    # The account where funds from the payment will be transferred to upon payment success.
    string|Account destination;
};

# 
public type Portal_invoice_list record {
    # Whether the feature is enabled.
    boolean enabled;
};

public type Payment_source Account|Alipay_account|Bank_account|Bitcoin_receiver|Card|Source;

# 
public type Payment_method_card_wallet_google_pay record {
};

# Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
public type Transform_usage_param record {
    int divide_by;
    "down"|"up" round;
};

# 
public type Issuing_transaction_fuel_data record {
    # The type of fuel that was purchased. One of `diesel`, `unleaded_plus`, `unleaded_regular`, `unleaded_super`, or `other`.
    @constraint:String {maxLength: 5000}
    string 'type;
    # The units for `volume_decimal`. One of `us_gallon` or `liter`.
    @constraint:String {maxLength: 5000}
    string unit;
    # The cost in cents per each unit of fuel, represented as a decimal string with at most 12 decimal places.
    string unit_cost_decimal;
    # The volume of the fuel that was pumped, represented as a decimal string with at most 12 decimal places.
    string? volume_decimal?;
};

# This is an object representing a capability for a Stripe account.
# 
# Related guide: [Account capabilities](https://stripe.com/docs/connect/account-capabilities).
public type Capability record {
    # The account for which the capability enables functionality.
    string|Account account;
    # The identifier for the capability.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "capability" 'object;
    # Whether the capability has been requested.
    boolean requested;
    # Time at which the capability was requested. Measured in seconds since the Unix epoch.
    int? requested_at?;
    # 
    Account_capability_requirements requirements?;
    # The status of the capability. Can be `active`, `inactive`, `pending`, or `unrequested`.
    "active"|"disabled"|"inactive"|"pending"|"unrequested" status;
};

# A list of returns that have taken place for this order.
public type OrdersResourceOrderReturnList record {
    # Details about each object.
    Order_return[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# The Pause Collection settings determine how we will pause collection for this subscription and for how long the subscription
# should be paused.
public type Subscriptions_resource_pause_collection record {
    # The payment collection behavior for this subscription while paused. One of `keep_as_draft`, `mark_uncollectible`, or `void`.
    "keep_as_draft"|"mark_uncollectible"|"void" behavior;
    # The time after which the subscription will resume collecting payments.
    int? resumes_at?;
};

# 
public type Dispute_evidence record {
    # Any server or activity logs showing proof that the customer accessed or downloaded the purchased digital product. This information should include IP addresses, corresponding timestamps, and any detailed recorded activity.
    string? access_activity_log?;
    # The billing address provided by the customer.
    string? billing_address?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your subscription cancellation policy, as shown to the customer.
    string|File? cancellation_policy?;
    # An explanation of how and when the customer was shown your refund policy prior to purchase.
    string? cancellation_policy_disclosure?;
    # A justification for why the customer's subscription was not canceled.
    string? cancellation_rebuttal?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any communication with the customer that you feel is relevant to your case. Examples include emails proving that the customer received the product or service, or demonstrating their use of or satisfaction with the product or service.
    string|File? customer_communication?;
    # The email address of the customer.
    string? customer_email_address?;
    # The name of the customer.
    string? customer_name?;
    # The IP address that the customer used when making the purchase.
    string? customer_purchase_ip?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A relevant document or contract showing the customer's signature.
    string|File? customer_signature?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation for the prior charge that can uniquely identify the charge, such as a receipt, shipping label, work order, etc. This document should be paired with a similar document from the disputed payment that proves the two payments are separate.
    string|File? duplicate_charge_documentation?;
    # An explanation of the difference between the disputed charge versus the prior charge that appears to be a duplicate.
    string? duplicate_charge_explanation?;
    # The Stripe ID for the prior charge which appears to be a duplicate of the disputed charge.
    string? duplicate_charge_id?;
    # A description of the product or service that was sold.
    string? product_description?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any receipt or message sent to the customer notifying them of the charge.
    string|File? receipt?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Your refund policy, as shown to the customer.
    string|File? refund_policy?;
    # Documentation demonstrating that the customer was shown your refund policy prior to purchase.
    string? refund_policy_disclosure?;
    # A justification for why the customer is not entitled to a refund.
    string? refund_refusal_explanation?;
    # The date on which the customer received or began receiving the purchased service, in a clear human-readable format.
    string? service_date?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a service was provided to the customer. This could include a copy of a signed contract, work order, or other form of written agreement.
    string|File? service_documentation?;
    # The address to which a physical product was shipped. You should try to include as complete address information as possible.
    string? shipping_address?;
    # The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc. If multiple carriers were used for this purchase, please separate them with commas.
    string? shipping_carrier?;
    # The date on which a physical product began its route to the shipping address, in a clear human-readable format.
    string? shipping_date?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Documentation showing proof that a product was shipped to the customer at the same address the customer provided to you. This could include a copy of the shipment receipt, shipping label, etc. It should show the customer's full shipping address, if possible.
    string|File? shipping_documentation?;
    # The tracking number for a physical product, obtained from the delivery service. If multiple tracking numbers were generated for this purchase, please separate them with commas.
    string? shipping_tracking_number?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Any additional evidence or statements.
    string|File? uncategorized_file?;
    # Any additional evidence or statements.
    string? uncategorized_text?;
};

public type Deleted_payment_source Deleted_alipay_account|Deleted_bank_account|Deleted_bitcoin_receiver|Deleted_card;

public type CreatedDetails CreatedFilterOptions|int;

# 
public type Subscriptions_resource_payment_settings record {
    # Payment-method-specific configuration to provide to invoices created by the subscription.
    Subscriptions_resource_payment_method_options? payment_method_options?;
    # The list of payment method types to provide to every invoice created by the subscription. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice).
    ("ach_credit_transfer"|"ach_debit"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"fpx"|"giropay"|"ideal"|"sepa_debit"|"sofort"|"wechat_pay")[]? payment_method_types?;
};

# Default invoice settings for this customer.
public type Customer_param_1 record {
    Invoice_settings_custom_fields|"" custom_fields?;
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    @constraint:String {maxLength: 5000}
    string footer?;
};

# 
public type Subscription_pending_invoice_item_interval record {
    # Specifies invoicing frequency. Either `day`, `week`, `month` or `year`.
    "day"|"month"|"week"|"year" interval;
    # The number of intervals between invoices. For example, `interval=month` and `interval_count=3` bills every 3 months. Maximum of one year interval allowed (1 year, 12 months, or 52 weeks).
    int interval_count;
};

# Pending Updates store the changes pending from a previous update that will be applied
# to the Subscription upon successful payment.
public type Subscriptions_resource_pending_update record {
    # If the update is applied, determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
    int? billing_cycle_anchor?;
    # The point after which the changes reflected by this update will be discarded and no longer applied.
    int expires_at;
    # List of subscription items, each with an attached plan, that will be set if the update is applied.
    Subscription_item[]? subscription_items?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time, if the update is applied.
    int? trial_end?;
    # Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
    boolean? trial_from_plan?;
};

# 
public type Payment_method_options_alipay record {
};

# 
public type Account_branding_settings record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) An icon for the account. Must be square and at least 128px x 128px.
    string|File? icon?;
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) A logo for the account that will be used in Checkout instead of the icon and without the account's name next to it if provided. Must be at least 128px x 128px.
    string|File? logo?;
    # A CSS hex color value representing the primary branding color for this account
    string? primary_color?;
    # A CSS hex color value representing the secondary branding color for this account
    string? secondary_color?;
};

public type Configuration_item_params record {
    Item_billing_thresholds_param|"" billing_thresholds?;
    @constraint:String {maxLength: 5000}
    string price?;
    Recurring_price_data_1 price_data?;
    int quantity?;
    TaxratesItemsString[]|"" tax_rates?;
};

# 
public type Payment_method_details_giropay record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # Owner's verified full name. Values are verified or provided by Giropay directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    # Giropay rarely provides this information so the attribute is usually empty.
    string? verified_name?;
};

public type Customer_card_details record {
    @constraint:String {maxLength: 5000}
    string address_city?;
    @constraint:String {maxLength: 5000}
    string address_country?;
    @constraint:String {maxLength: 5000}
    string address_line1?;
    @constraint:String {maxLength: 5000}
    string address_line2?;
    @constraint:String {maxLength: 5000}
    string address_state?;
    @constraint:String {maxLength: 5000}
    string address_zip?;
    @constraint:String {maxLength: 5000}
    string cvc?;
    int exp_month;
    int exp_year;
    record {|string...;|} metadata?;
    @constraint:String {maxLength: 5000}
    string name?;
    @constraint:String {maxLength: 5000}
    string number;
    "card" 'object?;
};

# 
public type Application record {
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The name of the application.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    "application" 'object;
};

# This is an object representing a person associated with a Stripe account.
# 
# A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account.
# See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.
# 
# Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).
public type Person record {
    # The account the person is associated with.
    @constraint:String {maxLength: 5000}
    string account;
    # 
    Address address?;
    Legal_entity_japan_address? address_kana?;
    Legal_entity_japan_address? address_kanji?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # 
    Legal_entity_dob dob?;
    # The person's email address.
    string? email?;
    # The person's first name.
    string? first_name?;
    # The Kana variation of the person's first name (Japan only).
    string? first_name_kana?;
    # The Kanji variation of the person's first name (Japan only).
    string? first_name_kanji?;
    # The person's gender (International regulations require either "male" or "female").
    string? gender?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Whether the person's `id_number` was provided.
    boolean id_number_provided?;
    # The person's last name.
    string? last_name?;
    # The Kana variation of the person's last name (Japan only).
    string? last_name_kana?;
    # The Kanji variation of the person's last name (Japan only).
    string? last_name_kanji?;
    # The person's maiden name.
    string? maiden_name?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata?;
    # The country where the person is a national.
    string? nationality?;
    # String representing the object's type. Objects of the same type share the same value.
    "person" 'object;
    # The person's phone number.
    string? phone?;
    # Indicates if the person or any of their representatives, family members, or other closely related persons, declares that they hold or have held an important public job or function, in any jurisdiction.
    "existing"|"none" political_exposure?;
    # 
    Person_relationship relationship?;
    Person_requirements? requirements?;
    # Whether the last four digits of the person's Social Security number have been provided (U.S. only).
    boolean ssn_last_4_provided?;
    # 
    Legal_entity_person_verification verification?;
};

# 
public type Quotes_resource_automatic_tax record {
    # Automatically calculate taxes
    boolean enabled;
    # The status of the most recent automated tax calculation for this quote.
    "complete"|"failed"|"requires_location_inputs" status?;
};

# A discount represents the actual application of a coupon to a particular
# customer. It contains information about when the discount began and when it
# will end.
# 
# Related guide: [Applying Discounts to Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
public type Discount record {
    # The Checkout session that this coupon is applied to, if it is applied to a particular session in payment mode. Will not be present for subscription mode.
    string? checkout_session?;
    # A coupon contains information about a percent-off or amount-off discount you
    # might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
    # [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
    Coupon coupon;
    # The ID of the customer associated with this discount.
    string|Customer|Deleted_customer? customer?;
    # If the coupon has a duration of `repeating`, the date that this discount will end. If the coupon has a duration of `once` or `forever`, this attribute will be null.
    int? end?;
    # The ID of the discount object. Discounts cannot be fetched by ID. Use `expand[]=discounts` in API calls to expand discount IDs in an array.
    @constraint:String {maxLength: 5000}
    string id;
    # The invoice that the discount's coupon was applied to, if it was applied directly to a particular invoice.
    string? invoice?;
    # The invoice item `id` (or invoice line item `id` for invoice line items of type='subscription') that the discount's coupon was applied to, if it was applied directly to a particular invoice item or invoice line item.
    string? invoice_item?;
    # String representing the object's type. Objects of the same type share the same value.
    "discount" 'object;
    # The promotion code applied to create this discount.
    string|Promotion_code? promotion_code?;
    # Date that the coupon was applied.
    int 'start;
    # The subscription that this coupon is applied to, if it is applied to a particular subscription.
    string? subscription?;
};

public type Customer_adresss record {
    @constraint:String {maxLength: 5000}
    string city?;
    @constraint:String {maxLength: 5000}
    string country?;
    @constraint:String {maxLength: 5000}
    string line1?;
    @constraint:String {maxLength: 5000}
    string line2?;
    @constraint:String {maxLength: 5000}
    string postal_code?;
    @constraint:String {maxLength: 5000}
    string state?;
};

# 
public type Payment_method_details_p24 record {
    # The customer's bank. Can be one of `ing`, `citi_handlowy`, `tmobile_usbugi_bankowe`, `plus_bank`, `etransfer_pocztowy24`, `banki_spbdzielcze`, `bank_nowy_bfg_sa`, `getin_bank`, `blik`, `noble_pay`, `ideabank`, `envelobank`, `santander_przelew24`, `nest_przelew`, `mbank_mtransfer`, `inteligo`, `pbac_z_ipko`, `bnp_paribas`, `credit_agricole`, `toyota_bank`, `bank_pekao_sa`, `volkswagen_bank`, `bank_millennium`, `alior_bank`, or `boz`.
    "alior_bank"|"bank_millennium"|"bank_nowy_bfg_sa"|"bank_pekao_sa"|"banki_spbdzielcze"|"blik"|"bnp_paribas"|"boz"|"citi_handlowy"|"credit_agricole"|"envelobank"|"etransfer_pocztowy24"|"getin_bank"|"ideabank"|"ing"|"inteligo"|"mbank_mtransfer"|"nest_przelew"|"noble_pay"|"pbac_z_ipko"|"plus_bank"|"santander_przelew24"|"tmobile_usbugi_bankowe"|"toyota_bank"|"volkswagen_bank" bank?;
    # Unique reference for this Przelewy24 payment.
    string? reference?;
    # Owner's verified full name. Values are verified or provided by Przelewy24 directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    # Przelewy24 rarely provides this information so the attribute is usually empty.
    string? verified_name?;
};

# 
public type Deleted_terminalLocation record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "terminal.location" 'object;
};

# Automatic tax settings for this subscription.
public type Automatic_tax_config_1 record {
    boolean enabled;
};

# 
public type Deleted_terminalReader record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "terminal.reader" 'object;
};

# Default settings for automatic tax computation
public type Automatic_tax_config_2 record {
    # Enabled automatic tax calculation which will automatically compute tax rates on all invoices generated by the subscription
    boolean enabled;
};

public type Automatic_tax_config_3 record {
    boolean enabled;
};

# [Stripe Connect](https://stripe.com/docs/connect) platforms can reverse transfers made to a
# connected account, either entirely or partially, and can also specify whether
# to refund any related application fees. Transfer reversals add to the
# platform's balance and subtract from the destination account's balance.
# 
# Reversing a transfer that was made for a [destination
# charge](/docs/connect/destination-charges) is allowed only up to the amount of
# the charge. It is possible to reverse a
# [transfer_group](https://stripe.com/docs/connect/charges-transfers#transfer-options)
# transfer only if the destination account has enough balance to cover the
# reversal.
# 
# Related guide: [Reversing Transfers](https://stripe.com/docs/connect/charges-transfers#reversing-transfers).
public type Transfer_reversal record {
    # Amount, in %s.
    int amount;
    # Balance transaction that describes the impact on your account balance.
    string|Balance_transaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Linked payment refund for the transfer reversal.
    string|Refund? destination_payment_refund?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "transfer_reversal" 'object;
    # ID of the refund responsible for the transfer reversal.
    string|Refund? source_refund?;
    # ID of the transfer that was reversed.
    string|Transfer transfer;
};

public type Token_paramas record {
    @constraint:String {maxLength: 5000}
    string token;
};

public type Payment_method_types_array ("ach_credit_transfer"|"ach_debit"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"fpx"|"giropay"|"ideal"|"sepa_debit"|"sofort"|"wechat_pay")[];

# 
public type Legal_entity_japan_address record {
    # City/Ward.
    string? city?;
    # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    string? country?;
    # Block/Building number.
    string? line1?;
    # Building details.
    string? line2?;
    # ZIP or postal code.
    string? postal_code?;
    # Prefecture.
    string? state?;
    # Town/cho-me.
    string? town?;
};

# 
public type Source_transaction_sepa_credit_transfer_data record {
    # Reference associated with the transfer.
    @constraint:String {maxLength: 5000}
    string reference?;
    # Sender's bank account IBAN.
    @constraint:String {maxLength: 5000}
    string sender_iban?;
    # Sender's name.
    @constraint:String {maxLength: 5000}
    string sender_name?;
};

# 
public type Status_transitions record {
    # The time that the order was canceled.
    int? canceled?;
    # The time that the order was fulfilled.
    int? fulfiled?;
    # The time that the order was paid.
    int? paid?;
    # The time that the order was returned.
    int? returned?;
};

# 
public type Payment_method_options_p24 record {
};

# 
public type Person_requirements record {
    # Fields that need to be collected to keep the person's account enabled. If not collected by the account's `current_deadline`, these fields appear in `past_due` as well, and the account is disabled.
    Person_requirementsCurrentlydueItemsString[] currently_due;
    # Fields that are `currently_due` and need to be collected again because validation or verification failed.
    Account_requirements_error[] errors;
    # Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in `currently_due` as well, and the account's `current_deadline` becomes set.
    Person_requirementsEventuallydueItemsString[] eventually_due;
    # Fields that weren't collected by the account's `current_deadline`. These fields need to be collected to enable the person's account.
    Person_requirementsPastdueItemsString[] past_due;
    # Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to `eventually_due`, `currently_due`, or `past_due`.
    Person_requirementsPendingverificationItemsString[] pending_verification;
};

public type Source_type_p24 record {
    string? reference?;
};

# 
public type Account_bacs_debit_payments_settings record {
    # The Bacs Direct Debit Display Name for this account. For payments made with Bacs Direct Debit, this will appear on the mandate, and as the statement descriptor.
    @constraint:String {maxLength: 5000}
    string display_name?;
};

# 
public type Portal_subscription_cancellation_reason record {
    # Whether the feature is enabled.
    boolean enabled;
    # Which cancellation reasons will be given as options to the customer.
    ("customer_service"|"low_quality"|"missing_features"|"other"|"switched_service"|"too_complex"|"too_expensive"|"unused")[] options;
};

# 
public type Sigma_scheduled_query_run_error record {
    # Information about the run failure.
    @constraint:String {maxLength: 5000}
    string message;
};

# 
public type Online_acceptance record {
    # The IP address from which the Mandate was accepted by the customer.
    string? ip_address?;
    # The user agent of the browser from which the Mandate was accepted by the customer.
    string? user_agent?;
};

public type Subscription_item_update_params record {
    record {int usage_gte;}|"" billing_thresholds?;
    boolean clear_usage?;
    boolean deleted?;
    @constraint:String {maxLength: 5000}
    string id?;
    record {|string...;|}|"" metadata?;
    @constraint:String {maxLength: 5000}
    string price?;
    Recurring_price_data_1 price_data?;
    int quantity?;
    TaxratesItemsString[]|"" tax_rates?;
};

# 
public type Api_errors record {
    # For card errors, the ID of the failed charge.
    @constraint:String {maxLength: 5000}
    string charge?;
    # For some errors that could be handled programmatically, a short string indicating the [error code](https://stripe.com/docs/error-codes) reported.
    @constraint:String {maxLength: 5000}
    string code?;
    # For card errors resulting from a card issuer decline, a short string indicating the [card issuer's reason for the decline](https://stripe.com/docs/declines#issuer-declines) if they provide one.
    @constraint:String {maxLength: 5000}
    string decline_code?;
    # A URL to more information about the [error code](https://stripe.com/docs/error-codes) reported.
    @constraint:String {maxLength: 5000}
    string doc_url?;
    # A human-readable message providing more details about the error. For card errors, these messages can be shown to your users.
    @constraint:String {maxLength: 40000}
    string message?;
    # If the error is parameter-specific, the parameter related to the error. For example, you can use this to display a message near the correct form field.
    @constraint:String {maxLength: 5000}
    string param?;
    # A PaymentIntent guides you through the process of collecting a payment from your customer.
    # We recommend that you create exactly one PaymentIntent for each order or
    # customer session in your system. You can reference the PaymentIntent later to
    # see the history of payment attempts for a particular session.
    # 
    # A PaymentIntent transitions through
    # [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses)
    # throughout its lifetime as it interfaces with Stripe.js to perform
    # authentication flows and ultimately creates at most one successful charge.
    # 
    # Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
    Payment_intent payment_intent?;
    # PaymentMethod objects represent your customer's payment instruments.
    # They can be used with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or saved to
    # Customer objects to store instrument details for future payments.
    # 
    # Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
    Payment_method payment_method?;
    # If the error is specific to the type of payment method, the payment method type that had a problem. This field is only populated for invoice-related errors.
    @constraint:String {maxLength: 5000}
    string payment_method_type?;
    # A SetupIntent guides you through the process of setting up and saving a customer's payment credentials for future payments.
    # For example, you could use a SetupIntent to set up and save your customer's card without immediately collecting a payment.
    # Later, you can use [PaymentIntents](https://stripe.com/docs/api#payment_intents) to drive the payment flow.
    # 
    # Create a SetupIntent as soon as you're ready to collect your customer's payment credentials.
    # Do not maintain long-lived, unconfirmed SetupIntents as they may no longer be valid.
    # The SetupIntent then transitions through multiple [statuses](https://stripe.com/docs/payments/intents#intent-statuses) as it guides
    # you through the setup process.
    # 
    # Successful SetupIntents result in payment credentials that are optimized for future payments.
    # For example, cardholders in [certain regions](/guides/strong-customer-authentication) may need to be run through
    # [Strong Customer Authentication](https://stripe.com/docs/strong-customer-authentication) at the time of payment method collection
    # in order to streamline later [off-session payments](https://stripe.com/docs/payments/setup-intents).
    # If the SetupIntent is used with a [Customer](https://stripe.com/docs/api#setup_intent_object-customer), upon success,
    # it will automatically attach the resulting payment method to that Customer.
    # We recommend using SetupIntents or [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage) on
    # PaymentIntents to save payment methods in order to prevent saving invalid or unoptimized payment methods.
    # 
    # By using SetupIntents, you ensure that your customers experience the minimum set of required friction,
    # even as regulations change over time.
    # 
    # Related guide: [Setup Intents API](https://stripe.com/docs/payments/setup-intents).
    Setup_intent setup_intent?;
    # The source object for errors returned on a request involving a source.
    Bank_account|Card|Source 'source?;
    # The type of error returned. One of `api_error`, `card_error`, `idempotency_error`, or `invalid_request_error`
    "api_error"|"card_error"|"idempotency_error"|"invalid_request_error" 'type;
};

# 
public type Issuing_authorization_merchant_data record {
    # A categorization of the seller's type of business. See our [merchant categories guide](https://stripe.com/docs/issuing/merchant-categories) for a list of possible values.
    @constraint:String {maxLength: 5000}
    string category;
    # The merchant category code for the seller’s business
    @constraint:String {maxLength: 5000}
    string category_code;
    # City where the seller is located
    string? city?;
    # Country where the seller is located
    string? country?;
    # Name of the seller
    string? name?;
    # Identifier assigned to the seller by the card brand
    @constraint:String {maxLength: 5000}
    string network_id;
    # Postal code where the seller is located
    string? postal_code?;
    # State where the seller is located
    string? state?;
};

# 
public type Payment_intent_next_action_wechat_pay_display_qr_code record {
    # The data being used to generate QR code
    @constraint:String {maxLength: 5000}
    string data;
    # The base64 image data for a pre-generated QR code
    @constraint:String {maxLength: 5000}
    string image_data_url;
};

# Value list items allow you to add specific values to a given Radar value list, which can then be used in rules.
# 
# Related guide: [Managing List Items](https://stripe.com/docs/radar/lists#managing-list-items).
public type RadarValue_list_item record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The name or email address of the user who added this item to the value list.
    @constraint:String {maxLength: 5000}
    string created_by;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "radar.value_list_item" 'object;
    # The value of the item.
    @constraint:String {maxLength: 5000}
    string value;
    # The identifier of the value list this item belongs to.
    @constraint:String {maxLength: 5000}
    string value_list;
};

public type Subscriptions_subscription_exposed_id_body record {|
    # A list of prices and quantities that will generate invoice items appended to the first invoice for this subscription. You may pass up to 20 items.
    Add_invoice_item_entry_1[] add_invoice_items?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage. For more information, see the application fees [documentation](https://stripe.com/docs/connect/subscriptions#collecting-fees-on-subscriptions).
    decimal application_fee_percent?;
    # Automatic tax settings for this subscription.
    Automatic_tax_config_1 automatic_tax?;
    # Either `now` or `unchanged`. Setting the value to `now` resets the subscription's billing cycle anchor to the current time. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
    "now"|"unchanged" billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds.
    record {int amount_gte?; boolean reset_billing_cycle_anchor?;}|"" billing_thresholds?;
    # A timestamp at which the subscription should cancel. If set to a date before the current period ends, this will cause a proration if prorations have been enabled using `proration_behavior`. If set during a future period, this will always cause a proration for that period.
    int|"" cancel_at?;
    # Boolean indicating whether this subscription should cancel at the end of the current period.
    boolean cancel_at_period_end?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
    "charge_automatically"|"send_invoice" collection_method?;
    # The ID of the coupon to apply to this subscription. A coupon applied to a subscription will only affect invoices created for that particular subscription.
    @constraint:String {maxLength: 5000}
    string coupon?;
    # Number of days a customer has to pay invoices generated by this subscription. Valid only for subscriptions where `collection_method` is set to `send_invoice`.
    int days_until_due?;
    # ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    # ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    @constraint:String {maxLength: 5000}
    string default_source?;
    # The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription. Pass an empty string to remove previously-defined tax rates.
    DefaulttaxratesItemsString[]|"" default_tax_rates?;
    # Specifies which fields in the response should be expanded.
    Subscriptions_subscription_exposed_id_bodyExpandItemsString[] expand?;
    # A list of up to 20 subscription items, each with an attached price.
    Subscription_item_update_params[] items?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted.
    boolean off_session?;
    # If specified, payment collection for this subscription will be paused.
    record {"keep_as_draft"|"mark_uncollectible"|"void" behavior; int resumes_at?;}|"" pause_collection?;
    # Use `allow_incomplete` to transition the subscription to `status=past_due` if a payment is required but cannot be paid. This allows you to manage scenarios where additional user actions are needed to pay a subscription's invoice. For example, SCA regulation may require 3DS authentication to complete payment. See the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication) for Billing to learn more. This is the default behavior.
    # 
    # Use `default_incomplete` to transition the subscription to `status=past_due` when payment is required and await explicit confirmation of the invoice's payment intent. This allows simpler management of scenarios where additional user actions are needed to pay a subscription’s invoice. Such as failed payments, [SCA regulation](https://stripe.com/docs/billing/migration/strong-customer-authentication), or collecting a mandate for a bank debit payment method.
    # 
    # Use `pending_if_incomplete` to update the subscription using [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates). When you use `pending_if_incomplete` you can only pass the parameters [supported by pending updates](https://stripe.com/docs/billing/pending-updates-reference#supported-attributes).
    # 
    # Use `error_if_incomplete` if you want Stripe to return an HTTP 402 status code if a subscription's invoice cannot be paid. For example, if a payment method requires 3DS authentication due to SCA regulation and further user action is needed, this parameter does not update the subscription and returns an error instead. This was the default behavior for API versions prior to 2019-03-14. See the [changelog](https://stripe.com/docs/upgrades#2019-03-14) to learn more.
    "allow_incomplete"|"default_incomplete"|"error_if_incomplete"|"pending_if_incomplete" payment_behavior?;
    # Payment settings to pass to invoices created by the subscription.
    Payment_settings_2 payment_settings?;
    # Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
    record {"day"|"month"|"week"|"year" interval; int interval_count?;}|"" pending_invoice_item_interval?;
    # The promotion code to apply to this subscription. A promotion code applied to a subscription will only affect invoices created for that particular subscription.
    @constraint:String {maxLength: 5000}
    string promotion_code?;
    # Determines how to handle [prorations](https://stripe.com/docs/subscriptions/billing-cycle#prorations) when the billing cycle changes (e.g., when switching plans, resetting `billing_cycle_anchor=now`, or starting a trial), or if an item's `quantity` changes. Valid values are `create_prorations`, `none`, or `always_invoice`.
    # 
    # Passing `create_prorations` will cause proration invoice items to be created when applicable. These proration items will only be invoiced immediately under [certain conditions](https://stripe.com/docs/subscriptions/upgrading-downgrading#immediate-payment). In order to always invoice immediately for prorations, pass `always_invoice`.
    # 
    # Prorations can be disabled by passing `none`.
    "always_invoice"|"create_prorations"|"none" proration_behavior?;
    # If set, the proration will be calculated as though the subscription was updated at the given time. This can be used to apply exactly the same proration that was previewed with [upcoming invoice](https://stripe.com/docs/api#retrieve_customer_invoice) endpoint. It can also be used to implement custom proration logic, such as prorating by day instead of by second, by providing the time that you wish to use for proration calculations.
    int proration_date?;
    # If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges. This will be unset if you POST an empty value.
    record {decimal amount_percent?; string destination;}|"" transfer_data?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
    "now"|int trial_end?;
    # Indicates if a plan's `trial_period_days` should be applied to the subscription. Setting `trial_end` per subscription is preferred, and this defaults to `false`. Setting this flag to `true` together with `trial_end` is not allowed.
    boolean trial_from_plan?;
|};

# 
public type Setup_intent_payment_method_options_mandate_options_sepa_debit record {
};

# 
public type Setup_attempt_payment_method_details_au_becs_debit record {
};

# Usage records allow you to report customer usage and metrics to Stripe for
# metered billing of subscription prices.
# 
# Related guide: [Metered Billing](https://stripe.com/docs/billing/subscriptions/metered-billing).
public type Usage_record record {
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "usage_record" 'object;
    # The usage quantity for the specified date.
    int quantity;
    # The ID of the subscription item this usage record contains data for.
    @constraint:String {maxLength: 5000}
    string subscription_item;
    # The timestamp when this usage occurred.
    int timestamp;
};

# [Tax codes](https://stripe.com/docs/tax/tax-codes) classify goods and services for tax purposes.
public type Tax_code record {
    # A detailed description of which types of products the tax code represents.
    @constraint:String {maxLength: 5000}
    string description;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # A short name for the tax code.
    @constraint:String {maxLength: 5000}
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    "tax_code" 'object;
};

# The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
public type InvoiceLinesList_1 record {
    # Details about each object.
    Line_item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Charge_outcome record {
    # Possible values are `approved_by_network`, `declined_by_network`, `not_sent_to_network`, and `reversed_after_approval`. The value `reversed_after_approval` indicates the payment was [blocked by Stripe](https://stripe.com/docs/declines#blocked-payments) after bank authorization, and may temporarily appear as "pending" on a cardholder's statement.
    string? network_status?;
    # An enumerated value providing a more detailed explanation of the outcome's `type`. Charges blocked by Radar's default block rule have the value `highest_risk_level`. Charges placed in review by Radar's default review rule have the value `elevated_risk_level`. Charges authorized, blocked, or placed in review by custom rules have the value `rule`. See [understanding declines](https://stripe.com/docs/declines) for more details.
    string? reason?;
    # Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are `normal`, `elevated`, `highest`. For non-card payments, and card-based payments predating the public assignment of risk levels, this field will have the value `not_assessed`. In the event of an error in the evaluation, this field will have the value `unknown`. This field is only available with Radar.
    @constraint:String {maxLength: 5000}
    string risk_level?;
    # Stripe Radar's evaluation of the riskiness of the payment. Possible values for evaluated payments are between 0 and 100. For non-card payments, card-based payments predating the public assignment of risk scores, or in the event of an error during evaluation, this field will not be present. This field is only available with Radar for Fraud Teams.
    int risk_score?;
    # The ID of the Radar rule that matched the payment, if applicable.
    string|Rule rule?;
    # A human-readable description of the outcome type and reason, designed for you (the recipient of the payment), not your customer.
    string? seller_message?;
    # Possible values are `authorized`, `manual_review`, `issuer_declined`, `blocked`, and `invalid`. See [understanding declines](https://stripe.com/docs/declines) and [Radar reviews](https://stripe.com/docs/radar/reviews) for details.
    @constraint:String {maxLength: 5000}
    string 'type;
};

public type Subscription_trial_end "now"|int;

# 
public type Deleted_apple_pay_domain record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "apple_pay_domain" 'object;
};

# Point in Time
public type Gelato_data_document_report_date_of_birth record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type Invoice_payment_method_options_bancontact record {
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    "de"|"en"|"fr"|"nl" preferred_language;
};

# 
public type Portal_business_profile record {
    # The messaging shown to customers in the portal.
    string? headline?;
    # A link to the business’s publicly available privacy policy.
    @constraint:String {maxLength: 5000}
    string privacy_policy_url;
    # A link to the business’s publicly available terms of service.
    @constraint:String {maxLength: 5000}
    string terms_of_service_url;
};

# Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
public type Billing_details_inner_params record {
    Billing_details_address|"" address?;
    string email?;
    @constraint:String {maxLength: 5000}
    string name?;
    @constraint:String {maxLength: 5000}
    string phone?;
};

# Result from an id_number check
public type Gelato_id_number_report record {
    # Date of birth.
    Gelato_data_id_number_report_date? dob?;
    # Details on the verification error. Present when status is `unverified`.
    Gelato_id_number_report_error? 'error?;
    # First name.
    string? first_name?;
    # ID number.
    string? id_number?;
    # Type of ID number.
    "br_cpf"|"sg_nric"|"us_ssn" id_number_type?;
    # Last name.
    string? last_name?;
    # Status of this `id_number` check.
    "unverified"|"verified" status;
};

public type Source_type_ach_debit record {
    string? bank_name?;
    string? country?;
    string? fingerprint?;
    string? last4?;
    string? routing_number?;
    string? 'type?;
};

# 
public type Issuing_dispute_canceled_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Date when order was canceled.
    int? canceled_at?;
    # Whether the cardholder was provided with a cancellation policy.
    boolean? cancellation_policy_provided?;
    # Reason for canceling the order.
    string? cancellation_reason?;
    # Date when the cardholder expected to receive the product.
    int? expected_at?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Description of the merchandise or service that was purchased.
    string? product_description?;
    # Whether the product was a merchandise or service.
    "merchandise"|"service" product_type?;
    # Result of cardholder's attempt to return the product.
    "merchant_rejected"|"successful" return_status?;
    # Date when the product was returned or attempted to be returned.
    int? returned_at?;
};

# Some payment methods have no required amount that a customer must send.
# Customers can be instructed to send any amount, and it can be made up of
# multiple transactions. As such, sources can have multiple associated
# transactions.
public type Source_transaction record {
    # 
    Source_transaction_ach_credit_transfer_data ach_credit_transfer?;
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount your customer has pushed to the receiver.
    int amount;
    # 
    Source_transaction_chf_credit_transfer_data chf_credit_transfer?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # 
    Source_transaction_gbp_credit_transfer_data gbp_credit_transfer?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "source_transaction" 'object;
    # 
    Source_transaction_paper_check_data paper_check?;
    # 
    Source_transaction_sepa_credit_transfer_data sepa_credit_transfer?;
    # The ID of the source this transaction is attached to.
    @constraint:String {maxLength: 5000}
    string 'source;
    # The status of the transaction, one of `succeeded`, `pending`, or `failed`.
    @constraint:String {maxLength: 5000}
    string status;
    # The type of source this transaction is attached to.
    "ach_credit_transfer"|"ach_debit"|"alipay"|"bancontact"|"card"|"card_present"|"eps"|"giropay"|"ideal"|"klarna"|"multibanco"|"p24"|"sepa_debit"|"sofort"|"three_d_secure"|"wechat" 'type;
};

# 
public type Inline_response_200 record {
    Coupon[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000, pattern: re `^/v1/coupons`}
    string url;
};

# 
public type Account_tos_acceptance record {
    # The Unix timestamp marking when the account representative accepted their service agreement
    int? date?;
    # The IP address from which the account representative accepted their service agreement
    string? ip?;
    # The user's service agreement type
    @constraint:String {maxLength: 5000}
    string service_agreement?;
    # The user agent of the browser from which the account representative accepted their service agreement
    string? user_agent?;
};

# 
public type Payment_method_sofort record {
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
};

# 
public type Mandate_acss_debit record {
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    "combined"|"interval"|"sporadic" payment_schedule;
    # Transaction type of the mandate.
    "business"|"personal" transaction_type;
};

# 
public type Deleted_bitcoin_receiver record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "bitcoin_receiver" 'object;
};

# 
public type Account_payout_settings record {
    # A Boolean indicating if Stripe should try to reclaim negative balances from an attached bank account. See our [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances) documentation for details. Default value is `true` for Express accounts and `false` for Custom accounts.
    boolean debit_negative_balances;
    # 
    Transfer_schedule schedule;
    # The text that appears on the bank account statement for payouts. If not set, this defaults to the platform's bank descriptor as set in the Dashboard.
    string? statement_descriptor?;
};

# 
public type Payment_method_details_card_installments record {
    # Installment plan selected for the payment.
    Payment_method_details_card_installments_plan? plan?;
};

# 
public type Portal_subscription_cancel record {
    # 
    Portal_subscription_cancellation_reason cancellation_reason?;
    # Whether the feature is enabled.
    boolean enabled;
    # Whether to cancel subscriptions immediately or at the end of the billing period.
    "at_period_end"|"immediately" mode;
    # Whether to create prorations when canceling subscriptions. Possible values are `none` and `create_prorations`.
    "always_invoice"|"create_prorations"|"none" proration_behavior;
};

# A VerificationSession guides you through the process of collecting and verifying the identities
# of your users. It contains details about the type of verification, such as what [verification
# check](/docs/identity/verification-checks) to perform. Only create one VerificationSession for
# each verification in your system.
# 
# A VerificationSession transitions through [multiple
# statuses](/docs/identity/how-sessions-work) throughout its lifetime as it progresses through
# the verification flow. The VerificationSession contains the user’s verified data after
# verification checks are complete.
# 
# Related guide: [The Verification Sessions API](https://stripe.com/docs/identity/verification-sessions)
public type IdentityVerification_session record {
    # The short-lived client secret used by Stripe.js to [show a verification modal](https://stripe.com/docs/js/identity/modal) inside your app. This client secret expires after 24 hours and can only be used once. Don’t store it, log it, embed it in a URL, or expose it to anyone other than the user. Make sure that you have TLS enabled on any page that includes the client secret. Refer to our docs on [passing the client secret to the frontend](https://stripe.com/docs/identity/verification-sessions#client-secret) to learn more.
    string? client_secret?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # If present, this property tells you the last error encountered when processing the verification.
    Gelato_session_last_error? last_error?;
    # ID of the most recent VerificationReport. [Learn more about accessing detailed verification results.](https://stripe.com/docs/identity/verification-sessions#results)
    string|IdentityVerification_report? last_verification_report?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "identity.verification_session" 'object;
    # 
    Gelato_verification_session_options options;
    # Redaction status of this VerificationSession. If the VerificationSession is not redacted, this field will be null.
    Verification_session_redaction? redaction?;
    # Status of this VerificationSession. [Learn more about the lifecycle of sessions](https://stripe.com/docs/identity/how-sessions-work).
    "canceled"|"processing"|"requires_input"|"verified" status;
    # The type of [verification check](https://stripe.com/docs/identity/verification-checks) to be performed.
    "document"|"id_number" 'type;
    # The short-lived URL that you use to redirect a user to Stripe to submit their identity information. This URL expires after 48 hours and can only be used once. Don’t store it, log it, send it in emails or expose it to anyone other than the user. Refer to our docs on [verifying identity documents](https://stripe.com/docs/identity/verify-identity-documents?platform=web&type=redirect) to learn how to redirect users to Stripe.
    string? url?;
    # The user’s verified data.
    Gelato_verified_outputs? verified_outputs?;
};

# 
public type Login_link record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # String representing the object's type. Objects of the same type share the same value.
    "login_link" 'object;
    # The URL for the login link.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Source_mandate_notification_bacs_debit_data record {
    # Last 4 digits of the account number associated with the debit.
    @constraint:String {maxLength: 5000}
    string last4?;
};

public type Pending_invoice_item_interval_params record {
    "day"|"month"|"week"|"year" interval;
    int interval_count?;
};

public type Data_params record {
    "ae_trn"|"au_abn"|"au_arn"|"br_cnpj"|"br_cpf"|"ca_bn"|"ca_gst_hst"|"ca_pst_bc"|"ca_pst_mb"|"ca_pst_sk"|"ca_qst"|"ch_vat"|"cl_tin"|"es_cif"|"eu_vat"|"gb_vat"|"hk_br"|"id_npwp"|"il_vat"|"in_gst"|"jp_cn"|"jp_rn"|"kr_brn"|"li_uid"|"mx_rfc"|"my_frp"|"my_itn"|"my_sst"|"no_vat"|"nz_gst"|"ru_inn"|"ru_kpp"|"sa_vat"|"sg_gst"|"sg_uen"|"th_vat"|"tw_vat"|"us_ein"|"za_vat" 'type;
    string value;
};

# 
public type Deleted_coupon record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "coupon" 'object;
};

# 
public type Gelato_verified_outputs record {
    # The user's verified address.
    Address? address?;
    # The user’s verified date of birth.
    Gelato_data_verified_outputs_date? dob?;
    # The user's verified first name.
    string? first_name?;
    # The user's verified id number.
    string? id_number?;
    # The user's verified id number type.
    "br_cpf"|"sg_nric"|"us_ssn" id_number_type?;
    # The user's verified last name.
    string? last_name?;
};

# 
public type Issuing_cardholder_requirements record {
    # If `disabled_reason` is present, all cards will decline authorizations with `cardholder_verification_required` reason.
    "listed"|"rejected.listed"|"under_review" disabled_reason?;
    # Array of fields that need to be collected in order to verify and re-enable the cardholder.
    ("company.tax_id"|"individual.dob.day"|"individual.dob.month"|"individual.dob.year"|"individual.first_name"|"individual.last_name"|"individual.verification.document")[]? past_due?;
};

# 
public type Payment_method_details_grabpay record {
    # Unique transaction id generated by GrabPay
    string? transaction_id?;
};

# 
public type CustomerResourceCustomerList record {
    Customer[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000, pattern: re `^/v1/customers`}
    string url;
};

# 
public type Payment_method_interac_present record {
};

# 
public type Invoice_tax_amount record {
    # The amount, in %s, of the tax.
    int amount;
    # Whether this tax amount is inclusive or exclusive.
    boolean inclusive;
    # The tax rate that was applied to get this tax amount.
    string|Tax_rate tax_rate;
};

public type Discounts_data_param Discounts_data_param_1[];

# 
public type Payment_method_eps record {
    # The customer's bank. Should be one of `arzte_und_apotheker_bank`, `austrian_anadi_bank_ag`, `bank_austria`, `bankhaus_carl_spangler`, `bankhaus_schelhammer_und_schattera_ag`, `bawag_psk_ag`, `bks_bank_ag`, `brull_kallmus_bank_ag`, `btv_vier_lander_bank`, `capital_bank_grawe_gruppe_ag`, `dolomitenbank`, `easybank_ag`, `erste_bank_und_sparkassen`, `hypo_alpeadriabank_international_ag`, `hypo_noe_lb_fur_niederosterreich_u_wien`, `hypo_oberosterreich_salzburg_steiermark`, `hypo_tirol_bank_ag`, `hypo_vorarlberg_bank_ag`, `hypo_bank_burgenland_aktiengesellschaft`, `marchfelder_bank`, `oberbank_ag`, `raiffeisen_bankengruppe_osterreich`, `schoellerbank_ag`, `sparda_bank_wien`, `volksbank_gruppe`, `volkskreditbank_ag`, or `vr_bank_braunau`.
    "arzte_und_apotheker_bank"|"austrian_anadi_bank_ag"|"bank_austria"|"bankhaus_carl_spangler"|"bankhaus_schelhammer_und_schattera_ag"|"bawag_psk_ag"|"bks_bank_ag"|"brull_kallmus_bank_ag"|"btv_vier_lander_bank"|"capital_bank_grawe_gruppe_ag"|"dolomitenbank"|"easybank_ag"|"erste_bank_und_sparkassen"|"hypo_alpeadriabank_international_ag"|"hypo_bank_burgenland_aktiengesellschaft"|"hypo_noe_lb_fur_niederosterreich_u_wien"|"hypo_oberosterreich_salzburg_steiermark"|"hypo_tirol_bank_ag"|"hypo_vorarlberg_bank_ag"|"marchfelder_bank"|"oberbank_ag"|"raiffeisen_bankengruppe_osterreich"|"schoellerbank_ag"|"sparda_bank_wien"|"volksbank_gruppe"|"volkskreditbank_ag"|"vr_bank_braunau" bank?;
};

# With `Recipient` objects, you can transfer money from your Stripe account to a
# third-party bank account or debit card. The API allows you to create, delete,
# and update your recipients. You can retrieve individual recipients as well as
# a list of all your recipients.
# 
# **`Recipient` objects have been deprecated in favor of
# [Connect](https://stripe.com/docs/connect), specifically Connect's much more powerful
# [Account objects](https://stripe.com/docs/api#account). Stripe accounts that don't already use
# recipients can no longer begin doing so. Please use `Account` objects
# instead.**
public type Recipient record {
    # Hash describing the current account on the recipient, if there is one.
    Bank_account? active_account?;
    # 
    CardList? cards?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The default card to use for creating transfers to this recipient.
    string|Card? default_card?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    string? email?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # The ID of the [Custom account](https://stripe.com/docs/connect/custom-accounts) this recipient was migrated to. If set, the recipient can no longer be updated, nor can transfers be made to it: use the Custom account instead.
    string|Account? migrated_to?;
    # Full, legal name of the recipient.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    "recipient" 'object;
    string|Account rolled_back_from?;
    # Type of the recipient, one of `individual` or `corporation`.
    @constraint:String {maxLength: 5000}
    string 'type;
};

# Shows last VerificationSession error
public type Gelato_session_last_error record {
    # A short machine-readable string giving the reason for the verification or user-session failure.
    "abandoned"|"consent_declined"|"country_not_supported"|"device_not_supported"|"document_expired"|"document_type_not_supported"|"document_unverified_other"|"id_number_insufficient_document_data"|"id_number_mismatch"|"id_number_unverified_other"|"selfie_document_missing_photo"|"selfie_face_mismatch"|"selfie_manipulated"|"selfie_unverified_other"|"under_supported_age" code?;
    # A message that explains the reason for verification or user-session failure.
    string? reason?;
};

# You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
public type IssuingCard record {
    # The brand of the card.
    @constraint:String {maxLength: 5000}
    string brand;
    # The reason why the card was canceled.
    "lost"|"stolen" cancellation_reason?;
    # An Issuing `Cardholder` object represents an individual or business entity who is [issued](https://stripe.com/docs/issuing) cards.
    # 
    # Related guide: [How to create a Cardholder](https://stripe.com/docs/issuing/cards#create-cardholder)
    IssuingCardholder cardholder;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The card's CVC. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
    @constraint:String {maxLength: 5000}
    string cvc?;
    # The expiration month of the card.
    int exp_month;
    # The expiration year of the card.
    int exp_year;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The last 4 digits of the card number.
    @constraint:String {maxLength: 5000}
    string last4;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # The full unredacted card number. For security reasons, this is only available for virtual cards, and will be omitted unless you explicitly request it with [the `expand` parameter](https://stripe.com/docs/api/expanding_objects). Additionally, it's only available via the ["Retrieve a card" endpoint](https://stripe.com/docs/api/issuing/cards/retrieve), not via "List all cards" or any other endpoint.
    @constraint:String {maxLength: 5000}
    string number?;
    # String representing the object's type. Objects of the same type share the same value.
    "issuing.card" 'object;
    # The latest card that replaces this card, if any.
    string|IssuingCard? replaced_by?;
    # The card this card replaces, if any.
    string|IssuingCard? replacement_for?;
    # The reason why the previous card needed to be replaced.
    "damaged"|"expired"|"lost"|"stolen" replacement_reason?;
    # Where and how the card will be shipped.
    Issuing_card_shipping? shipping?;
    # 
    Issuing_card_authorization_controls spending_controls;
    # Whether authorizations can be approved on this card.
    "active"|"canceled"|"inactive" status;
    # The type of the card.
    "physical"|"virtual" 'type;
};

public type Payment_method_options record {
    record {"de"|"en"|"fr"|"nl" preferred_language?;}|"" bancontact?;
    record {"any"|"automatic" request_three_d_secure?;}|"" card?;
};

# 
public type Payment_method_oxxo record {
};

# Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
# [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.
# 
# For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.
# 
# Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
public type Price record {
    # Whether the price can be used for new purchases.
    boolean active;
    # Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
    "per_unit"|"tiered" billing_scheme;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # A lookup key used to retrieve prices dynamically from a static string.
    string? lookup_key?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # A brief description of the price, hidden from customers.
    string? nickname?;
    # String representing the object's type. Objects of the same type share the same value.
    "price" 'object;
    # The ID of the product this price is associated with.
    string|Product|Deleted_product product;
    # The recurring components of a price such as `interval` and `usage_type`.
    Recurring? recurring?;
    # Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
    "exclusive"|"inclusive"|"unspecified" tax_behavior?;
    # Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    Price_tier[] tiers?;
    # Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
    "graduated"|"volume" tiers_mode?;
    # Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
    Transform_quantity? transform_quantity?;
    # One of `one_time` or `recurring` depending on whether the price is for a one-time purchase or a recurring (subscription) purchase.
    "one_time"|"recurring" 'type;
    # The unit amount in %s to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.
    int? unit_amount?;
    # The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.
    string? unit_amount_decimal?;
};

public type Card_details_params record {
    @constraint:String {maxLength: 5000}
    string cvc?;
    int exp_month;
    int exp_year;
    @constraint:String {maxLength: 5000}
    string number;
};

public type Bancontact_invoice_payment_method_options_param record {
    "de"|"en"|"fr"|"nl" preferred_language?;
};

# 
public type Application_fee record {
    # ID of the Stripe account this fee was taken from.
    string|Account account;
    # Amount earned, in %s.
    int amount;
    # Amount in %s refunded (can be less than the amount attribute on the fee if a partial refund was issued)
    int amount_refunded;
    # ID of the Connect application that earned the fee.
    string|Application application;
    # Balance transaction that describes the impact of this collected application fee on your account balance (not including refunds).
    string|Balance_transaction? balance_transaction?;
    # ID of the charge that the application fee was taken from.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "application_fee" 'object;
    # ID of the corresponding charge on the platform account, if this fee was the result of a charge using the `destination` parameter.
    string|Charge? originating_transaction?;
    # Whether the fee has been fully refunded. If the fee is only partially refunded, this attribute will still be false.
    boolean refunded;
    # A list of refunds that have been applied to the fee.
    FeeRefundList refunds;
};

# 
public type Payment_method_details_klarna record {
};

# 
public type Payment_method_details_ach_credit_transfer record {
    # Account number to transfer funds to.
    string? account_number?;
    # Name of the bank associated with the routing number.
    string? bank_name?;
    # Routing transit number for the bank account to transfer funds to.
    string? routing_number?;
    # SWIFT code of the bank associated with the routing number.
    string? swift_code?;
};

# 
public type Payment_method_details_sofort record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Payment_method? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the SOFORT authorization page that the customer is redirected to.
    # Can be one of `de`, `en`, `es`, `fr`, `it`, `nl`, or `pl`
    "de"|"en"|"es"|"fr"|"it"|"nl"|"pl" preferred_language?;
    # Owner's verified full name. Values are verified or provided by SOFORT directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

public type Invoice_void_body record {|
    # Specifies which fields in the response should be expanded.
    Invoice_void_bodyExpandItemsString[] expand?;
|};

# This is an object representing your Stripe balance. You can retrieve it to see
# the balance currently on your Stripe account.
# 
# You can also retrieve the balance history, which contains a list of
# [transactions](https://stripe.com/docs/reporting/balance-transaction-types) that contributed to the balance
# (charges, payouts, and so forth).
# 
# The available and pending amounts for each currency are broken down further by
# payment source types.
# 
# Related guide: [Understanding Connect Account Balances](https://stripe.com/docs/connect/account-balances).
public type Balance record {
    # Funds that are available to be transferred or paid out, whether automatically by Stripe or explicitly via the [Transfers API](https://stripe.com/docs/api#transfers) or [Payouts API](https://stripe.com/docs/api#payouts). The available balance for each currency and payment type can be found in the `source_types` property.
    Balance_amount[] available;
    # Funds held due to negative balances on connected Custom accounts. The connect reserve balance for each currency and payment type can be found in the `source_types` property.
    Balance_amount[] connect_reserved?;
    # Funds that can be paid out using Instant Payouts.
    Balance_amount[] instant_available?;
    # 
    Balance_detail issuing?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "balance" 'object;
    # Funds that are not yet available in the balance, due to the 7-day rolling pay cycle. The pending balance for each currency, and for each payment type, can be found in the `source_types` property.
    Balance_amount[] pending;
};

# This is an object representing a file hosted on Stripe's servers. The
# file may have been uploaded by yourself using the [create file](https://stripe.com/docs/api#create_file)
# request (for example, when uploading dispute evidence) or it may have
# been created by Stripe (for example, the results of a [Sigma scheduled
# query](#scheduled_queries)).
# 
# Related guide: [File Upload Guide](https://stripe.com/docs/file-upload).
public type File record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The time at which the file expires and is no longer available in epoch seconds.
    int? expires_at?;
    # A filename for the file, suitable for saving to a filesystem.
    string? filename?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # A list of [file links](https://stripe.com/docs/api#file_links) that point at this file.
    FileFileLinkList? links?;
    # String representing the object's type. Objects of the same type share the same value.
    "file" 'object;
    # The [purpose](https://stripe.com/docs/file-upload#uploading-a-file) of the uploaded file.
    "account_requirement"|"additional_verification"|"business_icon"|"business_logo"|"customer_signature"|"dispute_evidence"|"document_provider_identity_document"|"finance_report_run"|"identity_document"|"identity_document_downloadable"|"pci_document"|"selfie"|"sigma_scheduled_query"|"tax_document_user_upload" purpose;
    # The size in bytes of the file object.
    int size;
    # A user friendly title for the document.
    string? title?;
    # The type of the file returned (e.g., `csv`, `pdf`, `jpg`, or `png`).
    string? 'type?;
    # The URL from which the file can be downloaded using your live secret API key.
    string? url?;
};

# 
public type Tax_id_verification record {
    # Verification status, one of `pending`, `verified`, `unverified`, or `unavailable`.
    "pending"|"unavailable"|"unverified"|"verified" status;
    # Verified address.
    string? verified_address?;
    # Verified name.
    string? verified_name?;
};

# 
public type Legal_entity_company record {
    # 
    Address address?;
    # The Kana variation of the company's primary address (Japan only).
    Legal_entity_japan_address? address_kana?;
    # The Kanji variation of the company's primary address (Japan only).
    Legal_entity_japan_address? address_kanji?;
    # Whether the company's directors have been provided. This Boolean will be `true` if you've manually indicated that all directors are provided via [the `directors_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-directors_provided).
    boolean directors_provided?;
    # Whether the company's executives have been provided. This Boolean will be `true` if you've manually indicated that all executives are provided via [the `executives_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-executives_provided), or if Stripe determined that sufficient executives were provided.
    boolean executives_provided?;
    # The company's legal name.
    string? name?;
    # The Kana variation of the company's legal name (Japan only).
    string? name_kana?;
    # The Kanji variation of the company's legal name (Japan only).
    string? name_kanji?;
    # Whether the company's owners have been provided. This Boolean will be `true` if you've manually indicated that all owners are provided via [the `owners_provided` parameter](https://stripe.com/docs/api/accounts/update#update_account-company-owners_provided), or if Stripe determined that sufficient owners were provided. Stripe determines ownership requirements using both the number of owners provided and their total percent ownership (calculated by adding the `percent_ownership` of each owner together).
    boolean owners_provided?;
    # The company's phone number (used for verification).
    string? phone?;
    # The category identifying the legal structure of the company or legal entity. See [Business structure](https://stripe.com/docs/connect/identity-verification#business-structure) for more details.
    "free_zone_establishment"|"free_zone_llc"|"government_instrumentality"|"governmental_unit"|"incorporated_non_profit"|"limited_liability_partnership"|"llc"|"multi_member_llc"|"private_company"|"private_corporation"|"private_partnership"|"public_company"|"public_corporation"|"public_partnership"|"single_member_llc"|"sole_establishment"|"sole_proprietorship"|"tax_exempt_government_instrumentality"|"unincorporated_association"|"unincorporated_non_profit" structure?;
    # Whether the company's business ID number was provided.
    boolean tax_id_provided?;
    # The jurisdiction in which the `tax_id` is registered (Germany-based companies only).
    @constraint:String {maxLength: 5000}
    string tax_id_registrar?;
    # Whether the company's business VAT number was provided.
    boolean vat_id_provided?;
    # Information on the verification state of the company.
    Legal_entity_company_verification? verification?;
};

# 
public type Gelato_session_document_options record {
    # Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a document_type_not_allowed error code.
    ("driving_license"|"id_card"|"passport")[] allowed_types?;
    # Collect an ID number and perform an [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
    boolean require_id_number?;
    # Disable image uploads, identity document images have to be captured using the device’s camera.
    boolean require_live_capture?;
    # Capture a face image and perform a [selfie check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://stripe.com/docs/identity/selfie).
    boolean require_matching_selfie?;
};

# Contains information about what this coupon applies to
public type Coupon_applies_to record {
    # A list of product IDs this coupon applies to
    Coupon_applies_toProductsItemsString[] products;
};

# 
public type Source_transaction_paper_check_data record {
    # Time at which the deposited funds will be available for use. Measured in seconds since the Unix epoch.
    @constraint:String {maxLength: 5000}
    string available_at?;
    # Comma-separated list of invoice IDs associated with the paper check.
    @constraint:String {maxLength: 5000}
    string invoices?;
};

# Object representing the subscription schedule's default settings.
public type Default_settings_params record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner’s Stripe account. The request must be made by a platform account on a connected account in order to set an application fee percentage.
    decimal application_fee_percent?;
    # Default settings for automatic tax computation
    Automatic_tax_config_2 automatic_tax?;
    # Can be set to phase_start to set the anchor to the start of the phase or automatic to automatically change it if needed. Cannot be set to phase_start if this phase specifies a trial
    "automatic"|"phase_start" billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period. Pass an empty string to remove previously-defined thresholds
    Billing_threshold_params|"" billing_thresholds?;
    # Either charge_automatically, or send_invoice. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to charge_automatically on creation
    "charge_automatically"|"send_invoice" collection_method?;
    # ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer’s invoice settings
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    # All invoices will be billed using the specified settings
    Subscription_schedules_param invoice_settings?;
    # The data with which to automatically create a Transfer for each of the associated subscription’s invoices
    Transfer_data_specs|"" transfer_data?;
};

# 
public type Account_decline_charge_on record {
    # Whether Stripe automatically declines charges with an incorrect ZIP or postal code. This setting only applies when a ZIP or postal code is provided and they fail bank verification.
    boolean avs_failure;
    # Whether Stripe automatically declines charges with an incorrect CVC. This setting only applies when a CVC is provided and it fails bank verification.
    boolean cvc_failure;
};

# 
public type Payment_method_card_wallet_samsung_pay record {
};

# 
public type Quotes_resource_status_transitions record {
    # The time that the quote was accepted. Measured in seconds since Unix epoch.
    int? accepted_at?;
    # The time that the quote was canceled. Measured in seconds since Unix epoch.
    int? canceled_at?;
    # The time that the quote was finalized. Measured in seconds since Unix epoch.
    int? finalized_at?;
};

# Object representing the subscription schedule's default settings.
public type Default_settings_params_1 record {
    decimal application_fee_percent?;
    Automatic_tax_config_3 automatic_tax?;
    "automatic"|"phase_start" billing_cycle_anchor?;
    Billing_threshold_params|"" billing_thresholds?;
    "charge_automatically"|"send_invoice" collection_method?;
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    Subscription_schedules_param_1 invoice_settings?;
    Transfer_data_specs|"" transfer_data?;
};

# 
public type Setup_intent_next_action_verify_with_microdeposits record {
    # The timestamp when the microdeposits are expected to land.
    int arrival_date;
    # The URL for the hosted verification page, which allows customers to verify their bank account.
    @constraint:String {maxLength: 5000}
    string hosted_verification_url;
};

public type Source_type_wechat record {
    string prepay_id?;
    string? qr_code_url?;
    string statement_descriptor?;
};

# 
public type Invoices_payment_settings record {
    # Payment-method-specific configuration to provide to the invoice’s PaymentIntent.
    Invoices_payment_method_options? payment_method_options?;
    # The list of payment method types (e.g. card) to provide to the invoice’s PaymentIntent. If not set, Stripe attempts to automatically determine the types to use by looking at the invoice’s default payment method, the subscription’s default payment method, the customer’s default payment method, and your [invoice template settings](https://dashboard.stripe.com/settings/billing/invoice).
    ("ach_credit_transfer"|"ach_debit"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"fpx"|"giropay"|"ideal"|"sepa_debit"|"sofort"|"wechat_pay")[]? payment_method_types?;
};

public type Payment_methods_payment_method_body record {|
    # Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    Billing_details_inner_params billing_details?;
    # If this is a `card` PaymentMethod, this hash contains the user's card details.
    Update_api_param card?;
    # Specifies which fields in the response should be expanded.
    Payment_methods_payment_method_bodyExpandItemsString[] expand?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
|};

# Line items that make up the credit note
public type CreditNoteLinesList record {
    # Details about each object.
    Credit_note_line_item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Invoice_threshold_reason record {
    # The total invoice amount threshold boundary if it triggered the threshold invoice.
    int? amount_gte?;
    # Indicates which line items triggered a threshold invoice.
    Invoice_item_threshold_reason[] item_reasons;
};

public type Source_type_acss_debit record {
    string? bank_address_city?;
    string? bank_address_line_1?;
    string? bank_address_line_2?;
    string? bank_address_postal_code?;
    string? bank_name?;
    string? category?;
    string? country?;
    string? fingerprint?;
    string? last4?;
    string? routing_number?;
};

public type Additional_properties record {|
    string...;
|};

# 
public type Account_capabilities record {
    # The status of the ACSS Direct Debits payments capability of the account, or whether the account can directly process ACSS Direct Debits charges.
    "active"|"inactive"|"pending" acss_debit_payments?;
    # The status of the Afterpay Clearpay capability of the account, or whether the account can directly process Afterpay Clearpay charges.
    "active"|"inactive"|"pending" afterpay_clearpay_payments?;
    # The status of the BECS Direct Debit (AU) payments capability of the account, or whether the account can directly process BECS Direct Debit (AU) charges.
    "active"|"inactive"|"pending" au_becs_debit_payments?;
    # The status of the Bacs Direct Debits payments capability of the account, or whether the account can directly process Bacs Direct Debits charges.
    "active"|"inactive"|"pending" bacs_debit_payments?;
    # The status of the Bancontact payments capability of the account, or whether the account can directly process Bancontact charges.
    "active"|"inactive"|"pending" bancontact_payments?;
    # The status of the boleto payments capability of the account, or whether the account can directly process boleto charges.
    "active"|"inactive"|"pending" boleto_payments?;
    # The status of the card issuing capability of the account, or whether you can use Issuing to distribute funds on cards
    "active"|"inactive"|"pending" card_issuing?;
    # The status of the card payments capability of the account, or whether the account can directly process credit and debit card charges.
    "active"|"inactive"|"pending" card_payments?;
    # The status of the Cartes Bancaires payments capability of the account, or whether the account can directly process Cartes Bancaires card charges in EUR currency.
    "active"|"inactive"|"pending" cartes_bancaires_payments?;
    # The status of the EPS payments capability of the account, or whether the account can directly process EPS charges.
    "active"|"inactive"|"pending" eps_payments?;
    # The status of the FPX payments capability of the account, or whether the account can directly process FPX charges.
    "active"|"inactive"|"pending" fpx_payments?;
    # The status of the giropay payments capability of the account, or whether the account can directly process giropay charges.
    "active"|"inactive"|"pending" giropay_payments?;
    # The status of the GrabPay payments capability of the account, or whether the account can directly process GrabPay charges.
    "active"|"inactive"|"pending" grabpay_payments?;
    # The status of the iDEAL payments capability of the account, or whether the account can directly process iDEAL charges.
    "active"|"inactive"|"pending" ideal_payments?;
    # The status of the JCB payments capability of the account, or whether the account (Japan only) can directly process JCB credit card charges in JPY currency.
    "active"|"inactive"|"pending" jcb_payments?;
    # The status of the legacy payments capability of the account.
    "active"|"inactive"|"pending" legacy_payments?;
    # The status of the OXXO payments capability of the account, or whether the account can directly process OXXO charges.
    "active"|"inactive"|"pending" oxxo_payments?;
    # The status of the P24 payments capability of the account, or whether the account can directly process P24 charges.
    "active"|"inactive"|"pending" p24_payments?;
    # The status of the SEPA Direct Debits payments capability of the account, or whether the account can directly process SEPA Direct Debits charges.
    "active"|"inactive"|"pending" sepa_debit_payments?;
    # The status of the Sofort payments capability of the account, or whether the account can directly process Sofort charges.
    "active"|"inactive"|"pending" sofort_payments?;
    # The status of the tax reporting 1099-K (US) capability of the account.
    "active"|"inactive"|"pending" tax_reporting_us_1099_k?;
    # The status of the tax reporting 1099-MISC (US) capability of the account.
    "active"|"inactive"|"pending" tax_reporting_us_1099_misc?;
    # The status of the transfers capability of the account, or whether your platform can transfer funds to the account.
    "active"|"inactive"|"pending" transfers?;
};

# 
public type Invoice_line_item_period record {
    # End of the line item's billing period
    int end;
    # Start of the line item's billing period
    int 'start;
};

# 
public type Plan_tier record {
    # Price for the entire tier.
    int? flat_amount?;
    # Same as `flat_amount`, but contains a decimal value with at most 12 decimal places.
    string? flat_amount_decimal?;
    # Per unit price for units relevant to the tier.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
    # Up to and including to this quantity will be contained in the tier.
    int? up_to?;
};

public type Products_id_body record {|
    # Whether the product is available for purchase.
    boolean active?;
    # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
    @constraint:String {maxLength: 40000}
    string description?;
    # Specifies which fields in the response should be expanded.
    Products_id_bodyExpandItemsString[] expand?;
    # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    string[]|"" images?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    Additional_properties|"" metadata?;
    # The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
    @constraint:String {maxLength: 5000}
    string name?;
    # The dimensions of this product for shipping purposes.
    Package_dimentions_specs|"" package_dimensions?;
    # Whether this product is shipped (i.e., physical goods).
    boolean shippable?;
    # An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.
    # 
    # This may be up to 22 characters. The statement description may not include `<`, `>`, `\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.
    #  It must contain at least one letter. May only be set if `type=service`.
    @constraint:String {maxLength: 22}
    string statement_descriptor?;
    # A [tax code](https://stripe.com/docs/tax/tax-codes) ID.
    string|"" tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions. May only be set if `type=service`.
    @constraint:String {maxLength: 12}
    string unit_label?;
    # A URL of a publicly-accessible webpage for this product.
    string url?;
|};

public type Schedule_cancel_body record {|
    # Specifies which fields in the response should be expanded.
    Schedule_cancel_bodyExpandItemsString[] expand?;
    # If the subscription schedule is `active`, indicates if a final invoice will be generated that contains any un-invoiced metered usage and new/pending proration invoice items. Defaults to `true`.
    boolean invoice_now?;
    # If the subscription schedule is `active`, indicates if the cancellation should be prorated. Defaults to `true`.
    boolean prorate?;
|};

# 
public type Payment_method_fpx record {
    # The customer's bank, if provided. Can be one of `affin_bank`, `alliance_bank`, `ambank`, `bank_islam`, `bank_muamalat`, `bank_rakyat`, `bsn`, `cimb`, `hong_leong_bank`, `hsbc`, `kfh`, `maybank2u`, `ocbc`, `public_bank`, `rhb`, `standard_chartered`, `uob`, `deutsche_bank`, `maybank2e`, or `pb_enterprise`.
    "affin_bank"|"alliance_bank"|"ambank"|"bank_islam"|"bank_muamalat"|"bank_rakyat"|"bsn"|"cimb"|"deutsche_bank"|"hong_leong_bank"|"hsbc"|"kfh"|"maybank2e"|"maybank2u"|"ocbc"|"pb_enterprise"|"public_bank"|"rhb"|"standard_chartered"|"uob" bank;
};

# A list of reversals that have been applied to the transfer.
public type TransferReversalList record {
    # Details about each object.
    Transfer_reversal[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# A Reader represents a physical device for accepting payment details.
# 
# Related guide: [Connecting to a Reader](https://stripe.com/docs/terminal/readers/connecting).
public type TerminalReader record {
    # The current software version of the reader.
    string? device_sw_version?;
    # Type of reader, one of `bbpos_chipper2x` or `verifone_P400`.
    "bbpos_chipper2x"|"verifone_P400" device_type;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The local IP address of the reader.
    string? ip_address?;
    # Custom label given to the reader for easier identification.
    @constraint:String {maxLength: 5000}
    string label;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The location identifier of the reader.
    string|TerminalLocation? location?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "terminal.reader" 'object;
    # Serial number of the reader.
    @constraint:String {maxLength: 5000}
    string serial_number;
    # The networking status of the reader.
    string? status?;
};

# An error response from the Stripe API
public type Error record {
    # 
    Api_errors 'error;
};

# 
public type Payment_intent_payment_method_options_sepa_debit record {
    # 
    Payment_intent_payment_method_options_mandate_options_sepa_debit mandate_options?;
};

# 
public type Discounts_resource_discount_amount record {
    # The amount, in %s, of the discount.
    int amount;
    # The discount that was applied to get this discount amount.
    string|Discount|Deleted_discount discount;
};

# 
public type Payment_intent_payment_method_options_card record {
    # Installment details for this payment (Mexico only).
    # 
    # For more information, see the [installments integration guide](https://stripe.com/docs/payments/installments).
    Payment_method_options_card_installments? installments?;
    # Selected network to process this payment intent on. Depends on the available networks of the card attached to the payment intent. Can be only set confirm-time.
    "amex"|"cartes_bancaires"|"diners"|"discover"|"interac"|"jcb"|"mastercard"|"unionpay"|"unknown"|"visa" network?;
    # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    "any"|"automatic"|"challenge_only" request_three_d_secure?;
};

# 
public type Card_mandate_payment_method_details record {
};

# 
public type Payment_method_details_card_wallet_google_pay record {
};

# 
public type Subscription_schedule_current_phase record {
    # The end of this phase of the subscription schedule.
    int end_date;
    # The start of this phase of the subscription schedule.
    int start_date;
};

public type Invoice_pay_body record {|
    # Specifies which fields in the response should be expanded.
    Invoice_pay_bodyExpandItemsString[] expand?;
    # In cases where the source used to pay the invoice has insufficient funds, passing `forgive=true` controls whether a charge should be attempted for the full amount available on the source, up to the amount to fully pay the invoice. This effectively forgives the difference between the amount available on the source and the amount due. 
    # 
    # Passing `forgive=false` will fail the charge if the source hasn't been pre-funded with the right amount. An example for this case is with ACH Credit Transfers and wires: if the amount wired is less than the amount due by a small amount, you might want to forgive the difference. Defaults to `false`.
    boolean forgive?;
    # Indicates if a customer is on or off-session while an invoice payment is attempted. Defaults to `true` (off-session).
    boolean off_session?;
    # Boolean representing whether an invoice is paid outside of Stripe. This will result in no charge being made. Defaults to `false`.
    boolean paid_out_of_band?;
    # A PaymentMethod to be charged. The PaymentMethod must be the ID of a PaymentMethod belonging to the customer associated with the invoice being paid.
    @constraint:String {maxLength: 5000}
    string payment_method?;
    # A payment source to be charged. The source must be the ID of a source belonging to the customer associated with the invoice being paid.
    @constraint:String {maxLength: 5000}
    string 'source?;
|};

public type Customer_details_param_1 record {
    Customer_adresss|"" address?;
    Customer_address_with_name|"" shipping?;
    Tax_param_1 tax?;
    ""|"exempt"|"none"|"reverse" tax_exempt?;
    Data_params[] tax_ids?;
};

# 
public type Balance_amount_by_source_type record {
    # Amount for bank account.
    int bank_account?;
    # Amount for card.
    int card?;
    # Amount for FPX.
    int fpx?;
};

# 
public type Customer_acceptance record {
    # The time at which the customer accepted the Mandate.
    int? accepted_at?;
    # 
    Offline_acceptance offline?;
    # 
    Online_acceptance online?;
    # The type of customer acceptance information included with the Mandate. One of `online` or `offline`.
    "offline"|"online" 'type;
};

public type Due_date Range_query_specs|int;

public type Subscription_item_create_params record {
    Item_billing_thresholds_param|"" billing_thresholds?;
    record {|string...;|} metadata?;
    @constraint:String {maxLength: 5000}
    string price?;
    Recurring_price_data_1 price_data?;
    int quantity?;
    Tax_rate_array|"" tax_rates?;
};

# Settings for automatic tax lookup for this invoice.
public type Automatic_tax_param record {
    boolean enabled;
};

public type Transfer_data_specs record {
    decimal amount_percent?;
    string destination;
};

# 
public type Gelato_selfie_report_error record {
    # A short machine-readable string giving the reason for the verification failure.
    "selfie_document_missing_photo"|"selfie_face_mismatch"|"selfie_manipulated"|"selfie_unverified_other" code?;
    # A human-readable message giving the reason for the failure. These messages can be shown to your users.
    string? reason?;
};

# Tax details about the customer.
public type Tax_param record {
    string|"" ip_address?;
};

public type Payment_method_options_1 record {
    Bancontact_invoice_payment_method_options_param|"" bancontact?;
    Card_invoice_payment_method_options_param|"" card?;
};

# 
public type Deleted_webhook_endpoint record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "webhook_endpoint" 'object;
};

# 
public type Issuing_transaction_flight_data record {
    # The time that the flight departed.
    int? departure_at?;
    # The name of the passenger.
    string? passenger_name?;
    # Whether the ticket is refundable.
    boolean? refundable?;
    # The legs of the trip.
    Issuing_transaction_flight_data_leg[]? segments?;
    # The travel agency that issued the ticket.
    string? travel_agency?;
};

# 
public type Networks record {
    # All available networks for the card.
    NetworksAvailableItemsString[] available;
    # The preferred network for the card.
    string? preferred?;
};

# 
public type Bitcoin_transaction record {
    # The amount of `currency` that the transaction was converted to in real-time.
    int amount;
    # The amount of bitcoin contained in the transaction.
    int bitcoin_amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) to which this transaction was converted.
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "bitcoin_transaction" 'object;
    # The receiver to which this transaction was sent.
    @constraint:String {maxLength: 5000}
    string receiver;
};

# 
public type Payment_pages_checkout_session_automatic_tax record {
    # Indicates whether automatic tax is enabled for the session
    boolean enabled;
    # The status of the most recent automated tax calculation for this session.
    "complete"|"failed"|"requires_location_inputs" status?;
};

# 
public type Portal_payment_method_update record {
    # Whether the feature is enabled.
    boolean enabled;
};

public type Source_type_alipay record {
    string? data_string?;
    string? native_url?;
    string? statement_descriptor?;
};

public type Source_type_sofort record {
    string? bank_code?;
    string? bank_name?;
    string? bic?;
    string? country?;
    string? iban_last4?;
    string? preferred_language?;
    string? statement_descriptor?;
};

# 
public type Sepa_debit_generated_from record {
    # The ID of the Charge that generated this PaymentMethod, if any.
    string|Charge? charge?;
    # The ID of the SetupAttempt that generated this PaymentMethod, if any.
    string|Setup_attempt? setup_attempt?;
};

public type External_account Bank_account|Card;

# 
public type Account_settings record {
    # 
    Account_bacs_debit_payments_settings bacs_debit_payments?;
    # 
    Account_branding_settings branding;
    # 
    Account_card_issuing_settings card_issuing?;
    # 
    Account_card_payments_settings card_payments;
    # 
    Account_dashboard_settings dashboard;
    # 
    Account_payments_settings payments;
    # 
    Account_payout_settings payouts?;
    # 
    Account_sepa_debit_payments_settings sepa_debit_payments?;
};

# 
public type Payment_method_giropay record {
};

# 
public type Source_receiver_flow record {
    # The address of the receiver source. This is the value that should be communicated to the customer to send their funds to.
    string? address?;
    # The total amount that was moved to your balance. This is almost always equal to the amount charged. In rare cases when customers deposit excess funds and we are unable to refund those, those funds get moved to your balance and show up in amount_charged as well. The amount charged is expressed in the source's currency.
    int amount_charged;
    # The total amount received by the receiver source. `amount_received = amount_returned + amount_charged` should be true for consumed sources unless customers deposit excess funds. The amount received is expressed in the source's currency.
    int amount_received;
    # The total amount that was returned to the customer. The amount returned is expressed in the source's currency.
    int amount_returned;
    # Type of refund attribute method, one of `email`, `manual`, or `none`.
    @constraint:String {maxLength: 5000}
    string refund_attributes_method;
    # Type of refund attribute status, one of `missing`, `requested`, or `available`.
    @constraint:String {maxLength: 5000}
    string refund_attributes_status;
};

public type V1_payment_methods_body record {|
    # If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
    Payment_method_param acss_debit?;
    # If this is an `AfterpayClearpay` PaymentMethod, this hash contains details about the AfterpayClearpay payment method.
    record {} afterpay_clearpay?;
    # If this is an `Alipay` PaymentMethod, this hash contains details about the Alipay payment method.
    record {} alipay?;
    # If this is an `au_becs_debit` PaymentMethod, this hash contains details about the bank account.
    Param au_becs_debit?;
    # If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
    Param_1 bacs_debit?;
    # If this is a `bancontact` PaymentMethod, this hash contains details about the Bancontact payment method.
    record {} bancontact?;
    # Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    Billing_details_inner_params billing_details?;
    # If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
    Param_2 boleto?;
    # If this is a `card` PaymentMethod, this hash contains the user's card details. For backwards compatibility, you can alternatively provide a Stripe token (e.g., for Apple Pay, Amex Express Checkout, or legacy Checkout) into the card hash with format `card: {token: "tok_visa"}`. When providing a card number, you must meet the requirements for [PCI compliance](https://stripe.com/docs/security#validating-pci-compliance). We strongly recommend using Stripe.js instead of interacting with this API directly.
    Card_details_params|Token_paramas card?;
    # The `Customer` to whom the original PaymentMethod is attached.
    @constraint:String {maxLength: 5000}
    string customer?;
    # If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
    Param_3 eps?;
    # Specifies which fields in the response should be expanded.
    V1_payment_methods_bodyExpandItemsString[] expand?;
    # If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
    Param_4 fpx?;
    # If this is a `giropay` PaymentMethod, this hash contains details about the Giropay payment method.
    record {} giropay?;
    # If this is a `grabpay` PaymentMethod, this hash contains details about the GrabPay payment method.
    record {} grabpay?;
    # If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
    Param_5 ideal?;
    # If this is an `interac_present` PaymentMethod, this hash contains details about the Interac Present payment method.
    record {} interac_present?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|} metadata?;
    # If this is an `oxxo` PaymentMethod, this hash contains details about the OXXO payment method.
    record {} oxxo?;
    # If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
    Param_6 p24?;
    # The PaymentMethod to share.
    @constraint:String {maxLength: 5000}
    string payment_method?;
    # If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
    Param_7 sepa_debit?;
    # If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment method.
    Param_8 sofort?;
    # The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    "acss_debit"|"afterpay_clearpay"|"alipay"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"eps"|"fpx"|"giropay"|"grabpay"|"ideal"|"oxxo"|"p24"|"sepa_debit"|"sofort"|"wechat_pay" 'type?;
    # If this is an `wechat_pay` PaymentMethod, this hash contains details about the wechat_pay payment method.
    record {} wechat_pay?;
|};

# 
public type Deleted_person record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "person" 'object;
};

public type Card_invoice_payment_method_options_param record {
    "any"|"automatic" request_three_d_secure?;
};

# 
public type Mandate_multi_use record {
};

public type Customer_address_with_name record {
    Optional_fields_address address;
    @constraint:String {maxLength: 5000}
    string name;
    @constraint:String {maxLength: 5000}
    string phone?;
};

public type V1_products_body record {|
    # Whether the product is currently available for purchase. Defaults to `true`.
    boolean active?;
    # The product's description, meant to be displayable to the customer. Use this field to optionally store a long form explanation of the product being sold for your own rendering purposes.
    @constraint:String {maxLength: 40000}
    string description?;
    # Specifies which fields in the response should be expanded.
    V1_products_bodyExpandItemsString[] expand?;
    # An identifier will be randomly generated by Stripe. You can optionally override this ID, but the ID must be unique across all products in your Stripe account.
    @constraint:String {maxLength: 5000}
    string id?;
    # A list of up to 8 URLs of images for this product, meant to be displayable to the customer.
    string[] images?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|} metadata?;
    # The product's name, meant to be displayable to the customer. Whenever this product is sold via a subscription, name will show up on associated invoice line item descriptions.
    @constraint:String {maxLength: 5000}
    string name;
    # The dimensions of this product for shipping purposes.
    Package_dimensions_specs package_dimensions?;
    # Whether this product is shipped (i.e., physical goods).
    boolean shippable?;
    # An arbitrary string to be displayed on your customer's credit card or bank statement. While most banks display this information consistently, some may display it incorrectly or not at all.
    # 
    # This may be up to 22 characters. The statement description may not include `<`, `>`, `\`, `"`, `'` characters, and will appear on your customer's statement in capital letters. Non-ASCII characters are automatically stripped.
    #  It must contain at least one letter.
    @constraint:String {maxLength: 22}
    string statement_descriptor?;
    # A [tax code](https://stripe.com/docs/tax/tax-codes) ID.
    string tax_code?;
    # A label that represents units of this product in Stripe and on customers’ receipts and invoices. When set, this will be included in associated invoice line item descriptions.
    @constraint:String {maxLength: 12}
    string unit_label?;
    # A URL of a publicly-accessible webpage for this product.
    @constraint:String {maxLength: 5000}
    string url?;
|};

public type Add_invoice_item_entry_1 record {
    @constraint:String {maxLength: 5000}
    string price?;
    One_time_price_data price_data?;
    int quantity?;
    TaxratesItemsString[]|"" tax_rates?;
};

# If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
public type Transfer_data_specs_1 record {
    int amount?;
    string destination;
};

# If specified, the funds from the subscription's invoices will be transferred to the destination and the ID of the resulting transfers will be found on the resulting charges.
public type Transfer_data_specs_2 record {
    decimal amount_percent?;
    string destination;
};

public type Transfer_data_specs_3 record {
    decimal amount_percent?;
    string destination;
};

# 
public type Payment_method_details_afterpay_clearpay record {
    # Order identifier shown to the merchant in Afterpay’s online portal.
    string? reference?;
};

# 
public type Payment_method_options_ideal record {
};

# A Promotion Code represents a customer-redeemable code for a coupon. It can be used to
# create multiple codes for a single coupon.
public type Promotion_code record {
    # Whether the promotion code is currently active. A promotion code is only active if the coupon is also valid.
    boolean active;
    # The customer-facing code. Regardless of case, this code must be unique across all active promotion codes for each customer.
    @constraint:String {maxLength: 5000}
    string code;
    # A coupon contains information about a percent-off or amount-off discount you
    # might want to apply to a customer. Coupons may be applied to [invoices](https://stripe.com/docs/api#invoices) or
    # [orders](https://stripe.com/docs/api#create_order-coupon). Coupons do not work with conventional one-off [charges](https://stripe.com/docs/api#create_charge).
    Coupon coupon;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The customer that this promotion code can be used by.
    string|Customer|Deleted_customer? customer?;
    # Date at which the promotion code can no longer be redeemed.
    int? expires_at?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Maximum number of times this promotion code can be redeemed.
    int? max_redemptions?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "promotion_code" 'object;
    # 
    Promotion_codes_resource_restrictions restrictions;
    # Number of times this promotion code has been used.
    int times_redeemed;
};

# 
public type Source_transaction_ach_credit_transfer_data record {
    # Customer data associated with the transfer.
    @constraint:String {maxLength: 5000}
    string customer_data?;
    # Bank account fingerprint associated with the transfer.
    @constraint:String {maxLength: 5000}
    string fingerprint?;
    # Last 4 digits of the account number associated with the transfer.
    @constraint:String {maxLength: 5000}
    string last4?;
    # Routing number associated with the transfer.
    @constraint:String {maxLength: 5000}
    string routing_number?;
};

# 
public type Delivery_estimate record {
    # If `type` is `"exact"`, `date` will be the expected delivery date in the format YYYY-MM-DD.
    @constraint:String {maxLength: 5000}
    string date?;
    # If `type` is `"range"`, `earliest` will be be the earliest delivery date in the format YYYY-MM-DD.
    @constraint:String {maxLength: 5000}
    string earliest?;
    # If `type` is `"range"`, `latest` will be the latest delivery date in the format YYYY-MM-DD.
    @constraint:String {maxLength: 5000}
    string latest?;
    # The type of estimate. Must be either `"range"` or `"exact"`.
    @constraint:String {maxLength: 5000}
    string 'type;
};

public type Prices_price_body record {|
    # Whether the price can be used for new purchases. Defaults to `true`.
    boolean active?;
    # Specifies which fields in the response should be expanded.
    Prices_price_bodyExpandItemsString[] expand?;
    # A lookup key used to retrieve prices dynamically from a static string.
    @constraint:String {maxLength: 5000}
    string lookup_key?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    Additional_properties|"" metadata?;
    # A brief description of the price, hidden from customers.
    @constraint:String {maxLength: 5000}
    string nickname?;
    # Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
    "exclusive"|"inclusive"|"unspecified" tax_behavior?;
    # If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
    boolean transfer_lookup_key?;
|};

# Default invoice settings for this customer.
public type Customer_param record {
    record {@constraint:String {maxLength: 30}
        string name; @constraint:String {maxLength: 30}
        string value;}[]|"" custom_fields?;
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    @constraint:String {maxLength: 5000}
    string footer?;
};

public type Payment_method_detach_body record {|
    # Specifies which fields in the response should be expanded.
    Payment_method_detach_bodyExpandItemsString[] expand?;
|};

# Point in Time
public type Gelato_data_document_report_expiration_date record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

public type Tier record {
    int flat_amount?;
    string flat_amount_decimal?;
    int unit_amount?;
    string unit_amount_decimal?;
    "inf"|int up_to;
};

# 
public type Issuing_card_shipping record {
    # 
    Address address;
    # The delivery company that shipped a card.
    "dhl"|"fedex"|"royal_mail"|"usps" carrier?;
    # A unix timestamp representing a best estimate of when the card will be delivered.
    int? eta?;
    # Recipient name.
    @constraint:String {maxLength: 5000}
    string name;
    # Shipment service, such as `standard` or `express`.
    "express"|"priority"|"standard" 'service;
    # The delivery status of the card.
    "canceled"|"delivered"|"failure"|"pending"|"returned"|"shipped" status?;
    # A tracking number for a card shipment.
    string? tracking_number?;
    # A link to the shipping carrier's site where you can view detailed information about a card shipment.
    string? tracking_url?;
    # Packaging options.
    "bulk"|"individual" 'type;
};

# 
public type Deleted_product record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "product" 'object;
};

# 
public type Issuing_dispute_service_not_as_described_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Date when order was canceled.
    int? canceled_at?;
    # Reason for canceling the order.
    string? cancellation_reason?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Date when the product was received.
    int? received_at?;
};

# 
public type Setup_intent_payment_method_options_card record {
    # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Permitted values include: `automatic` or `any`. If not provided, defaults to `automatic`. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    "any"|"automatic"|"challenge_only" request_three_d_secure?;
};

# `Refund` objects allow you to refund a charge that has previously been created
# but not yet refunded. Funds will be refunded to the credit or debit card that
# was originally charged.
# 
# Related guide: [Refunds](https://stripe.com/docs/refunds).
public type Refund record {
    # Amount, in %s.
    int amount;
    # Balance transaction that describes the impact on your account balance.
    string|Balance_transaction? balance_transaction?;
    # ID of the charge that was refunded.
    string|Charge? charge?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users. (Available on non-card refunds only)
    @constraint:String {maxLength: 5000}
    string description?;
    # If the refund failed, this balance transaction describes the adjustment made on your account balance that reverses the initial balance transaction.
    string|Balance_transaction failure_balance_transaction?;
    # If the refund failed, the reason for refund failure if known. Possible values are `lost_or_stolen_card`, `expired_or_canceled_card`, or `unknown`.
    @constraint:String {maxLength: 5000}
    string failure_reason?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "refund" 'object;
    # ID of the PaymentIntent that was refunded.
    string|Payment_intent? payment_intent?;
    # Reason for the refund, either user-provided (`duplicate`, `fraudulent`, or `requested_by_customer`) or generated by Stripe internally (`expired_uncaptured_charge`).
    string? reason?;
    # This is the transaction number that appears on email receipts sent for this refund.
    string? receipt_number?;
    # The transfer reversal that is associated with the refund. Only present if the charge came from another Stripe account. See the Connect documentation for details.
    string|Transfer_reversal? source_transfer_reversal?;
    # Status of the refund. For credit card refunds, this can be `pending`, `succeeded`, or `failed`. For other types of refunds, it can be `pending`, `succeeded`, `failed`, or `canceled`. Refer to our [refunds](https://stripe.com/docs/refunds#failed-refunds) documentation for more details.
    string? status?;
    # If the accompanying transfer was reversed, the transfer reversal object. Only applicable if the charge was created using the destination parameter.
    string|Transfer_reversal? transfer_reversal?;
};

public type Source_type_au_becs_debit record {
    string? bsb_number?;
    string? fingerprint?;
    string? last4?;
};

# The customer's tax IDs.
public type TaxIDsList record {
    # Details about each object.
    Tax_id[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Gelato_document_report_error record {
    # A short machine-readable string giving the reason for the verification failure.
    "document_expired"|"document_type_not_supported"|"document_unverified_other" code?;
    # A human-readable message giving the reason for the failure. These messages can be shown to your users.
    string? reason?;
};

# 
public type Country_spec_verification_field_details record {
    # Additional fields which are only required for some users.
    Country_spec_verification_field_detailsAdditionalItemsString[] additional;
    # Fields which every account must eventually provide.
    Country_spec_verification_field_detailsMinimumItemsString[] minimum;
};

# 
public type Payment_intent_next_action_verify_with_microdeposits record {
    # The timestamp when the microdeposits are expected to land.
    int arrival_date;
    # The URL for the hosted verification page, which allows customers to verify their bank account.
    @constraint:String {maxLength: 5000}
    string hosted_verification_url;
};

# A return represents the full or partial return of a number of [order items](https://stripe.com/docs/api#order_items).
# Returns always belong to an order, and may optionally contain a refund.
# 
# Related guide: [Handling Returns](https://stripe.com/docs/orders/guide#handling-returns).
public type Order_return record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the returned line item.
    int amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The items included in this order return.
    Order_item[] items;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "order_return" 'object;
    # The order that this return includes items from.
    string|Order? 'order?;
    # The ID of the refund issued for this return.
    string|Refund? refund?;
};

# 
public type Payment_method_card_generated_card record {
    # The charge that created this object.
    string? charge?;
    # Transaction-specific details of the payment method used in the payment.
    Card_generated_from_payment_method_details? payment_method_details?;
    # The ID of the SetupAttempt that generated this PaymentMethod, if any.
    string|Setup_attempt? setup_attempt?;
};

# Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
# 
# Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
public type Tax_rate record {
    # Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
    boolean active;
    # Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    string? country?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
    string? description?;
    # The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
    @constraint:String {maxLength: 5000}
    string display_name;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # This specifies if the tax rate is inclusive or exclusive.
    boolean inclusive;
    # The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
    string? jurisdiction?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "tax_rate" 'object;
    # This represents the tax rate percent out of 100.
    decimal percentage;
    # [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, "NY" for New York, United States.
    string? state?;
    # The high-level tax type, such as `vat` or `sales_tax`.
    "gst"|"hst"|"pst"|"qst"|"sales_tax"|"vat" tax_type?;
};

# To top up your Stripe balance, you create a top-up object. You can retrieve
# individual top-ups, as well as list all top-ups. Top-ups are identified by a
# unique, random ID.
# 
# Related guide: [Topping Up your Platform Account](https://stripe.com/docs/connect/top-ups).
public type Topup record {
    # Amount transferred.
    int amount;
    # ID of the balance transaction that describes the impact of this top-up on your account balance. May not be specified depending on status of top-up.
    string|Balance_transaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    @constraint:String {maxLength: 5000}
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Date the funds are expected to arrive in your Stripe account for payouts. This factors in delays like weekends or bank holidays. May not be specified depending on status of top-up.
    int? expected_availability_date?;
    # Error code explaining reason for top-up failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
    string? failure_code?;
    # Message to user further explaining reason for top-up failure if available.
    string? failure_message?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "topup" 'object;
    # `Source` objects allow you to accept a variety of payment methods. They
    # represent a customer's payment instrument, and can be used with the Stripe API
    # just like a `Card` object: once chargeable, they can be charged, or can be
    # attached to customers.
    # 
    # Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
    Source 'source;
    # Extra information about a top-up. This will appear on your source's bank statement. It must contain at least one letter.
    string? statement_descriptor?;
    # The status of the top-up is either `canceled`, `failed`, `pending`, `reversed`, or `succeeded`.
    "canceled"|"failed"|"pending"|"reversed"|"succeeded" status;
    # A string that identifies this top-up as part of a group.
    string? transfer_group?;
};

# 
public type Payment_method_options_boleto record {
    # The number of calendar days before a Boleto voucher expires. For example, if you create a Boleto voucher on Monday and you set expires_after_days to 2, the Boleto voucher will expire on Wednesday at 23:59 America/Sao_Paulo time.
    int expires_after_days;
};

# Cardholder authentication via 3D Secure is initiated by creating a `3D Secure`
# object. Once the object has been created, you can use it to authenticate the
# cardholder and create a charge.
public type Three_d_secure record {
    # Amount of the charge that you will create when authentication completes.
    int amount;
    # True if the cardholder went through the authentication flow and their bank indicated that authentication succeeded.
    boolean authenticated;
    # You can store multiple cards on a customer in order to charge the customer
    # later. You can also store multiple debit cards on a recipient in order to
    # transfer to those cards later.
    # 
    # Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
    Card card;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    @constraint:String {maxLength: 5000}
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "three_d_secure" 'object;
    # If present, this is the URL that you should send the cardholder to for authentication. If you are going to use Stripe.js to display the authentication page in an iframe, you should use the value "_callback".
    string? redirect_url?;
    # Possible values are `redirect_pending`, `succeeded`, or `failed`. When the cardholder can be authenticated, the object starts with status `redirect_pending`. When liability will be shifted to the cardholder's bank (either because the cardholder was successfully authenticated, or because the bank has not implemented 3D Secure, the object wlil be in status `succeeded`. `failed` indicates that authentication was attempted unsuccessfully.
    @constraint:String {maxLength: 5000}
    string status;
};

# 
public type Alipay_account record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the customer associated with this Alipay Account.
    string|Customer|Deleted_customer? customer?;
    # Uniquely identifies the account and will be the same across all Alipay account objects that are linked to the same Alipay account.
    @constraint:String {maxLength: 5000}
    string fingerprint;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "alipay_account" 'object;
    # If the Alipay account object is not reusable, the exact amount that you can create a charge for.
    int? payment_amount?;
    # If the Alipay account object is not reusable, the exact currency that you can create a charge for.
    string? payment_currency?;
    # True if you can create multiple payments using this account. If the account is reusable, then you can freely choose the amount of each payment.
    boolean reusable;
    # Whether this Alipay account object has ever been used for a payment.
    boolean used;
    # The username for the Alipay account.
    @constraint:String {maxLength: 5000}
    string username;
};

# These bank accounts are payment methods on `Customer` objects.
# 
# On the other hand [External Accounts](https://stripe.com/docs/api#external_accounts) are transfer
# destinations on `Account` objects for [Custom accounts](https://stripe.com/docs/connect/custom-accounts).
# They can be bank accounts or debit cards as well, and are documented in the links above.
# 
# Related guide: [Bank Debits and Transfers](https://stripe.com/docs/payments/bank-debits-transfers).
public type Bank_account record {
    # The ID of the account that the bank account is associated with.
    string|Account? account?;
    # The name of the person or business that owns the bank account.
    string? account_holder_name?;
    # The type of entity that holds the account. This can be either `individual` or `company`.
    string? account_holder_type?;
    # The bank account type. This can only be `checking` or `savings` in most countries. In Japan, this can only be `futsu` or `toza`.
    string? account_type?;
    # A set of available payout methods for this bank account. Only values from this set should be passed as the `method` when creating a payout.
    ("instant"|"standard")[]? available_payout_methods?;
    # Name of the bank associated with the routing number (e.g., `WELLS FARGO`).
    string? bank_name?;
    # Two-letter ISO code representing the country the bank account is located in.
    @constraint:String {maxLength: 5000}
    string country;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
    string currency;
    # The ID of the customer that the bank account is associated with.
    string|Customer|Deleted_customer? customer?;
    # Whether this bank account is the default external account for its currency.
    boolean? default_for_currency?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The last four digits of the bank account number.
    @constraint:String {maxLength: 5000}
    string last4;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "bank_account" 'object;
    # The routing transit number for the bank account.
    string? routing_number?;
    # For bank accounts, possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`. A bank account that hasn't had any activity or validation performed is `new`. If Stripe can determine that the bank account exists, its status will be `validated`. Note that there often isn’t enough information to know (e.g., for smaller credit unions), and the validation is not always run. If customer bank account verification has succeeded, the bank account status will be `verified`. If the verification failed for any reason, such as microdeposit failure, the status will be `verification_failed`. If a transfer sent to this bank account fails, we'll set the status to `errored` and will not continue to send transfers until the bank details are updated.
    # 
    # For external accounts, possible values are `new` and `errored`. Validations aren't run against external accounts because they're only used for payouts. This means the other statuses don't apply. If a transfer fails, the status is set to `errored` and transfers are stopped until account details are updated.
    @constraint:String {maxLength: 5000}
    string status;
};

# 
public type Payment_intent_payment_method_options_mandate_options_acss_debit record {
    # A URL for custom mandate text
    @constraint:String {maxLength: 5000}
    string custom_mandate_url?;
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    "combined"|"interval"|"sporadic" payment_schedule?;
    # Transaction type of the mandate.
    "business"|"personal" transaction_type?;
};

# The line items purchased by the customer.
public type PaymentPagesCheckoutSessionListLineItems record {
    # Details about each object.
    Item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Issuing_cardholder_individual_dob record {
    # The day of birth, between 1 and 31.
    int? day?;
    # The month of birth, between 1 and 12.
    int? month?;
    # The four-digit year of birth.
    int? year?;
};

# 
public type Deleted_radarValue_list_item record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "radar.value_list_item" 'object;
};

# 
public type Setup_attempt_payment_method_details_ideal record {
    # The customer's bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    "abn_amro"|"asn_bank"|"bunq"|"handelsbanken"|"ing"|"knab"|"moneyou"|"rabobank"|"regiobank"|"revolut"|"sns_bank"|"triodos_bank"|"van_lanschot" bank?;
    # The Bank Identifier Code of the customer's bank.
    "ABNANL2A"|"ASNBNL21"|"BUNQNL2A"|"FVLBNL22"|"HANDNL2A"|"INGBNL2A"|"KNABNL2H"|"MOYONL21"|"RABONL2U"|"RBRBNL21"|"REVOLT21"|"SNSBNL2A"|"TRIONL2U" bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Payment_method? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Owner's verified full name. Values are verified or provided by iDEAL directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# 
public type Setup_intent_payment_method_options_mandate_options_acss_debit record {
    # A URL for custom mandate text
    @constraint:String {maxLength: 5000}
    string custom_mandate_url?;
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    "combined"|"interval"|"sporadic" payment_schedule?;
    # Transaction type of the mandate.
    "business"|"personal" transaction_type?;
};

# 
public type Subscription_transfer_data record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount is transferred to the destination.
    decimal? amount_percent?;
    # The account where funds from the payment will be transferred to upon payment success.
    string|Account destination;
};

public type Created Range_query_specs|int;

public type Customer_details_param record {
    Customer_adresss|"" address?;
    Customer_address_with_name|"" shipping?;
    Tax_param_1 tax?;
    ""|"exempt"|"none"|"reverse" tax_exempt?;
    Data_params[] tax_ids?;
};

# 
public type Gelato_session_id_number_options record {
};

# 
public type Recurring record {
    # Specifies a usage aggregation strategy for prices of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
    "last_during_period"|"last_ever"|"max"|"sum" aggregate_usage?;
    # The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
    "day"|"month"|"week"|"year" interval;
    # The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
    int interval_count;
    # Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
    "licensed"|"metered" usage_type;
};

# 
public type Payment_method_options_afterpay_clearpay record {
    # Order identifier shown to the merchant in Afterpay’s online portal. We recommend using a value that helps you answer any questions a customer might have about
    # the payment. The identifier is limited to 128 characters and may contain only letters, digits, underscores, backslashes and dashes.
    string? reference?;
};

# 
public type Account_payments_settings record {
    # The default text that appears on credit card statements when a charge is made. This field prefixes any dynamic `statement_descriptor` specified on the charge.
    string? statement_descriptor?;
    # The Kana variation of the default text that appears on credit card statements when a charge is made (Japan only)
    string? statement_descriptor_kana?;
    # The Kanji variation of the default text that appears on credit card statements when a charge is made (Japan only)
    string? statement_descriptor_kanji?;
};

# 
public type Payment_method_details_card_checks record {
    # If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_line1_check?;
    # If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_postal_code_check?;
    # If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? cvc_check?;
};

# 
public type Radar_review_resource_location record {
    # The city where the payment originated.
    string? city?;
    # Two-letter ISO code representing the country where the payment originated.
    string? country?;
    # The geographic latitude where the payment originated.
    decimal? latitude?;
    # The geographic longitude where the payment originated.
    decimal? longitude?;
    # The state/county/province/region where the payment originated.
    string? region?;
};

# 
public type Source_code_verification_flow record {
    # The number of attempts remaining to authenticate the source object with a verification code.
    int attempts_remaining;
    # The status of the code verification, either `pending` (awaiting verification, `attempts_remaining` should be greater than 0), `succeeded` (successful verification) or `failed` (failed verification, cannot be verified anymore as `attempts_remaining` should be 0).
    @constraint:String {maxLength: 5000}
    string status;
};

public type Invoice_mark_uncollectible_body record {|
    # Specifies which fields in the response should be expanded.
    Invoice_mark_uncollectible_bodyExpandItemsString[] expand?;
|};

# The customer's payment sources, if any.
public type ApmsSourcesSourceList record {
    # Details about each object.
    (Alipay_account|Bank_account|Bitcoin_receiver|Card|Source)[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

public type Invoice_item_preview_params record {
    int amount?;
    string currency?;
    @constraint:String {maxLength: 5000}
    string description?;
    boolean discountable?;
    Discounts_data_param|"" discounts?;
    @constraint:String {maxLength: 5000}
    string invoiceitem?;
    record {|string...;|}|"" metadata?;
    Period_1 period?;
    @constraint:String {maxLength: 5000}
    string price?;
    One_time_price_data price_data?;
    int quantity?;
    TaxratesItemsString[]|"" tax_rates?;
    int unit_amount?;
    string unit_amount_decimal?;
};

# 
public type Account_capability_requirements record {
    # Date by which the fields in `currently_due` must be collected to keep the capability enabled for the account. These fields may disable the capability sooner if the next threshold is reached before they are collected.
    int? current_deadline?;
    # Fields that need to be collected to keep the capability enabled. If not collected by `current_deadline`, these fields appear in `past_due` as well, and the capability is disabled.
    Account_capability_requirementsCurrentlydueItemsString[] currently_due;
    # If the capability is disabled, this string describes why. Can be `requirements.past_due`, `requirements.pending_verification`, `listed`, `platform_paused`, `rejected.fraud`, `rejected.listed`, `rejected.terms_of_service`, `rejected.other`, `under_review`, or `other`.
    # 
    # `rejected.unsupported_business` means that the account's business is not supported by the capability. For example, payment methods may restrict the businesses they support in their terms of service:
    # 
    # - [Afterpay Clearpay's terms of service](/afterpay-clearpay/legal#restricted-businesses)
    # 
    # If you believe that the rejection is in error, please contact support@stripe.com for assistance.
    string? disabled_reason?;
    # Fields that are `currently_due` and need to be collected again because validation or verification failed.
    Account_requirements_error[] errors;
    # Fields that need to be collected assuming all volume thresholds are reached. As they become required, they appear in `currently_due` as well, and `current_deadline` becomes set.
    Account_capability_requirementsEventuallydueItemsString[] eventually_due;
    # Fields that weren't collected by `current_deadline`. These fields need to be collected to enable the capability on the account.
    Account_capability_requirementsPastdueItemsString[] past_due;
    # Fields that may become required depending on the results of verification or review. Will be an empty array unless an asynchronous verification is pending. If verification fails, these fields move to `eventually_due`, `currently_due`, or `past_due`.
    Account_capability_requirementsPendingverificationItemsString[] pending_verification;
};

# 
public type Checkout_acss_debit_mandate_options record {
    # A URL for custom mandate text
    @constraint:String {maxLength: 5000}
    string custom_mandate_url?;
    # Description of the interval. Only required if the 'payment_schedule' parameter is 'interval' or 'combined'.
    string? interval_description?;
    # Payment schedule for the mandate.
    "combined"|"interval"|"sporadic" payment_schedule?;
    # Transaction type of the mandate.
    "business"|"personal" transaction_type?;
};

# A Checkout Session represents your customer's session as they pay for
# one-time purchases or subscriptions through [Checkout](https://stripe.com/docs/payments/checkout).
# We recommend creating a new Session each time your customer attempts to pay.
# 
# Once payment is successful, the Checkout Session will contain a reference
# to the [Customer](https://stripe.com/docs/api/customers), and either the successful
# [PaymentIntent](https://stripe.com/docs/api/payment_intents) or an active
# [Subscription](https://stripe.com/docs/api/subscriptions).
# 
# You can create a Checkout Session on your server and pass its ID to the
# client to begin Checkout.
# 
# Related guide: [Checkout Server Quickstart](https://stripe.com/docs/payments/checkout/api).
public type CheckoutSession record {
    # Enables user redeemable promotion codes.
    boolean? allow_promotion_codes?;
    # Total of all items before discounts or taxes are applied.
    int? amount_subtotal?;
    # Total of all items after discounts and taxes are applied.
    int? amount_total?;
    # 
    Payment_pages_checkout_session_automatic_tax automatic_tax;
    # Describes whether Checkout should collect the customer's billing address.
    "auto"|"required" billing_address_collection?;
    # The URL the customer will be directed to if they decide to cancel payment and return to your website.
    @constraint:String {maxLength: 5000}
    string cancel_url;
    # A unique string to reference the Checkout Session. This can be a
    # customer ID, a cart ID, or similar, and can be used to reconcile the
    # Session with your internal systems.
    string? client_reference_id?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string? currency?;
    # The ID of the customer for this Session.
    # For Checkout Sessions in `payment` or `subscription` mode, Checkout
    # will create a new customer object based on information provided
    # during the payment flow unless an existing customer was provided when
    # the Session was created.
    string|Customer|Deleted_customer? customer?;
    # The customer details including the customer's tax exempt status and the customer's tax IDs. Only present on Sessions in `payment` or `subscription` mode.
    Payment_pages_checkout_session_customer_details? customer_details?;
    # If provided, this value will be used when the Customer object is created.
    # If not provided, customers will be asked to enter their email address.
    # Use this parameter to prefill customer data if you already have an email
    # on file. To access information about the customer once the payment flow is
    # complete, use the `customer` attribute.
    string? customer_email?;
    # Unique identifier for the object. Used to pass to `redirectToCheckout`
    # in Stripe.js.
    @constraint:String {maxLength: 5000}
    string id;
    # The line items purchased by the customer.
    PaymentPagesCheckoutSessionListLineItems line_items?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The IETF language tag of the locale Checkout is displayed in. If blank or `auto`, the browser's locale is used.
    "auto"|"bg"|"cs"|"da"|"de"|"el"|"en"|"en-GB"|"es"|"es-419"|"et"|"fi"|"fil"|"fr"|"fr-CA"|"hr"|"hu"|"id"|"it"|"ja"|"ko"|"lt"|"lv"|"ms"|"mt"|"nb"|"nl"|"pl"|"pt"|"pt-BR"|"ro"|"ru"|"sk"|"sl"|"sv"|"th"|"tr"|"vi"|"zh"|"zh-HK"|"zh-TW" locale?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # The mode of the Checkout Session.
    "payment"|"setup"|"subscription" mode;
    # String representing the object's type. Objects of the same type share the same value.
    "checkout.session" 'object;
    # The ID of the PaymentIntent for Checkout Sessions in `payment` mode.
    string|Payment_intent? payment_intent?;
    # Payment-method-specific configuration for the PaymentIntent or SetupIntent of this CheckoutSession.
    Checkout_session_payment_method_options? payment_method_options?;
    # A list of the types of payment methods (e.g. card) this Checkout
    # Session is allowed to accept.
    CheckoutsessionPaymentmethodtypesItemsString[] payment_method_types;
    # The payment status of the Checkout Session, one of `paid`, `unpaid`, or `no_payment_required`.
    # You can use this value to decide when to fulfill your customer's order.
    "no_payment_required"|"paid"|"unpaid" payment_status;
    # The ID of the SetupIntent for Checkout Sessions in `setup` mode.
    string|Setup_intent? setup_intent?;
    # Shipping information for this Checkout Session.
    Shipping? shipping?;
    # When set, provides configuration for Checkout to collect a shipping address from a customer.
    Payment_pages_payment_page_resources_shipping_address_collection? shipping_address_collection?;
    # Describes the type of transaction being performed by Checkout in order to customize
    # relevant text on the page, such as the submit button. `submit_type` can only be
    # specified on Checkout Sessions in `payment` mode, but not Checkout Sessions
    # in `subscription` or `setup` mode.
    "auto"|"book"|"donate"|"pay" submit_type?;
    # The ID of the subscription for Checkout Sessions in `subscription` mode.
    string|Subscription? subscription?;
    # The URL the customer will be directed to after the payment or
    # subscription creation is successful.
    @constraint:String {maxLength: 5000}
    string success_url;
    # 
    Payment_pages_checkout_session_tax_id_collection tax_id_collection?;
    # Tax and discount details for the computed total amount.
    Payment_pages_checkout_session_total_details? total_details?;
    # The URL to the Checkout Session.
    string? url?;
};

# 
public type Shipping_method record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The estimated delivery date for the given shipping method. Can be either a specific date or a range.
    Delivery_estimate? delivery_estimate?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    @constraint:String {maxLength: 5000}
    string description;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
};

# A representation of the constituent items of any given order. Can be used to
# represent [SKUs](https://stripe.com/docs/api#skus), shipping costs, or taxes owed on the order.
# 
# Related guide: [Orders](https://stripe.com/docs/orders/guide).
public type Order_item record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the line item.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Description of the line item, meant to be displayable to the user (e.g., `"Express shipping"`).
    @constraint:String {maxLength: 5000}
    string description;
    # String representing the object's type. Objects of the same type share the same value.
    "order_item" 'object;
    # The ID of the associated object for this line item. Expandable if not null (e.g., expandable to a SKU).
    string|Sku? parent?;
    # A positive integer representing the number of instances of `parent` that are included in this order item. Applicable/present only if `type` is `sku`.
    int? quantity?;
    # The type of line item. One of `sku`, `tax`, `shipping`, or `discount`.
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Gelato_id_number_report_error record {
    # A short machine-readable string giving the reason for the verification failure.
    "id_number_insufficient_document_data"|"id_number_mismatch"|"id_number_unverified_other" code?;
    # A human-readable message giving the reason for the failure. These messages can be shown to your users.
    string? reason?;
};

# 
public type InvoicesList record {
    Invoice[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000, pattern: re `^/v1/invoices`}
    string url;
};

public type Recurring_adhoc record {
    "day"|"month"|"week"|"year" interval;
    int interval_count?;
};

# 
public type Legal_entity_dob record {
    # The day of birth, between 1 and 31.
    int? day?;
    # The month of birth, between 1 and 12.
    int? month?;
    # The four-digit year of birth.
    int? year?;
};

# 
public type Mandate_payment_method_details record {
    # 
    Mandate_acss_debit acss_debit?;
    # 
    Mandate_au_becs_debit au_becs_debit?;
    # 
    Mandate_bacs_debit bacs_debit?;
    # 
    Card_mandate_payment_method_details card?;
    # 
    Mandate_sepa_debit sepa_debit?;
    # The type of the payment method associated with this mandate. An additional hash is included on `payment_method_details` with a name matching this value. It contains mandate information specific to the payment method.
    @constraint:String {maxLength: 5000}
    string 'type;
};

public type Source_type_bancontact record {
    string? bank_code?;
    string? bank_name?;
    string? bic?;
    string? iban_last4?;
    string? preferred_language?;
    string? statement_descriptor?;
};

# A dispute occurs when a customer questions your charge with their card issuer.
# When this happens, you're given the opportunity to respond to the dispute with
# evidence that shows that the charge is legitimate. You can find more
# information about the dispute process in our [Disputes and
# Fraud](/docs/disputes) documentation.
# 
# Related guide: [Disputes and Fraud](https://stripe.com/docs/disputes).
public type Dispute record {
    # Disputed amount. Usually the amount of the charge, but can differ (usually because of currency fluctuation or because only part of the order is disputed).
    int amount;
    # List of zero, one, or two balance transactions that show funds withdrawn and reinstated to your Stripe account as a result of this dispute.
    Balance_transaction[] balance_transactions;
    # ID of the charge that was disputed.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # 
    Dispute_evidence evidence;
    # 
    Dispute_evidence_details evidence_details;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # If true, it is still possible to refund the disputed payment. Once the payment has been fully refunded, no further funds will be withdrawn from your Stripe account as a result of this dispute.
    boolean is_charge_refundable;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "dispute" 'object;
    # ID of the PaymentIntent that was disputed.
    string|Payment_intent? payment_intent?;
    # Reason given by cardholder for dispute. Possible values are `bank_cannot_process`, `check_returned`, `credit_not_processed`, `customer_initiated`, `debit_not_authorized`, `duplicate`, `fraudulent`, `general`, `incorrect_account_details`, `insufficient_funds`, `product_not_received`, `product_unacceptable`, `subscription_canceled`, or `unrecognized`. Read more about [dispute reasons](https://stripe.com/docs/disputes/categories).
    @constraint:String {maxLength: 5000}
    string reason;
    # Current status of dispute. Possible values are `warning_needs_response`, `warning_under_review`, `warning_closed`, `needs_response`, `under_review`, `charge_refunded`, `won`, or `lost`.
    "charge_refunded"|"lost"|"needs_response"|"under_review"|"warning_closed"|"warning_needs_response"|"warning_under_review"|"won" status;
};

# Events are our way of letting you know when something interesting happens in
# your account. When an interesting event occurs, we create a new `Event`
# object. For example, when a charge succeeds, we create a `charge.succeeded`
# event; and when an invoice payment attempt fails, we create an
# `invoice.payment_failed` event. Note that many API requests may cause multiple
# events to be created. For example, if you create a new subscription for a
# customer, you will receive both a `customer.subscription.created` event and a
# `charge.succeeded` event.
# 
# Events occur when the state of another API resource changes. The state of that
# resource at the time of the change is embedded in the event's data field. For
# example, a `charge.succeeded` event will contain a charge, and an
# `invoice.payment_failed` event will contain an invoice.
# 
# As with other API resources, you can use endpoints to retrieve an
# [individual event](https://stripe.com/docs/api#retrieve_event) or a [list of events](https://stripe.com/docs/api#list_events)
# from the API. We also have a separate
# [webhooks](http://en.wikipedia.org/wiki/Webhook) system for sending the
# `Event` objects directly to an endpoint on your server. Webhooks are managed
# in your
# [account settings](https://dashboard.stripe.com/account/webhooks),
# and our [Using Webhooks](https://stripe.com/docs/webhooks) guide will help you get set up.
# 
# When using [Connect](https://stripe.com/docs/connect), you can also receive notifications of
# events that occur in connected accounts. For these events, there will be an
# additional `account` attribute in the received `Event` object.
# 
# **NOTE:** Right now, access to events through the [Retrieve Event API](https://stripe.com/docs/api#retrieve_event) is
# guaranteed only for 30 days.
public type Event record {
    # The connected account that originated the event.
    @constraint:String {maxLength: 5000}
    string account?;
    # The Stripe API version used to render `data`. *Note: This property is populated only for events on or after October 31, 2014*.
    string? api_version?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # 
    Notification_event_data data;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "event" 'object;
    # Number of webhooks that have yet to be successfully delivered (i.e., to return a 20x response) to the URLs you've specified.
    int pending_webhooks;
    # Information on the API request that instigated the event.
    Notification_event_request? request?;
    # Description of the event (e.g., `invoice.created` or `charge.refunded`).
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Payment_method_details_card_present_receipt record {
    # The type of account being debited or credited
    "checking"|"credit"|"prepaid"|"unknown" account_type?;
    # EMV tag 9F26, cryptogram generated by the integrated circuit chip.
    string? application_cryptogram?;
    # Mnenomic of the Application Identifier.
    string? application_preferred_name?;
    # Identifier for this transaction.
    string? authorization_code?;
    # EMV tag 8A. A code returned by the card issuer.
    string? authorization_response_code?;
    # How the cardholder verified ownership of the card.
    string? cardholder_verification_method?;
    # EMV tag 84. Similar to the application identifier stored on the integrated circuit chip.
    string? dedicated_file_name?;
    # The outcome of a series of EMV functions performed by the card reader.
    string? terminal_verification_results?;
    # An indication of various EMV functions performed during the transaction.
    string? transaction_status_information?;
};

# 
public type Issuing_cardholder_verification record {
    # An identifying document, either a passport or local ID card.
    Issuing_cardholder_id_document? document?;
};

# 
public type Issuing_card_spending_limit record {
    # Maximum amount allowed to spend per interval.
    int amount;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
    ("ac_refrigeration_repair"|"accounting_bookkeeping_services"|"advertising_services"|"agricultural_cooperative"|"airlines_air_carriers"|"airports_flying_fields"|"ambulance_services"|"amusement_parks_carnivals"|"antique_reproductions"|"antique_shops"|"aquariums"|"architectural_surveying_services"|"art_dealers_and_galleries"|"artists_supply_and_craft_shops"|"auto_and_home_supply_stores"|"auto_body_repair_shops"|"auto_paint_shops"|"auto_service_shops"|"automated_cash_disburse"|"automated_fuel_dispensers"|"automobile_associations"|"automotive_parts_and_accessories_stores"|"automotive_tire_stores"|"bail_and_bond_payments"|"bakeries"|"bands_orchestras"|"barber_and_beauty_shops"|"betting_casino_gambling"|"bicycle_shops"|"billiard_pool_establishments"|"boat_dealers"|"boat_rentals_and_leases"|"book_stores"|"books_periodicals_and_newspapers"|"bowling_alleys"|"bus_lines"|"business_secretarial_schools"|"buying_shopping_services"|"cable_satellite_and_other_pay_television_and_radio"|"camera_and_photographic_supply_stores"|"candy_nut_and_confectionery_stores"|"car_and_truck_dealers_new_used"|"car_and_truck_dealers_used_only"|"car_rental_agencies"|"car_washes"|"carpentry_services"|"carpet_upholstery_cleaning"|"caterers"|"charitable_and_social_service_organizations_fundraising"|"chemicals_and_allied_products"|"child_care_services"|"childrens_and_infants_wear_stores"|"chiropodists_podiatrists"|"chiropractors"|"cigar_stores_and_stands"|"civic_social_fraternal_associations"|"cleaning_and_maintenance"|"clothing_rental"|"colleges_universities"|"commercial_equipment"|"commercial_footwear"|"commercial_photography_art_and_graphics"|"commuter_transport_and_ferries"|"computer_network_services"|"computer_programming"|"computer_repair"|"computer_software_stores"|"computers_peripherals_and_software"|"concrete_work_services"|"construction_materials"|"consulting_public_relations"|"correspondence_schools"|"cosmetic_stores"|"counseling_services"|"country_clubs"|"courier_services"|"court_costs"|"credit_reporting_agencies"|"cruise_lines"|"dairy_products_stores"|"dance_hall_studios_schools"|"dating_escort_services"|"dentists_orthodontists"|"department_stores"|"detective_agencies"|"digital_goods_applications"|"digital_goods_games"|"digital_goods_large_volume"|"digital_goods_media"|"direct_marketing_catalog_merchant"|"direct_marketing_combination_catalog_and_retail_merchant"|"direct_marketing_inbound_telemarketing"|"direct_marketing_insurance_services"|"direct_marketing_other"|"direct_marketing_outbound_telemarketing"|"direct_marketing_subscription"|"direct_marketing_travel"|"discount_stores"|"doctors"|"door_to_door_sales"|"drapery_window_covering_and_upholstery_stores"|"drinking_places"|"drug_stores_and_pharmacies"|"drugs_drug_proprietaries_and_druggist_sundries"|"dry_cleaners"|"durable_goods"|"duty_free_stores"|"eating_places_restaurants"|"educational_services"|"electric_razor_stores"|"electrical_parts_and_equipment"|"electrical_services"|"electronics_repair_shops"|"electronics_stores"|"elementary_secondary_schools"|"employment_temp_agencies"|"equipment_rental"|"exterminating_services"|"family_clothing_stores"|"fast_food_restaurants"|"financial_institutions"|"fines_government_administrative_entities"|"fireplace_fireplace_screens_and_accessories_stores"|"floor_covering_stores"|"florists"|"florists_supplies_nursery_stock_and_flowers"|"freezer_and_locker_meat_provisioners"|"fuel_dealers_non_automotive"|"funeral_services_crematories"|"furniture_home_furnishings_and_equipment_stores_except_appliances"|"furniture_repair_refinishing"|"furriers_and_fur_shops"|"general_services"|"gift_card_novelty_and_souvenir_shops"|"glass_paint_and_wallpaper_stores"|"glassware_crystal_stores"|"golf_courses_public"|"government_services"|"grocery_stores_supermarkets"|"hardware_equipment_and_supplies"|"hardware_stores"|"health_and_beauty_spas"|"hearing_aids_sales_and_supplies"|"heating_plumbing_a_c"|"hobby_toy_and_game_shops"|"home_supply_warehouse_stores"|"hospitals"|"hotels_motels_and_resorts"|"household_appliance_stores"|"industrial_supplies"|"information_retrieval_services"|"insurance_default"|"insurance_underwriting_premiums"|"intra_company_purchases"|"jewelry_stores_watches_clocks_and_silverware_stores"|"landscaping_services"|"laundries"|"laundry_cleaning_services"|"legal_services_attorneys"|"luggage_and_leather_goods_stores"|"lumber_building_materials_stores"|"manual_cash_disburse"|"marinas_service_and_supplies"|"masonry_stonework_and_plaster"|"massage_parlors"|"medical_and_dental_labs"|"medical_dental_ophthalmic_and_hospital_equipment_and_supplies"|"medical_services"|"membership_organizations"|"mens_and_boys_clothing_and_accessories_stores"|"mens_womens_clothing_stores"|"metal_service_centers"|"miscellaneous"|"miscellaneous_apparel_and_accessory_shops"|"miscellaneous_auto_dealers"|"miscellaneous_business_services"|"miscellaneous_food_stores"|"miscellaneous_general_merchandise"|"miscellaneous_general_services"|"miscellaneous_home_furnishing_specialty_stores"|"miscellaneous_publishing_and_printing"|"miscellaneous_recreation_services"|"miscellaneous_repair_shops"|"miscellaneous_specialty_retail"|"mobile_home_dealers"|"motion_picture_theaters"|"motor_freight_carriers_and_trucking"|"motor_homes_dealers"|"motor_vehicle_supplies_and_new_parts"|"motorcycle_shops_and_dealers"|"motorcycle_shops_dealers"|"music_stores_musical_instruments_pianos_and_sheet_music"|"news_dealers_and_newsstands"|"non_fi_money_orders"|"non_fi_stored_value_card_purchase_load"|"nondurable_goods"|"nurseries_lawn_and_garden_supply_stores"|"nursing_personal_care"|"office_and_commercial_furniture"|"opticians_eyeglasses"|"optometrists_ophthalmologist"|"orthopedic_goods_prosthetic_devices"|"osteopaths"|"package_stores_beer_wine_and_liquor"|"paints_varnishes_and_supplies"|"parking_lots_garages"|"passenger_railways"|"pawn_shops"|"pet_shops_pet_food_and_supplies"|"petroleum_and_petroleum_products"|"photo_developing"|"photographic_photocopy_microfilm_equipment_and_supplies"|"photographic_studios"|"picture_video_production"|"piece_goods_notions_and_other_dry_goods"|"plumbing_heating_equipment_and_supplies"|"political_organizations"|"postal_services_government_only"|"precious_stones_and_metals_watches_and_jewelry"|"professional_services"|"public_warehousing_and_storage"|"quick_copy_repro_and_blueprint"|"railroads"|"real_estate_agents_and_managers_rentals"|"record_stores"|"recreational_vehicle_rentals"|"religious_goods_stores"|"religious_organizations"|"roofing_siding_sheet_metal"|"secretarial_support_services"|"security_brokers_dealers"|"service_stations"|"sewing_needlework_fabric_and_piece_goods_stores"|"shoe_repair_hat_cleaning"|"shoe_stores"|"small_appliance_repair"|"snowmobile_dealers"|"special_trade_services"|"specialty_cleaning"|"sporting_goods_stores"|"sporting_recreation_camps"|"sports_and_riding_apparel_stores"|"sports_clubs_fields"|"stamp_and_coin_stores"|"stationary_office_supplies_printing_and_writing_paper"|"stationery_stores_office_and_school_supply_stores"|"swimming_pools_sales"|"t_ui_travel_germany"|"tailors_alterations"|"tax_payments_government_agencies"|"tax_preparation_services"|"taxicabs_limousines"|"telecommunication_equipment_and_telephone_sales"|"telecommunication_services"|"telegraph_services"|"tent_and_awning_shops"|"testing_laboratories"|"theatrical_ticket_agencies"|"timeshares"|"tire_retreading_and_repair"|"tolls_bridge_fees"|"tourist_attractions_and_exhibits"|"towing_services"|"trailer_parks_campgrounds"|"transportation_services"|"travel_agencies_tour_operators"|"truck_stop_iteration"|"truck_utility_trailer_rentals"|"typesetting_plate_making_and_related_services"|"typewriter_stores"|"u_s_federal_government_agencies_or_departments"|"uniforms_commercial_clothing"|"used_merchandise_and_secondhand_stores"|"utilities"|"variety_stores"|"veterinary_services"|"video_amusement_game_supplies"|"video_game_arcades"|"video_tape_rental_stores"|"vocational_trade_schools"|"watch_jewelry_repair"|"welding_repair"|"wholesale_clubs"|"wig_and_toupee_stores"|"wires_money_orders"|"womens_accessory_and_specialty_shops"|"womens_ready_to_wear_stores"|"wrecking_and_salvage_yards")[]? categories?;
    # Interval (or event) to which the amount applies.
    "all_time"|"daily"|"monthly"|"per_authorization"|"weekly"|"yearly" interval;
};

# 
public type Issuing_dispute_fraudulent_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
};

# Point in Time
public type Gelato_data_id_number_report_date record {
    # Numerical day between 1 and 31.
    int? day?;
    # Numerical month between 1 and 12.
    int? month?;
    # The four-digit year.
    int? year?;
};

# 
public type Setup_intent_next_action_redirect_to_url record {
    # If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
    string? return_url?;
    # The URL you must redirect your customer to in order to authenticate.
    string? url?;
};

public type Invoice_settings_custom_fields Custom_field_params[];

# Each customer has a [`balance`](https://stripe.com/docs/api/customers/object#customer_object-balance) value,
# which denotes a debit or credit that's automatically applied to their next invoice upon finalization.
# You may modify the value directly by using the [update customer API](https://stripe.com/docs/api/customers/update),
# or by creating a Customer Balance Transaction, which increments or decrements the customer's `balance` by the specified `amount`.
# 
# Related guide: [Customer Balance](https://stripe.com/docs/billing/customer/balance) to learn more.
public type Customer_balance_transaction record {
    # The amount of the transaction. A negative value is a credit for the customer's balance, and a positive value is a debit to the customer's `balance`.
    int amount;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the credit note (if any) related to the transaction.
    string|Credit_note? credit_note?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The ID of the customer the transaction belongs to.
    string|Customer customer;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The customer's `balance` after the transaction was applied. A negative value decreases the amount due on the customer's next invoice. A positive value increases the amount due on the customer's next invoice.
    int ending_balance;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The ID of the invoice (if any) related to the transaction.
    string|Invoice? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "customer_balance_transaction" 'object;
    # Transaction type: `adjustment`, `applied_to_invoice`, `credit_note`, `initial`, `invoice_too_large`, `invoice_too_small`, `unspent_receiver_credit`, or `unapplied_from_invoice`. See the [Customer Balance page](https://stripe.com/docs/billing/customer/balance#types) to learn more about transaction types.
    "adjustment"|"applied_to_invoice"|"credit_note"|"initial"|"invoice_too_large"|"invoice_too_small"|"migration"|"unapplied_from_invoice"|"unspent_receiver_credit" 'type;
};

# 
public type Payment_method_details_wechat_pay record {
    # Uniquely identifies this particular WeChat Pay account. You can use this attribute to check whether two WeChat accounts are the same.
    string? fingerprint?;
    # Transaction ID of this particular WeChat Pay transaction.
    string? transaction_id?;
};

# 
public type Invoice_setting_custom_field record {
    # The name of the custom field.
    @constraint:String {maxLength: 5000}
    string name;
    # The value of the custom field.
    @constraint:String {maxLength: 5000}
    string value;
};

# 
public type Charge_fraud_details record {
    # Assessments from Stripe. If set, the value is `fraudulent`.
    @constraint:String {maxLength: 5000}
    string stripe_report?;
    # Assessments reported by you. If set, possible values of are `safe` and `fraudulent`.
    @constraint:String {maxLength: 5000}
    string user_report?;
};

# 
public type Issuing_transaction_amount_details record {
    # The fee charged by the ATM for the cash withdrawal.
    int? atm_fee?;
};

public type Subscription_trial_end_1 "now"|int;

# Data used to generate a new [Price](https://stripe.com/docs/api/prices) object inline.
public type Recurring_price_data record {
    string currency;
    @constraint:String {maxLength: 5000}
    string product;
    Recurring_adhoc recurring;
    "exclusive"|"inclusive"|"unspecified" tax_behavior?;
    int unit_amount?;
    string unit_amount_decimal?;
};

# The recurring components of a price such as `interval` and `usage_type`.
public type Recurring_1 record {
    "last_during_period"|"last_ever"|"max"|"sum" aggregate_usage?;
    "day"|"month"|"week"|"year" interval;
    int interval_count?;
    "licensed"|"metered" usage_type?;
};

# 
public type Payment_intent_next_action_boleto record {
    # The timestamp after which the boleto expires.
    int? expires_at?;
    # The URL to the hosted boleto voucher page, which allows customers to view the boleto voucher.
    string? hosted_voucher_url?;
    # The boleto number.
    string? number?;
    # The URL to the downloadable boleto voucher PDF.
    string? pdf?;
};

# 
public type Mandate_au_becs_debit record {
    # The URL of the mandate. This URL generally contains sensitive information about the customer and should be shared with them exclusively.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Payment_pages_checkout_session_total_details_resource_breakdown record {
    # The aggregated line item discounts.
    Line_items_discount_amount[] discounts;
    # The aggregated line item tax amounts by rate.
    Line_items_tax_amount[] taxes;
};

# 
public type Reserve_transaction record {
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "reserve_transaction" 'object;
};

public type Billing_thresholds record {
    int usage_gte;
};

# 
public type Payment_method_details_ideal record {
    # The customer's bank. Can be one of `abn_amro`, `asn_bank`, `bunq`, `handelsbanken`, `ing`, `knab`, `moneyou`, `rabobank`, `regiobank`, `revolut`, `sns_bank`, `triodos_bank`, or `van_lanschot`.
    "abn_amro"|"asn_bank"|"bunq"|"handelsbanken"|"ing"|"knab"|"moneyou"|"rabobank"|"regiobank"|"revolut"|"sns_bank"|"triodos_bank"|"van_lanschot" bank?;
    # The Bank Identifier Code of the customer's bank.
    "ABNANL2A"|"ASNBNL21"|"BUNQNL2A"|"FVLBNL22"|"HANDNL2A"|"INGBNL2A"|"KNABNL2H"|"MOYONL21"|"RABONL2U"|"RBRBNL21"|"REVOLT21"|"SNSBNL2A"|"TRIONL2U" bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Payment_method? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this Charge.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Owner's verified full name. Values are verified or provided by iDEAL directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# 
public type Setup_attempt_payment_method_details_acss_debit record {
};

# 
public type Issuing_cardholder_id_document record {
    # The back of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? back?;
    # The front of a document returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? front?;
};

public type Subscription_item_usage_records_body record {|
    # Valid values are `increment` (default) or `set`. When using `increment` the specified `quantity` will be added to the usage at the specified timestamp. The `set` action will overwrite the usage quantity at that timestamp. If the subscription has [billing thresholds](https://stripe.com/docs/api/subscriptions/object#subscription_object-billing_thresholds), `increment` is the only allowed value.
    "increment"|"set" action?;
    # Specifies which fields in the response should be expanded.
    Subscription_item_usage_records_bodyExpandItemsString[] expand?;
    # The usage quantity for the specified timestamp.
    int quantity;
    # The timestamp for the usage event. This timestamp must be within the current billing period of the subscription of the provided `subscription_item`.
    int timestamp;
|};

# 
public type Three_d_secure_details record {
    # For authenticated transactions: how the customer was authenticated by
    # the issuing bank.
    "challenge"|"frictionless" authentication_flow?;
    # Indicates the outcome of 3D Secure authentication.
    "attempt_acknowledged"|"authenticated"|"failed"|"not_supported"|"processing_error" result?;
    # Additional information about why 3D Secure succeeded or failed based
    # on the `result`.
    "abandoned"|"bypassed"|"canceled"|"card_not_enrolled"|"network_not_supported"|"protocol_error"|"rejected" result_reason?;
    # The version of 3D Secure that was used.
    "1.0.2"|"2.1.0"|"2.2.0" version?;
};

public type Invoice_send_body record {|
    # Specifies which fields in the response should be expanded.
    Invoice_send_bodyExpandItemsString[] expand?;
|};

# Evidence for the dispute. Evidence contains exactly two non-null fields: the reason for the dispute and the associated evidence field for the selected reason
public type Issuing_dispute_evidence record {
    # 
    Issuing_dispute_canceled_evidence canceled?;
    # 
    Issuing_dispute_duplicate_evidence duplicate?;
    # 
    Issuing_dispute_fraudulent_evidence fraudulent?;
    # 
    Issuing_dispute_merchandise_not_as_described_evidence merchandise_not_as_described?;
    # 
    Issuing_dispute_not_received_evidence not_received?;
    # 
    Issuing_dispute_other_evidence other?;
    # The reason for filing the dispute. Its value will match the field containing the evidence.
    "canceled"|"duplicate"|"fraudulent"|"merchandise_not_as_described"|"not_received"|"other"|"service_not_as_described" reason;
    # 
    Issuing_dispute_service_not_as_described_evidence service_not_as_described?;
};

# 
public type Payment_intent_next_action_display_oxxo_details record {
    # The timestamp after which the OXXO voucher expires.
    int? expires_after?;
    # The URL for the hosted OXXO voucher page, which allows customers to view and print an OXXO voucher.
    string? hosted_voucher_url?;
    # OXXO reference number.
    string? number?;
};

# You can add one or multiple tax IDs to a [customer](https://stripe.com/docs/api/customers).
# A customer's tax IDs are displayed on invoices and credit notes issued for the customer.
# 
# Related guide: [Customer Tax Identification Numbers](https://stripe.com/docs/billing/taxes/tax-ids).
public type Tax_id record {
    # Two-letter ISO code representing the country of the tax ID.
    string? country?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # ID of the customer.
    string|Customer? customer?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "tax_id" 'object;
    # Type of the tax ID, one of `ae_trn`, `au_abn`, `au_arn`, `br_cnpj`, `br_cpf`, `ca_bn`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `ca_qst`, `ch_vat`, `cl_tin`, `es_cif`, `eu_vat`, `gb_vat`, `hk_br`, `id_npwp`, `il_vat`, `in_gst`, `jp_cn`, `jp_rn`, `kr_brn`, `li_uid`, `mx_rfc`, `my_frp`, `my_itn`, `my_sst`, `no_vat`, `nz_gst`, `ru_inn`, `ru_kpp`, `sa_vat`, `sg_gst`, `sg_uen`, `th_vat`, `tw_vat`, `us_ein`, or `za_vat`. Note that some legacy tax IDs have type `unknown`
    "ae_trn"|"au_abn"|"au_arn"|"br_cnpj"|"br_cpf"|"ca_bn"|"ca_gst_hst"|"ca_pst_bc"|"ca_pst_mb"|"ca_pst_sk"|"ca_qst"|"ch_vat"|"cl_tin"|"es_cif"|"eu_vat"|"gb_vat"|"hk_br"|"id_npwp"|"il_vat"|"in_gst"|"jp_cn"|"jp_rn"|"kr_brn"|"li_uid"|"mx_rfc"|"my_frp"|"my_itn"|"my_sst"|"no_vat"|"nz_gst"|"ru_inn"|"ru_kpp"|"sa_vat"|"sg_gst"|"sg_uen"|"th_vat"|"tw_vat"|"unknown"|"us_ein"|"za_vat" 'type;
    # Value of the tax ID.
    @constraint:String {maxLength: 5000}
    string value;
    # Tax ID verification information.
    Tax_id_verification? verification?;
};

# 
public type Issuing_cardholder_authorization_controls record {
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
    ("ac_refrigeration_repair"|"accounting_bookkeeping_services"|"advertising_services"|"agricultural_cooperative"|"airlines_air_carriers"|"airports_flying_fields"|"ambulance_services"|"amusement_parks_carnivals"|"antique_reproductions"|"antique_shops"|"aquariums"|"architectural_surveying_services"|"art_dealers_and_galleries"|"artists_supply_and_craft_shops"|"auto_and_home_supply_stores"|"auto_body_repair_shops"|"auto_paint_shops"|"auto_service_shops"|"automated_cash_disburse"|"automated_fuel_dispensers"|"automobile_associations"|"automotive_parts_and_accessories_stores"|"automotive_tire_stores"|"bail_and_bond_payments"|"bakeries"|"bands_orchestras"|"barber_and_beauty_shops"|"betting_casino_gambling"|"bicycle_shops"|"billiard_pool_establishments"|"boat_dealers"|"boat_rentals_and_leases"|"book_stores"|"books_periodicals_and_newspapers"|"bowling_alleys"|"bus_lines"|"business_secretarial_schools"|"buying_shopping_services"|"cable_satellite_and_other_pay_television_and_radio"|"camera_and_photographic_supply_stores"|"candy_nut_and_confectionery_stores"|"car_and_truck_dealers_new_used"|"car_and_truck_dealers_used_only"|"car_rental_agencies"|"car_washes"|"carpentry_services"|"carpet_upholstery_cleaning"|"caterers"|"charitable_and_social_service_organizations_fundraising"|"chemicals_and_allied_products"|"child_care_services"|"childrens_and_infants_wear_stores"|"chiropodists_podiatrists"|"chiropractors"|"cigar_stores_and_stands"|"civic_social_fraternal_associations"|"cleaning_and_maintenance"|"clothing_rental"|"colleges_universities"|"commercial_equipment"|"commercial_footwear"|"commercial_photography_art_and_graphics"|"commuter_transport_and_ferries"|"computer_network_services"|"computer_programming"|"computer_repair"|"computer_software_stores"|"computers_peripherals_and_software"|"concrete_work_services"|"construction_materials"|"consulting_public_relations"|"correspondence_schools"|"cosmetic_stores"|"counseling_services"|"country_clubs"|"courier_services"|"court_costs"|"credit_reporting_agencies"|"cruise_lines"|"dairy_products_stores"|"dance_hall_studios_schools"|"dating_escort_services"|"dentists_orthodontists"|"department_stores"|"detective_agencies"|"digital_goods_applications"|"digital_goods_games"|"digital_goods_large_volume"|"digital_goods_media"|"direct_marketing_catalog_merchant"|"direct_marketing_combination_catalog_and_retail_merchant"|"direct_marketing_inbound_telemarketing"|"direct_marketing_insurance_services"|"direct_marketing_other"|"direct_marketing_outbound_telemarketing"|"direct_marketing_subscription"|"direct_marketing_travel"|"discount_stores"|"doctors"|"door_to_door_sales"|"drapery_window_covering_and_upholstery_stores"|"drinking_places"|"drug_stores_and_pharmacies"|"drugs_drug_proprietaries_and_druggist_sundries"|"dry_cleaners"|"durable_goods"|"duty_free_stores"|"eating_places_restaurants"|"educational_services"|"electric_razor_stores"|"electrical_parts_and_equipment"|"electrical_services"|"electronics_repair_shops"|"electronics_stores"|"elementary_secondary_schools"|"employment_temp_agencies"|"equipment_rental"|"exterminating_services"|"family_clothing_stores"|"fast_food_restaurants"|"financial_institutions"|"fines_government_administrative_entities"|"fireplace_fireplace_screens_and_accessories_stores"|"floor_covering_stores"|"florists"|"florists_supplies_nursery_stock_and_flowers"|"freezer_and_locker_meat_provisioners"|"fuel_dealers_non_automotive"|"funeral_services_crematories"|"furniture_home_furnishings_and_equipment_stores_except_appliances"|"furniture_repair_refinishing"|"furriers_and_fur_shops"|"general_services"|"gift_card_novelty_and_souvenir_shops"|"glass_paint_and_wallpaper_stores"|"glassware_crystal_stores"|"golf_courses_public"|"government_services"|"grocery_stores_supermarkets"|"hardware_equipment_and_supplies"|"hardware_stores"|"health_and_beauty_spas"|"hearing_aids_sales_and_supplies"|"heating_plumbing_a_c"|"hobby_toy_and_game_shops"|"home_supply_warehouse_stores"|"hospitals"|"hotels_motels_and_resorts"|"household_appliance_stores"|"industrial_supplies"|"information_retrieval_services"|"insurance_default"|"insurance_underwriting_premiums"|"intra_company_purchases"|"jewelry_stores_watches_clocks_and_silverware_stores"|"landscaping_services"|"laundries"|"laundry_cleaning_services"|"legal_services_attorneys"|"luggage_and_leather_goods_stores"|"lumber_building_materials_stores"|"manual_cash_disburse"|"marinas_service_and_supplies"|"masonry_stonework_and_plaster"|"massage_parlors"|"medical_and_dental_labs"|"medical_dental_ophthalmic_and_hospital_equipment_and_supplies"|"medical_services"|"membership_organizations"|"mens_and_boys_clothing_and_accessories_stores"|"mens_womens_clothing_stores"|"metal_service_centers"|"miscellaneous"|"miscellaneous_apparel_and_accessory_shops"|"miscellaneous_auto_dealers"|"miscellaneous_business_services"|"miscellaneous_food_stores"|"miscellaneous_general_merchandise"|"miscellaneous_general_services"|"miscellaneous_home_furnishing_specialty_stores"|"miscellaneous_publishing_and_printing"|"miscellaneous_recreation_services"|"miscellaneous_repair_shops"|"miscellaneous_specialty_retail"|"mobile_home_dealers"|"motion_picture_theaters"|"motor_freight_carriers_and_trucking"|"motor_homes_dealers"|"motor_vehicle_supplies_and_new_parts"|"motorcycle_shops_and_dealers"|"motorcycle_shops_dealers"|"music_stores_musical_instruments_pianos_and_sheet_music"|"news_dealers_and_newsstands"|"non_fi_money_orders"|"non_fi_stored_value_card_purchase_load"|"nondurable_goods"|"nurseries_lawn_and_garden_supply_stores"|"nursing_personal_care"|"office_and_commercial_furniture"|"opticians_eyeglasses"|"optometrists_ophthalmologist"|"orthopedic_goods_prosthetic_devices"|"osteopaths"|"package_stores_beer_wine_and_liquor"|"paints_varnishes_and_supplies"|"parking_lots_garages"|"passenger_railways"|"pawn_shops"|"pet_shops_pet_food_and_supplies"|"petroleum_and_petroleum_products"|"photo_developing"|"photographic_photocopy_microfilm_equipment_and_supplies"|"photographic_studios"|"picture_video_production"|"piece_goods_notions_and_other_dry_goods"|"plumbing_heating_equipment_and_supplies"|"political_organizations"|"postal_services_government_only"|"precious_stones_and_metals_watches_and_jewelry"|"professional_services"|"public_warehousing_and_storage"|"quick_copy_repro_and_blueprint"|"railroads"|"real_estate_agents_and_managers_rentals"|"record_stores"|"recreational_vehicle_rentals"|"religious_goods_stores"|"religious_organizations"|"roofing_siding_sheet_metal"|"secretarial_support_services"|"security_brokers_dealers"|"service_stations"|"sewing_needlework_fabric_and_piece_goods_stores"|"shoe_repair_hat_cleaning"|"shoe_stores"|"small_appliance_repair"|"snowmobile_dealers"|"special_trade_services"|"specialty_cleaning"|"sporting_goods_stores"|"sporting_recreation_camps"|"sports_and_riding_apparel_stores"|"sports_clubs_fields"|"stamp_and_coin_stores"|"stationary_office_supplies_printing_and_writing_paper"|"stationery_stores_office_and_school_supply_stores"|"swimming_pools_sales"|"t_ui_travel_germany"|"tailors_alterations"|"tax_payments_government_agencies"|"tax_preparation_services"|"taxicabs_limousines"|"telecommunication_equipment_and_telephone_sales"|"telecommunication_services"|"telegraph_services"|"tent_and_awning_shops"|"testing_laboratories"|"theatrical_ticket_agencies"|"timeshares"|"tire_retreading_and_repair"|"tolls_bridge_fees"|"tourist_attractions_and_exhibits"|"towing_services"|"trailer_parks_campgrounds"|"transportation_services"|"travel_agencies_tour_operators"|"truck_stop_iteration"|"truck_utility_trailer_rentals"|"typesetting_plate_making_and_related_services"|"typewriter_stores"|"u_s_federal_government_agencies_or_departments"|"uniforms_commercial_clothing"|"used_merchandise_and_secondhand_stores"|"utilities"|"variety_stores"|"veterinary_services"|"video_amusement_game_supplies"|"video_game_arcades"|"video_tape_rental_stores"|"vocational_trade_schools"|"watch_jewelry_repair"|"welding_repair"|"wholesale_clubs"|"wig_and_toupee_stores"|"wires_money_orders"|"womens_accessory_and_specialty_shops"|"womens_ready_to_wear_stores"|"wrecking_and_salvage_yards")[]? allowed_categories?;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
    ("ac_refrigeration_repair"|"accounting_bookkeeping_services"|"advertising_services"|"agricultural_cooperative"|"airlines_air_carriers"|"airports_flying_fields"|"ambulance_services"|"amusement_parks_carnivals"|"antique_reproductions"|"antique_shops"|"aquariums"|"architectural_surveying_services"|"art_dealers_and_galleries"|"artists_supply_and_craft_shops"|"auto_and_home_supply_stores"|"auto_body_repair_shops"|"auto_paint_shops"|"auto_service_shops"|"automated_cash_disburse"|"automated_fuel_dispensers"|"automobile_associations"|"automotive_parts_and_accessories_stores"|"automotive_tire_stores"|"bail_and_bond_payments"|"bakeries"|"bands_orchestras"|"barber_and_beauty_shops"|"betting_casino_gambling"|"bicycle_shops"|"billiard_pool_establishments"|"boat_dealers"|"boat_rentals_and_leases"|"book_stores"|"books_periodicals_and_newspapers"|"bowling_alleys"|"bus_lines"|"business_secretarial_schools"|"buying_shopping_services"|"cable_satellite_and_other_pay_television_and_radio"|"camera_and_photographic_supply_stores"|"candy_nut_and_confectionery_stores"|"car_and_truck_dealers_new_used"|"car_and_truck_dealers_used_only"|"car_rental_agencies"|"car_washes"|"carpentry_services"|"carpet_upholstery_cleaning"|"caterers"|"charitable_and_social_service_organizations_fundraising"|"chemicals_and_allied_products"|"child_care_services"|"childrens_and_infants_wear_stores"|"chiropodists_podiatrists"|"chiropractors"|"cigar_stores_and_stands"|"civic_social_fraternal_associations"|"cleaning_and_maintenance"|"clothing_rental"|"colleges_universities"|"commercial_equipment"|"commercial_footwear"|"commercial_photography_art_and_graphics"|"commuter_transport_and_ferries"|"computer_network_services"|"computer_programming"|"computer_repair"|"computer_software_stores"|"computers_peripherals_and_software"|"concrete_work_services"|"construction_materials"|"consulting_public_relations"|"correspondence_schools"|"cosmetic_stores"|"counseling_services"|"country_clubs"|"courier_services"|"court_costs"|"credit_reporting_agencies"|"cruise_lines"|"dairy_products_stores"|"dance_hall_studios_schools"|"dating_escort_services"|"dentists_orthodontists"|"department_stores"|"detective_agencies"|"digital_goods_applications"|"digital_goods_games"|"digital_goods_large_volume"|"digital_goods_media"|"direct_marketing_catalog_merchant"|"direct_marketing_combination_catalog_and_retail_merchant"|"direct_marketing_inbound_telemarketing"|"direct_marketing_insurance_services"|"direct_marketing_other"|"direct_marketing_outbound_telemarketing"|"direct_marketing_subscription"|"direct_marketing_travel"|"discount_stores"|"doctors"|"door_to_door_sales"|"drapery_window_covering_and_upholstery_stores"|"drinking_places"|"drug_stores_and_pharmacies"|"drugs_drug_proprietaries_and_druggist_sundries"|"dry_cleaners"|"durable_goods"|"duty_free_stores"|"eating_places_restaurants"|"educational_services"|"electric_razor_stores"|"electrical_parts_and_equipment"|"electrical_services"|"electronics_repair_shops"|"electronics_stores"|"elementary_secondary_schools"|"employment_temp_agencies"|"equipment_rental"|"exterminating_services"|"family_clothing_stores"|"fast_food_restaurants"|"financial_institutions"|"fines_government_administrative_entities"|"fireplace_fireplace_screens_and_accessories_stores"|"floor_covering_stores"|"florists"|"florists_supplies_nursery_stock_and_flowers"|"freezer_and_locker_meat_provisioners"|"fuel_dealers_non_automotive"|"funeral_services_crematories"|"furniture_home_furnishings_and_equipment_stores_except_appliances"|"furniture_repair_refinishing"|"furriers_and_fur_shops"|"general_services"|"gift_card_novelty_and_souvenir_shops"|"glass_paint_and_wallpaper_stores"|"glassware_crystal_stores"|"golf_courses_public"|"government_services"|"grocery_stores_supermarkets"|"hardware_equipment_and_supplies"|"hardware_stores"|"health_and_beauty_spas"|"hearing_aids_sales_and_supplies"|"heating_plumbing_a_c"|"hobby_toy_and_game_shops"|"home_supply_warehouse_stores"|"hospitals"|"hotels_motels_and_resorts"|"household_appliance_stores"|"industrial_supplies"|"information_retrieval_services"|"insurance_default"|"insurance_underwriting_premiums"|"intra_company_purchases"|"jewelry_stores_watches_clocks_and_silverware_stores"|"landscaping_services"|"laundries"|"laundry_cleaning_services"|"legal_services_attorneys"|"luggage_and_leather_goods_stores"|"lumber_building_materials_stores"|"manual_cash_disburse"|"marinas_service_and_supplies"|"masonry_stonework_and_plaster"|"massage_parlors"|"medical_and_dental_labs"|"medical_dental_ophthalmic_and_hospital_equipment_and_supplies"|"medical_services"|"membership_organizations"|"mens_and_boys_clothing_and_accessories_stores"|"mens_womens_clothing_stores"|"metal_service_centers"|"miscellaneous"|"miscellaneous_apparel_and_accessory_shops"|"miscellaneous_auto_dealers"|"miscellaneous_business_services"|"miscellaneous_food_stores"|"miscellaneous_general_merchandise"|"miscellaneous_general_services"|"miscellaneous_home_furnishing_specialty_stores"|"miscellaneous_publishing_and_printing"|"miscellaneous_recreation_services"|"miscellaneous_repair_shops"|"miscellaneous_specialty_retail"|"mobile_home_dealers"|"motion_picture_theaters"|"motor_freight_carriers_and_trucking"|"motor_homes_dealers"|"motor_vehicle_supplies_and_new_parts"|"motorcycle_shops_and_dealers"|"motorcycle_shops_dealers"|"music_stores_musical_instruments_pianos_and_sheet_music"|"news_dealers_and_newsstands"|"non_fi_money_orders"|"non_fi_stored_value_card_purchase_load"|"nondurable_goods"|"nurseries_lawn_and_garden_supply_stores"|"nursing_personal_care"|"office_and_commercial_furniture"|"opticians_eyeglasses"|"optometrists_ophthalmologist"|"orthopedic_goods_prosthetic_devices"|"osteopaths"|"package_stores_beer_wine_and_liquor"|"paints_varnishes_and_supplies"|"parking_lots_garages"|"passenger_railways"|"pawn_shops"|"pet_shops_pet_food_and_supplies"|"petroleum_and_petroleum_products"|"photo_developing"|"photographic_photocopy_microfilm_equipment_and_supplies"|"photographic_studios"|"picture_video_production"|"piece_goods_notions_and_other_dry_goods"|"plumbing_heating_equipment_and_supplies"|"political_organizations"|"postal_services_government_only"|"precious_stones_and_metals_watches_and_jewelry"|"professional_services"|"public_warehousing_and_storage"|"quick_copy_repro_and_blueprint"|"railroads"|"real_estate_agents_and_managers_rentals"|"record_stores"|"recreational_vehicle_rentals"|"religious_goods_stores"|"religious_organizations"|"roofing_siding_sheet_metal"|"secretarial_support_services"|"security_brokers_dealers"|"service_stations"|"sewing_needlework_fabric_and_piece_goods_stores"|"shoe_repair_hat_cleaning"|"shoe_stores"|"small_appliance_repair"|"snowmobile_dealers"|"special_trade_services"|"specialty_cleaning"|"sporting_goods_stores"|"sporting_recreation_camps"|"sports_and_riding_apparel_stores"|"sports_clubs_fields"|"stamp_and_coin_stores"|"stationary_office_supplies_printing_and_writing_paper"|"stationery_stores_office_and_school_supply_stores"|"swimming_pools_sales"|"t_ui_travel_germany"|"tailors_alterations"|"tax_payments_government_agencies"|"tax_preparation_services"|"taxicabs_limousines"|"telecommunication_equipment_and_telephone_sales"|"telecommunication_services"|"telegraph_services"|"tent_and_awning_shops"|"testing_laboratories"|"theatrical_ticket_agencies"|"timeshares"|"tire_retreading_and_repair"|"tolls_bridge_fees"|"tourist_attractions_and_exhibits"|"towing_services"|"trailer_parks_campgrounds"|"transportation_services"|"travel_agencies_tour_operators"|"truck_stop_iteration"|"truck_utility_trailer_rentals"|"typesetting_plate_making_and_related_services"|"typewriter_stores"|"u_s_federal_government_agencies_or_departments"|"uniforms_commercial_clothing"|"used_merchandise_and_secondhand_stores"|"utilities"|"variety_stores"|"veterinary_services"|"video_amusement_game_supplies"|"video_game_arcades"|"video_tape_rental_stores"|"vocational_trade_schools"|"watch_jewelry_repair"|"welding_repair"|"wholesale_clubs"|"wig_and_toupee_stores"|"wires_money_orders"|"womens_accessory_and_specialty_shops"|"womens_ready_to_wear_stores"|"wrecking_and_salvage_yards")[]? blocked_categories?;
    # Limit spending with amount-based rules that apply across this cardholder's cards.
    Issuing_cardholder_spending_limit[]? spending_limits?;
    # Currency of the amounts within `spending_limits`.
    string? spending_limits_currency?;
};

# 
public type Line_items_tax_amount record {
    # Amount of tax applied for this rate.
    int amount;
    # Tax rates can be applied to [invoices](https://stripe.com/docs/billing/invoices/tax-rates), [subscriptions](https://stripe.com/docs/billing/subscriptions/taxes) and [Checkout Sessions](https://stripe.com/docs/payments/checkout/set-up-a-subscription#tax-rates) to collect tax.
    # 
    # Related guide: [Tax Rates](https://stripe.com/docs/billing/taxes/tax-rates).
    Tax_rate rate;
};

# 
public type Mandate_single_use record {
    # On a single use mandate, the amount of the payment.
    int amount;
    # On a single use mandate, the currency of the payment.
    string currency;
};

# Subscription items allow you to create customer subscriptions with more than
# one plan, making it easy to represent complex billing relationships.
public type Subscription_item record {
    # Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
    Subscription_item_billing_thresholds? billing_thresholds?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "subscription_item" 'object;
    # Prices define the unit cost, currency, and (optional) billing cycle for both recurring and one-time purchases of products.
    # [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and prices help you track payment terms. Different physical goods or levels of service should be represented by products, and pricing options should be represented by prices. This approach lets you change prices without having to change your provisioning scheme.
    # 
    # For example, you might have a single "gold" product that has prices for $10/month, $100/year, and €9 once.
    # 
    # Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription), [create an invoice](https://stripe.com/docs/billing/invoices/create), and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
    Price price;
    # The [quantity](https://stripe.com/docs/subscriptions/quantities) of the plan to which the customer should be subscribed.
    int quantity?;
    # The `subscription` this `subscription_item` belongs to.
    @constraint:String {maxLength: 5000}
    string subscription;
    # The tax rates which apply to this `subscription_item`. When set, the `default_tax_rates` on the subscription do not apply to this `subscription_item`.
    Tax_rate[]? tax_rates?;
};

# Any use of an [issued card](https://stripe.com/docs/issuing) that results in funds entering or leaving
# your Stripe account, such as a completed purchase or refund, is represented by an Issuing
# `Transaction` object.
# 
# Related guide: [Issued Card Transactions](https://stripe.com/docs/issuing/purchases/transactions).
public type IssuingTransaction record {
    # The transaction amount, which will be reflected in your balance. This amount is in your currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    Issuing_transaction_amount_details? amount_details?;
    # The `Authorization` object that led to this transaction.
    string|IssuingAuthorization? authorization?;
    # ID of the [balance transaction](https://stripe.com/docs/api/balance_transactions) associated with this transaction.
    string|Balance_transaction? balance_transaction?;
    # The card used to make this transaction.
    string|IssuingCard card;
    # The cardholder to whom this transaction belongs.
    string|IssuingCardholder? cardholder?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # If you've disputed the transaction, the ID of the dispute.
    string|IssuingDispute? dispute?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The amount that the merchant will receive, denominated in `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). It will be different from `amount` if the merchant is taking payment in a different currency.
    int merchant_amount;
    # The currency with which the merchant is taking payment.
    string merchant_currency;
    # 
    Issuing_authorization_merchant_data merchant_data;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "issuing.transaction" 'object;
    # Additional purchase information that is optionally provided by the merchant.
    Issuing_transaction_purchase_details? purchase_details?;
    # The nature of the transaction.
    "capture"|"refund" 'type;
    # The digital wallet used for this transaction. One of `apple_pay`, `google_pay`, or `samsung_pay`.
    "apple_pay"|"google_pay"|"samsung_pay" wallet?;
};

public type Source_type_sepa_debit record {
    string? bank_code?;
    string? branch_code?;
    string? country?;
    string? fingerprint?;
    string? last4?;
    string? mandate_reference?;
    string? mandate_url?;
};

# Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
public type Payment_settings record {
    Payment_method_options payment_method_options?;
    ("ach_credit_transfer"|"ach_debit"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"fpx"|"giropay"|"ideal"|"sepa_debit"|"sofort"|"wechat_pay")[]|"" payment_method_types?;
};

# 
public type Issuing_transaction_receipt_data record {
    # The description of the item. The maximum length of this field is 26 characters.
    string? description?;
    # The quantity of the item.
    decimal? quantity?;
    # The total for this line item in cents.
    int? total?;
    # The unit cost of the item in cents.
    int? unit_cost?;
};

# 
public type Customer_tax_location record {
    # The customer's country as identified by Stripe Tax.
    @constraint:String {maxLength: 5000}
    string country;
    # The data source used to infer the customer's location.
    "billing_address"|"ip_address"|"payment_method"|"shipping_destination" 'source;
    # The customer's state, county, province, or region as identified by Stripe Tax.
    string? state?;
};

# 
public type Account_business_profile record {
    # [The merchant category code for the account](https://stripe.com/docs/connect/setting-mcc). MCCs are used to classify businesses based on the goods or services they provide.
    string? mcc?;
    # The customer-facing business name.
    string? name?;
    # Internal-only description of the product sold or service provided by the business. It's used by Stripe for risk and underwriting purposes.
    string? product_description?;
    # A publicly available mailing address for sending support issues to.
    Address? support_address?;
    # A publicly available email address for sending support issues to.
    string? support_email?;
    # A publicly available phone number to call with support issues.
    string? support_phone?;
    # A publicly available website for handling support issues.
    string? support_url?;
    # The business's publicly available website.
    string? url?;
};

# 
public type Transform_quantity record {
    # Divide usage by this number.
    int divide_by;
    # After division, either round the result `up` or `down`.
    "down"|"up" round;
};

# 
public type Payment_method_details_stripe_account record {
};

# Reviews can be used to supplement automated fraud detection with human expertise.
# 
# Learn more about [Radar](/radar) and reviewing payments
# [here](https://stripe.com/docs/radar/reviews).
public type Review record {
    # The ZIP or postal code of the card used, if applicable.
    string? billing_zip?;
    # The charge associated with this review.
    string|Charge? charge?;
    # The reason the review was closed, or null if it has not yet been closed. One of `approved`, `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.
    "approved"|"disputed"|"redacted"|"refunded"|"refunded_as_fraud" closed_reason?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The IP address where the payment originated.
    string? ip_address?;
    # Information related to the location of the payment. Note that this information is an approximation and attempts to locate the nearest population center - it should not be used to determine a specific address.
    Radar_review_resource_location? ip_address_location?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "review" 'object;
    # If `true`, the review needs action.
    boolean open;
    # The reason the review was opened. One of `rule` or `manual`.
    "manual"|"rule" opened_reason;
    # The PaymentIntent ID associated with this review, if one exists.
    string|Payment_intent payment_intent?;
    # The reason the review is currently open or closed. One of `rule`, `manual`, `approved`, `refunded`, `refunded_as_fraud`, `disputed`, or `redacted`.
    @constraint:String {maxLength: 5000}
    string reason;
    # Information related to the browsing session of the user who initiated the payment.
    Radar_review_resource_session? session?;
};

public type Discounts_data_param_1 record {
    @constraint:String {maxLength: 5000}
    string coupon?;
    @constraint:String {maxLength: 5000}
    string discount?;
};

# When a non-stripe BIN is used, any use of an [issued card](https://stripe.com/docs/issuing) must be settled directly with the card network. The net amount owed is represented by an Issuing `Settlement` object.
public type IssuingSettlement record {
    # The Bank Identification Number reflecting this settlement record.
    @constraint:String {maxLength: 5000}
    string bin;
    # The date that the transactions are cleared and posted to user's accounts.
    int clearing_date;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The total interchange received as reimbursement for the transactions.
    int interchange_fees;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # The total net amount required to settle with the network.
    int net_total;
    # The card network for this settlement report. One of ["visa"]
    "visa" network;
    # The total amount of fees owed to the network.
    int network_fees;
    # The Settlement Identification Number assigned by the network.
    @constraint:String {maxLength: 5000}
    string network_settlement_identifier;
    # String representing the object's type. Objects of the same type share the same value.
    "issuing.settlement" 'object;
    # One of `international` or `uk_national_net`.
    @constraint:String {maxLength: 5000}
    string settlement_service;
    # The total number of transactions reflected in this settlement.
    int transaction_count;
    # The total transaction amount reflected in this settlement.
    int transaction_volume;
};

public type Source_type_card record {
    string? address_line1_check?;
    string? address_zip_check?;
    string? brand?;
    string? country?;
    string? cvc_check?;
    string? dynamic_last4?;
    int? exp_month?;
    int? exp_year?;
    string fingerprint?;
    string? funding?;
    string? last4?;
    string? name?;
    string three_d_secure?;
    string? tokenization_method?;
};

# `Application Fee Refund` objects allow you to refund an application fee that
# has previously been created but not yet refunded. Funds will be refunded to
# the Stripe account from which the fee was originally collected.
# 
# Related guide: [Refunding Application Fees](https://stripe.com/docs/connect/destination-charges#refunding-app-fee).
public type Fee_refund record {
    # Amount, in %s.
    int amount;
    # Balance transaction that describes the impact on your account balance.
    string|Balance_transaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the application fee that was refunded.
    string|Application_fee fee;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "fee_refund" 'object;
};

# 
public type PaymentFlowsPaymentMethodList record {
    Payment_method[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000, pattern: re `^/v1/payment_methods`}
    string url;
};

# 
public type Payment_method_card_wallet_visa_checkout record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# An early fraud warning indicates that the card issuer has notified us that a
# charge may be fraudulent.
# 
# Related guide: [Early Fraud Warnings](https://stripe.com/docs/disputes/measuring#early-fraud-warnings).
public type RadarEarly_fraud_warning record {
    # An EFW is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an EFW, in order to avoid receiving a dispute later.
    boolean actionable;
    # ID of the charge this early fraud warning is for, optionally expanded.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
    @constraint:String {maxLength: 5000}
    string fraud_type;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "radar.early_fraud_warning" 'object;
    # ID of the Payment Intent this early fraud warning is for, optionally expanded.
    string|Payment_intent payment_intent?;
};

# When an [issued card](https://stripe.com/docs/issuing) is used to make a purchase, an Issuing `Authorization`
# object is created. [Authorizations](https://stripe.com/docs/issuing/purchases/authorizations) must be approved for the
# purchase to be completed successfully.
# 
# Related guide: [Issued Card Authorizations](https://stripe.com/docs/issuing/purchases/authorizations).
public type IssuingAuthorization record {
    # The total amount that was authorized or rejected. This amount is in the card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    Issuing_authorization_amount_details? amount_details?;
    # Whether the authorization has been approved.
    boolean approved;
    # How the card details were provided.
    "chip"|"contactless"|"keyed_in"|"online"|"swipe" authorization_method;
    # List of balance transactions associated with this authorization.
    Balance_transaction[] balance_transactions;
    # You can [create physical or virtual cards](https://stripe.com/docs/issuing/cards) that are issued to cardholders.
    IssuingCard card;
    # The cardholder to whom this authorization belongs.
    string|IssuingCardholder? cardholder?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The total amount that was authorized or rejected. This amount is in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int merchant_amount;
    # The currency that was presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string merchant_currency;
    # 
    Issuing_authorization_merchant_data merchant_data;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "issuing.authorization" 'object;
    # The pending authorization request. This field will only be non-null during an `issuing_authorization.request` webhook.
    Issuing_authorization_pending_request? pending_request?;
    # History of every time `pending_request` was approved/denied, either by you directly or by Stripe (e.g. based on your `spending_controls`). If the merchant changes the authorization by performing an [incremental authorization](https://stripe.com/docs/issuing/purchases/authorizations), you can look at this field to see the previous requests for the authorization.
    Issuing_authorization_request[] request_history;
    # The current status of the authorization in its lifecycle.
    "closed"|"pending"|"reversed" status;
    # List of [transactions](https://stripe.com/docs/api/issuing/transactions) associated with this authorization.
    IssuingTransaction[] transactions;
    # 
    Issuing_authorization_verification_data verification_data;
    # The digital wallet used for this authorization. One of `apple_pay`, `google_pay`, or `samsung_pay`.
    string? wallet?;
};

# 
public type Portal_features record {
    # 
    Portal_customer_update customer_update;
    # 
    Portal_invoice_list invoice_history;
    # 
    Portal_payment_method_update payment_method_update;
    # 
    Portal_subscription_cancel subscription_cancel;
    # 
    Portal_subscription_pause subscription_pause;
    # 
    Portal_subscription_update subscription_update;
};

public type Source_type_klarna record {
    string background_image_url?;
    string? client_token?;
    string first_name?;
    string last_name?;
    string locale?;
    string logo_url?;
    string page_title?;
    string pay_later_asset_urls_descriptive?;
    string pay_later_asset_urls_standard?;
    string pay_later_name?;
    string pay_later_redirect_url?;
    string pay_now_asset_urls_descriptive?;
    string pay_now_asset_urls_standard?;
    string pay_now_name?;
    string pay_now_redirect_url?;
    string pay_over_time_asset_urls_descriptive?;
    string pay_over_time_asset_urls_standard?;
    string pay_over_time_name?;
    string pay_over_time_redirect_url?;
    string payment_method_categories?;
    string purchase_country?;
    string purchase_type?;
    string redirect_url?;
    int shipping_delay?;
    string shipping_first_name?;
    string shipping_last_name?;
};

public type Item_billing_thresholds_param record {
    int usage_gte;
};

# 
public type Account_card_issuing_settings record {
    # 
    Card_issuing_account_terms_of_service tos_acceptance?;
};

public type Customer_shipping_address record {
    Optional_fields_address address;
    @constraint:String {maxLength: 5000}
    string name;
    @constraint:String {maxLength: 5000}
    string phone?;
};

# 
public type Legal_entity_company_verification record {
    # 
    Legal_entity_company_verification_document document;
};

# A subscription schedule allows you to create and manage the lifecycle of a subscription by predefining expected changes.
# 
# Related guide: [Subscription Schedules](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
public type Subscription_schedule record {
    # Time at which the subscription schedule was canceled. Measured in seconds since the Unix epoch.
    int? canceled_at?;
    # Time at which the subscription schedule was completed. Measured in seconds since the Unix epoch.
    int? completed_at?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Object representing the start and end dates for the current phase of the subscription schedule, if it is `active`.
    Subscription_schedule_current_phase? current_phase?;
    # ID of the customer who owns the subscription schedule.
    string|Customer|Deleted_customer customer;
    # Object representing the subscription schedule’s default settings
    Subscription_schedules_resource_default_settings default_settings;
    # Behavior of the subscription schedule and underlying subscription when it ends. Possible values are `release` and `cancel`.
    "cancel"|"none"|"release"|"renew" end_behavior;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "subscription_schedule" 'object;
    # Configuration for the subscription schedule's phases.
    Subscription_schedule_phase_configuration[] phases;
    # Time at which the subscription schedule was released. Measured in seconds since the Unix epoch.
    int? released_at?;
    # ID of the subscription once managed by the subscription schedule (if it is released).
    string? released_subscription?;
    # The present status of the subscription schedule. Possible values are `not_started`, `active`, `completed`, `released`, and `canceled`. You can read more about the different states in our [behavior guide](https://stripe.com/docs/billing/subscriptions/subscription-schedules).
    "active"|"canceled"|"completed"|"not_started"|"released" status;
    # ID of the subscription managed by the subscription schedule.
    string|Subscription? subscription?;
};

# To charge a credit or a debit card, you create a `Charge` object. You can
# retrieve and refund individual charges as well as list all charges. Charges
# are identified by a unique, random ID.
# 
# Related guide: [Accept a payment with the Charges API](https://stripe.com/docs/payments/accept-a-payment-charges).
public type Charge record {
    # Amount intended to be collected by this payment. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    int amount;
    # Amount in %s captured (can be less than the amount attribute on the charge if a partial capture was made).
    int amount_captured;
    # Amount in %s refunded (can be less than the amount attribute on the charge if a partial refund was issued).
    int amount_refunded;
    # ID of the Connect application that created the charge.
    string|Application? application?;
    # The application fee (if any) for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
    string|Application_fee? application_fee?;
    # The amount of the application fee (if any) requested for the charge. [See the Connect documentation](https://stripe.com/docs/connect/direct-charges#collecting-fees) for details.
    int? application_fee_amount?;
    # ID of the balance transaction that describes the impact of this charge on your account balance (not including refunds or disputes).
    string|Balance_transaction? balance_transaction?;
    # 
    Billing_details billing_details;
    # The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements. Allows you to see what the statement descriptor looks like after the static and dynamic portions are combined.
    string? calculated_statement_descriptor?;
    # If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
    boolean captured;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the customer this charge is for if one exists.
    string|Customer|Deleted_customer? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Whether the charge has been disputed.
    boolean disputed;
    # Error code explaining reason for charge failure if available (see [the errors section](https://stripe.com/docs/api#errors) for a list of codes).
    string? failure_code?;
    # Message to user further explaining reason for charge failure if available.
    string? failure_message?;
    # Information on fraud assessments for the charge.
    Charge_fraud_details? fraud_details?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # ID of the invoice this charge is for if one exists.
    string|Invoice? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "charge" 'object;
    # The account (if any) the charge was made on behalf of without triggering an automatic transfer. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers) for details.
    string|Account? on_behalf_of?;
    # ID of the order this charge is for if one exists.
    string|Order? 'order?;
    # Details about whether the payment was accepted, and why. See [understanding declines](https://stripe.com/docs/declines) for details.
    Charge_outcome? outcome?;
    # `true` if the charge succeeded, or was successfully authorized for later capture.
    boolean paid;
    # ID of the PaymentIntent associated with this charge, if one exists.
    string|Payment_intent? payment_intent?;
    # ID of the payment method used in this charge.
    string? payment_method?;
    # Details about the payment method at the time of the transaction.
    Payment_method_details? payment_method_details?;
    # This is the email address that the receipt for this charge was sent to.
    string? receipt_email?;
    # This is the transaction number that appears on email receipts sent for this charge. This attribute will be `null` until a receipt has been sent.
    string? receipt_number?;
    # This is the URL to view the receipt for this charge. The receipt is kept up-to-date to the latest state of the charge, including any refunds. If the charge is for an Invoice, the receipt will be stylized as an Invoice receipt.
    string? receipt_url?;
    # Whether the charge has been fully refunded. If the charge is only partially refunded, this attribute will still be false.
    boolean refunded;
    # A list of refunds that have been applied to the charge.
    RefundList refunds;
    # ID of the review associated with this charge if one exists.
    string|Review? review?;
    # Shipping information for the charge.
    Shipping? shipping?;
    # The transfer ID which created this charge. Only present if the charge came from another Stripe account. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
    string|Transfer? source_transfer?;
    # For card charges, use `statement_descriptor_suffix` instead. Otherwise, you can use this value as the complete description of a charge on your customers’ statements. Must contain at least one letter, maximum 22 characters.
    string? statement_descriptor?;
    # Provides information about the charge that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
    string? statement_descriptor_suffix?;
    # The status of the payment is either `succeeded`, `pending`, or `failed`.
    @constraint:String {maxLength: 5000}
    string status;
    # ID of the transfer to the `destination` account (only applicable if the charge was created using the `destination` parameter).
    string|Transfer transfer?;
    # An optional dictionary including the account to automatically transfer to as part of a destination charge. [See the Connect documentation](https://stripe.com/docs/connect/destination-charges) for details.
    Charge_transfer_data? transfer_data?;
    # A string that identifies this transaction as part of a group. See the [Connect documentation](https://stripe.com/docs/connect/charges-transfers#transfer-options) for details.
    string? transfer_group?;
};

# A Mandate is a record of the permission a customer has given you to debit their payment method.
public type Mandate record {
    # 
    Customer_acceptance customer_acceptance;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # 
    Mandate_multi_use multi_use?;
    # String representing the object's type. Objects of the same type share the same value.
    "mandate" 'object;
    # ID of the payment method associated with this mandate.
    string|Payment_method payment_method;
    # 
    Mandate_payment_method_details payment_method_details;
    # 
    Mandate_single_use single_use?;
    # The status of the mandate, which indicates whether it can be used to initiate a payment.
    "active"|"inactive"|"pending" status;
    # The type of the mandate.
    "multi_use"|"single_use" 'type;
};

# If you have [scheduled a Sigma query](https://stripe.com/docs/sigma/scheduled-queries), you'll
# receive a `sigma.scheduled_query_run.created` webhook each time the query
# runs. The webhook contains a `ScheduledQueryRun` object, which you can use to
# retrieve the query results.
public type Scheduled_query_run record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # When the query was run, Sigma contained a snapshot of your Stripe data at this time.
    int data_load_time;
    # 
    Sigma_scheduled_query_run_error 'error?;
    # The file object representing the results of the query.
    File? file?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "scheduled_query_run" 'object;
    # Time at which the result expires and is no longer available for download.
    int result_available_until;
    # SQL for the query.
    @constraint:String {maxLength: 100000}
    string sql;
    # The query's execution status, which will be `completed` for successful runs, and `canceled`, `failed`, or `timed_out` otherwise.
    @constraint:String {maxLength: 5000}
    string status;
    # Title of the query.
    @constraint:String {maxLength: 5000}
    string title;
};

# A Quote is a way to model prices that you'd like to provide to a customer.
# Once accepted, it will automatically create an invoice, subscription or subscription schedule.
public type Quote record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes are applied.
    int amount_total;
    # The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. Only applicable if there are no line items with recurring prices on the quote.
    int? application_fee_amount?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account. Only applicable if there are line items with recurring prices on the quote.
    decimal? application_fee_percent?;
    # 
    Quotes_resource_automatic_tax automatic_tax;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay invoices at the end of the subscription cycle or on finalization using the default payment method attached to the subscription or customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions. Defaults to `charge_automatically`.
    "charge_automatically"|"send_invoice" collection_method;
    # 
    Quotes_resource_computed computed;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string? currency?;
    # The customer which this quote belongs to. A customer is required before finalizing the quote. Once specified, it cannot be changed.
    string|Customer|Deleted_customer? customer?;
    # The tax rates applied to this quote.
    (string|Tax_rate)[] default_tax_rates?;
    # A description that will be displayed on the quote PDF.
    string? description?;
    # The discounts applied to this quote.
    (string|Discount)[] discounts;
    # The date on which the quote will be canceled if in `open` or `draft` status. Measured in seconds since the Unix epoch.
    int expires_at;
    # A footer that will be displayed on the quote PDF.
    string? footer?;
    # Details of the quote that was cloned. See the [cloning documentation](https://stripe.com/docs/quotes/clone) for more details.
    Quotes_resource_from_quote? from_quote?;
    # A header that will be displayed on the quote PDF.
    string? header?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The invoice that was created from this quote.
    string|Invoice|Deleted_invoice? invoice?;
    # All invoices will be billed using the specified settings.
    Invoice_setting_quote_setting? invoice_settings?;
    # A list of items the customer is being quoted for.
    QuotesResourceListLineItems line_items?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # A unique number that identifies this particular quote. This number is assigned once the quote is [finalized](https://stripe.com/docs/quotes/overview#finalize).
    string? number?;
    # String representing the object's type. Objects of the same type share the same value.
    "quote" 'object;
    # The account on behalf of which to charge. See the [Connect documentation](https://support.stripe.com/questions/sending-invoices-on-behalf-of-connected-accounts) for details.
    string|Account? on_behalf_of?;
    # The status of the quote.
    "accepted"|"canceled"|"draft"|"open" status;
    # 
    Quotes_resource_status_transitions status_transitions;
    # The subscription that was created or updated from this quote.
    string|Subscription? subscription?;
    # 
    Quotes_resource_subscription_data subscription_data;
    # The subscription schedule that was created or updated from this quote.
    string|Subscription_schedule? subscription_schedule?;
    # 
    Quotes_resource_total_details total_details;
    # The account (if any) the payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the invoices.
    Quotes_resource_transfer_data? transfer_data?;
};

public type Customer_bank_account_details record {
    @constraint:String {maxLength: 5000}
    string account_holder_name?;
    "company"|"individual" account_holder_type?;
    @constraint:String {maxLength: 5000}
    string account_number;
    @constraint:String {maxLength: 5000}
    string country;
    string currency?;
    "bank_account" 'object?;
    @constraint:String {maxLength: 5000}
    string routing_number?;
};

# External accounts (bank accounts and debit cards) currently attached to this account
public type ExternalAccountList record {
    # The list contains all external accounts that have been attached to the Stripe account. These may be bank accounts or cards.
    (Bank_account|Card)[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Automatic_tax record {
    # Whether Stripe automatically computes tax on this invoice.
    boolean enabled;
    # The status of the most recent automated tax calculation for this invoice.
    "complete"|"failed"|"requires_location_inputs" status?;
};

public type Customers_customer_body record {|
    # The customer's address.
    Customer_adresss|string address?;
    # An integer amount in %s that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
    int balance?;
    # Either a token, like the ones returned by [Stripe.js](https://stripe.com/docs/js), or a dictionary containing a user's bank account details.
    Customer_bank_account_details|string bank_account?;
    # A token, like the ones returned by [Stripe.js](https://stripe.com/docs/js).
    Customer_card_details|string card?;
    @constraint:String {maxLength: 5000}
    string coupon?;
    # ID of Alipay account to make the customer's new default for invoice payments.
    @constraint:String {maxLength: 500}
    string default_alipay_account?;
    # ID of bank account to make the customer's new default for invoice payments.
    @constraint:String {maxLength: 500}
    string default_bank_account?;
    # ID of card to make the customer's new default for invoice payments.
    @constraint:String {maxLength: 500}
    string default_card?;
    # If you are using payment methods created via the PaymentMethods API, see the [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/update#update_customer-invoice_settings-default_payment_method) parameter.
    # 
    # Provide the ID of a payment source already attached to this customer to make it this customer's default payment source.
    # 
    # If you want to add a new payment source and make it the default, see the [source](https://stripe.com/docs/api/customers/update#update_customer-source) property.
    @constraint:String {maxLength: 500}
    string default_source?;
    # An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard.
    @constraint:String {maxLength: 5000}
    string description?;
    # Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*.
    @constraint:String {maxLength: 512}
    string email?;
    # Specifies which fields in the response should be expanded.
    Customers_customer_bodyExpandItemsString[] expand?;
    # The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers.
    @constraint:String {maxLength: 5000}
    string invoice_prefix?;
    # Default invoice settings for this customer.
    Customer_param_1 invoice_settings?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
    # The customer's full name or business name.
    @constraint:String {maxLength: 256}
    string name?;
    # The sequence to be used on the customer's next invoice. Defaults to 1.
    int next_invoice_sequence?;
    # The customer's phone number.
    @constraint:String {maxLength: 20}
    string phone?;
    # Customer's preferred languages, ordered by preference.
    Customers_customer_bodyPreferredlocalesItemsString[] preferred_locales?;
    # The API ID of a promotion code to apply to the customer. The customer will have a discount applied on all recurring payments. Charges you create through the API will not have the discount.
    @constraint:String {maxLength: 5000}
    string promotion_code?;
    # The customer's shipping information. Appears on invoices emailed to this customer.
    Customer_shipping_address|"" shipping?;
    @constraint:String {maxLength: 5000}
    string 'source?;
    # Tax details about the customer.
    Tax_param tax?;
    # The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
    ""|"exempt"|"none"|"reverse" tax_exempt?;
    # Unix timestamp representing the end of the trial period the customer will get before being charged for the first time. This will always overwrite any trials that might apply via a subscribed plan. If set, trial_end will override the default trial period of the plan the customer is being subscribed to. The special value `now` can be provided to end the customer's trial immediately. Can be at most two years from `billing_cycle_anchor`.
    "now"|int trial_end?;
|};

# 
public type Issuing_transaction_flight_data_leg record {
    # The three-letter IATA airport code of the flight's destination.
    string? arrival_airport_code?;
    # The airline carrier code.
    string? carrier?;
    # The three-letter IATA airport code that the flight departed from.
    string? departure_airport_code?;
    # The flight number.
    string? flight_number?;
    # The flight's service class.
    string? service_class?;
    # Whether a stopover is allowed on this flight.
    boolean? stopover_allowed?;
};

# 
public type Payment_flows_private_payment_methods_alipay record {
};

# 
public type Issuing_authorization_pending_request record {
    # The additional amount Stripe will hold if the authorization is approved, in the card's [currency](https://stripe.com/docs/api#issuing_authorization_object-pending-request-currency) and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    Issuing_authorization_amount_details? amount_details?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # If set `true`, you may provide [amount](https://stripe.com/docs/api/issuing/authorizations/approve#approve_issuing_authorization-amount) to control how much to hold for the authorization.
    boolean is_amount_controllable;
    # The amount the merchant is requesting to be authorized in the `merchant_currency`. The amount is in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int merchant_amount;
    # The local currency the merchant is requesting to authorize.
    string merchant_currency;
};

# 
public type Payment_intent_next_action_alipay_handle_redirect record {
    # The native data to be used with Alipay SDK you must redirect your customer to in order to authenticate the payment in an Android App.
    string? native_data?;
    # The native URL you must redirect your customer to in order to authenticate the payment in an iOS App.
    string? native_url?;
    # If the customer does not exit their browser while authenticating, they will be redirected to this specified URL after completion.
    string? return_url?;
    # The URL you must redirect your customer to in order to authenticate the payment.
    string? url?;
};

# This is an object representing a Stripe account. You can retrieve it to see
# properties on the account like its current e-mail address or if the account is
# enabled yet to make live charges.
# 
# Some properties, marked below, are available only to platforms that want to
# [create and manage Express or Custom accounts](https://stripe.com/docs/connect/accounts).
public type Account record {
    # Business information about the account.
    Account_business_profile? business_profile?;
    # The business type.
    "company"|"government_entity"|"individual"|"non_profit" business_type?;
    # 
    Account_capabilities capabilities?;
    # Whether the account can create live charges.
    boolean charges_enabled?;
    # 
    Legal_entity_company company?;
    # 
    Account_controller controller?;
    # The account's country.
    @constraint:String {maxLength: 5000}
    string country?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created?;
    # Three-letter ISO currency code representing the default currency for the account. This must be a currency that [Stripe supports in the account's country](https://stripe.com/docs/payouts).
    @constraint:String {maxLength: 5000}
    string default_currency?;
    # Whether account details have been submitted. Standard accounts cannot receive payouts before this is true.
    boolean details_submitted?;
    # An email address associated with the account. You can treat this as metadata: it is not used for authentication or messaging account holders.
    string? email?;
    # External accounts (bank accounts and debit cards) currently attached to this account
    ExternalAccountList external_accounts?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # This is an object representing a person associated with a Stripe account.
    # 
    # A platform cannot access a Standard or Express account's persons after the account starts onboarding, such as after generating an account link for the account.
    # See the [Standard onboarding](https://stripe.com/docs/connect/standard-accounts) or [Express onboarding documentation](https://stripe.com/docs/connect/express-accounts) for information about platform pre-filling and account onboarding steps.
    # 
    # Related guide: [Handling Identity Verification with the API](https://stripe.com/docs/connect/identity-verification-api#person-information).
    Person individual?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "account" 'object;
    # Whether Stripe can send payouts to this account.
    boolean payouts_enabled?;
    # 
    Account_requirements requirements?;
    # Options for customizing how the account functions within Stripe.
    Account_settings? settings?;
    # 
    Account_tos_acceptance tos_acceptance?;
    # The Stripe account type. Can be `standard`, `express`, or `custom`.
    "custom"|"express"|"standard" 'type?;
};

# 
public type Payment_flows_private_payment_methods_alipay_details record {
    # Uniquely identifies this particular Alipay account. You can use this attribute to check whether two Alipay accounts are the same.
    string? fingerprint?;
    # Transaction ID of this particular Alipay transaction.
    string? transaction_id?;
};

# 
public type Payment_method_options_wechat_pay record {
    # The app ID registered with WeChat Pay. Only required when client is ios or android.
    string? app_id?;
    # The client type that the end customer will pay from
    "android"|"ios"|"web" 'client?;
};

# 
public type Setup_intent_payment_method_options_acss_debit record {
    # Currency supported by the bank account
    "cad"|"usd" currency?;
    # 
    Setup_intent_payment_method_options_mandate_options_acss_debit mandate_options?;
    # Bank account verification method.
    "automatic"|"instant"|"microdeposits" verification_method?;
};

# Object representing the subscription schedule’s default settings
public type Subscription_schedules_resource_default_settings record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
    decimal? application_fee_percent?;
    # 
    Subscription_schedules_resource_default_settings_automatic_tax automatic_tax?;
    # Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
    "automatic"|"phase_start" billing_cycle_anchor;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
    Subscription_billing_thresholds? billing_thresholds?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
    "charge_automatically"|"send_invoice" collection_method?;
    # ID of the default payment method for the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
    string|Payment_method? default_payment_method?;
    # The subscription schedule's default invoice settings.
    Invoice_setting_subscription_schedule_setting? invoice_settings?;
    # The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
    Subscription_transfer_data? transfer_data?;
};

# Invoices are statements of amounts owed by a customer, and are either
# generated one-off, or generated periodically from a subscription.
# 
# They contain [invoice items](https://stripe.com/docs/api#invoiceitems), and proration adjustments
# that may be caused by subscription upgrades/downgrades (if necessary).
# 
# If your invoice is configured to be billed through automatic charges,
# Stripe automatically finalizes your invoice and attempts payment. Note
# that finalizing the invoice,
# [when automatic](https://stripe.com/docs/billing/invoices/workflow/#auto_advance), does
# not happen immediately as the invoice is created. Stripe waits
# until one hour after the last webhook was successfully sent (or the last
# webhook timed out after failing). If you (and the platforms you may have
# connected to) have no webhooks configured, Stripe waits one hour after
# creation to finalize the invoice.
# 
# If your invoice is configured to be billed by sending an email, then based on your
# [email settings](https://dashboard.stripe.com/account/billing/automatic),
# Stripe will email the invoice to your customer and await payment. These
# emails can contain a link to a hosted page to pay the invoice.
# 
# Stripe applies any customer credit on the account before determining the
# amount due for the invoice (i.e., the amount that will be actually
# charged). If the amount due for the invoice is less than Stripe's [minimum allowed charge
# per currency](/docs/currencies#minimum-and-maximum-charge-amounts), the
# invoice is automatically marked paid, and we add the amount due to the
# customer's credit balance which is applied to the next invoice.
# 
# More details on the customer's credit balance are
# [here](https://stripe.com/docs/billing/customer/balance).
# 
# Related guide: [Send Invoices to Customers](https://stripe.com/docs/billing/invoices/sending).
public type Invoice record {
    # The country of the business associated with this invoice, most often the business creating the invoice.
    string? account_country?;
    # The public name of the business associated with this invoice, most often the business creating the invoice.
    string? account_name?;
    # The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
    (string|Tax_id|Deleted_tax_id)[]? account_tax_ids?;
    # Final amount due at this time for this invoice. If the invoice's total is smaller than the minimum charge amount, for example, or if there is account credit that can be applied to the invoice, the `amount_due` may be 0. If there is a positive `starting_balance` for the invoice (the customer owes money), the `amount_due` will also take that into account. The charge that gets generated for the invoice will be for the amount specified in `amount_due`.
    int amount_due;
    # The amount, in %s, that was paid.
    int amount_paid;
    # The amount remaining, in %s, that is due.
    int amount_remaining;
    # The fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account when the invoice is paid.
    int? application_fee_amount?;
    # Number of payment attempts made for this invoice, from the perspective of the payment retry schedule. Any payment attempt counts as the first attempt, and subsequently only automatic retries increment the attempt count. In other words, manual payment attempts after the first attempt do not affect the retry schedule.
    int attempt_count;
    # Whether an attempt has been made to pay the invoice. An invoice is not attempted until 1 hour after the `invoice.created` webhook, for example, so you might not want to display that invoice as unpaid to your users.
    boolean attempted;
    # Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
    boolean auto_advance?;
    # 
    Automatic_tax automatic_tax;
    # Indicates the reason why the invoice was created. `subscription_cycle` indicates an invoice created by a subscription advancing into a new period. `subscription_create` indicates an invoice created due to creating a subscription. `subscription_update` indicates an invoice created due to updating a subscription. `subscription` is set for all old invoices to indicate either a change to a subscription or a period advancement. `manual` is set for all invoices unrelated to a subscription (for example: created via the invoice editor). The `upcoming` value is reserved for simulated invoices per the upcoming invoice endpoint. `subscription_threshold` indicates an invoice created due to a billing threshold being reached.
    "automatic_pending_invoice_item_invoice"|"manual"|"quote_accept"|"subscription"|"subscription_create"|"subscription_cycle"|"subscription_threshold"|"subscription_update"|"upcoming" billing_reason?;
    # ID of the latest charge generated for this invoice, if any.
    string|Charge? charge?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions.
    "charge_automatically"|"send_invoice" collection_method;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Custom fields displayed on the invoice.
    Invoice_setting_custom_field[]? custom_fields?;
    # The ID of the customer who will be billed.
    string|Customer|Deleted_customer? customer?;
    # The customer's address. Until the invoice is finalized, this field will equal `customer.address`. Once the invoice is finalized, this field will no longer be updated.
    Address? customer_address?;
    # The customer's email. Until the invoice is finalized, this field will equal `customer.email`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_email?;
    # The customer's name. Until the invoice is finalized, this field will equal `customer.name`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_name?;
    # The customer's phone number. Until the invoice is finalized, this field will equal `customer.phone`. Once the invoice is finalized, this field will no longer be updated.
    string? customer_phone?;
    # The customer's shipping information. Until the invoice is finalized, this field will equal `customer.shipping`. Once the invoice is finalized, this field will no longer be updated.
    Shipping? customer_shipping?;
    # The customer's tax exempt status. Until the invoice is finalized, this field will equal `customer.tax_exempt`. Once the invoice is finalized, this field will no longer be updated.
    "exempt"|"none"|"reverse" customer_tax_exempt?;
    # The customer's tax IDs. Until the invoice is finalized, this field will contain the same tax IDs as `customer.tax_ids`. Once the invoice is finalized, this field will no longer be updated.
    Invoices_resource_invoice_tax_id[]? customer_tax_ids?;
    # ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
    string|Payment_method? default_payment_method?;
    # ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
    string|Alipay_account|Bank_account|Bitcoin_receiver|Card|Source? default_source?;
    # The tax rates applied to this invoice, if any.
    Tax_rate[] default_tax_rates;
    # An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
    string? description?;
    # Describes the current discount applied to this invoice, if there is one. Not populated if there are multiple discounts.
    Discount? discount?;
    # The discounts applied to the invoice. Line item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
    (string|Discount|Deleted_discount)[]? discounts?;
    # The date on which payment for this invoice is due. This value will be `null` for invoices where `collection_method=charge_automatically`.
    int? due_date?;
    # Ending customer balance after the invoice is finalized. Invoices are finalized approximately an hour after successful webhook delivery or when payment collection is attempted for the invoice. If the invoice has not been finalized yet, this will be null.
    int? ending_balance?;
    # Footer displayed on the invoice.
    string? footer?;
    # The URL for the hosted invoice page, which allows customers to view and pay an invoice. If the invoice has not been finalized yet, this will be null.
    string? hosted_invoice_url?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id?;
    # The link to download the PDF for the invoice. If the invoice has not been finalized yet, this will be null.
    string? invoice_pdf?;
    # The error encountered during the previous attempt to finalize the invoice. This field is cleared when the invoice is successfully finalized.
    Api_errors? last_finalization_error?;
    # The individual line items that make up the invoice. `lines` is sorted as follows: invoice items in reverse chronological order, followed by the subscription, if any.
    InvoiceLinesList_1 lines;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # The time at which payment will next be attempted. This value will be `null` for invoices where `collection_method=send_invoice`.
    int? next_payment_attempt?;
    # A unique, identifying string that appears on emails sent to the customer for this invoice. This starts with the customer's unique invoice_prefix if it is specified.
    string? number?;
    # String representing the object's type. Objects of the same type share the same value.
    "invoice" 'object;
    # The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.
    string|Account? on_behalf_of?;
    # Whether payment was successfully collected for this invoice. An invoice can be paid (most commonly) with a charge or with credit from the customer's account balance.
    boolean paid;
    # The PaymentIntent associated with this invoice. The PaymentIntent is generated when the invoice is finalized, and can then be used to pay the invoice. Note that voiding an invoice will cancel the PaymentIntent.
    string|Payment_intent? payment_intent?;
    # 
    Invoices_payment_settings payment_settings;
    # End of the usage period during which invoice items were added to this invoice.
    int period_end;
    # Start of the usage period during which invoice items were added to this invoice.
    int period_start;
    # Total amount of all post-payment credit notes issued for this invoice.
    int post_payment_credit_notes_amount;
    # Total amount of all pre-payment credit notes issued for this invoice.
    int pre_payment_credit_notes_amount;
    # The quote this invoice was generated from.
    string|Quote? quote?;
    # This is the transaction number that appears on email receipts sent for this invoice.
    string? receipt_number?;
    # Starting customer balance before the invoice is finalized. If the invoice has not been finalized yet, this will be the current customer balance.
    int starting_balance;
    # Extra information about an invoice for the customer's credit card statement.
    string? statement_descriptor?;
    # The status of the invoice, one of `draft`, `open`, `paid`, `uncollectible`, or `void`. [Learn more](https://stripe.com/docs/billing/invoices/workflow#workflow-overview)
    "deleted"|"draft"|"open"|"paid"|"uncollectible"|"void" status?;
    # 
    Invoices_status_transitions status_transitions;
    # The subscription that this invoice was prepared for, if any.
    string|Subscription? subscription?;
    # Only set for upcoming invoices that preview prorations. The time used to calculate prorations.
    int subscription_proration_date?;
    # Total of all subscriptions, invoice items, and prorations on the invoice before any invoice level discount or tax is applied. Item discounts are already incorporated
    int subtotal;
    # The amount of tax on this invoice. This is the sum of all the tax amounts on this invoice.
    int? tax?;
    # 
    Invoice_threshold_reason threshold_reason?;
    # Total after discounts and taxes.
    int total;
    # The aggregate amounts calculated per discount across all line items.
    Discounts_resource_discount_amount[]? total_discount_amounts?;
    # The aggregate amounts calculated per tax rate for all line items.
    Invoice_tax_amount[] total_tax_amounts;
    # The account (if any) the payment will be attributed to for tax reporting, and where funds from the payment will be transferred to for the invoice.
    Invoice_transfer_data? transfer_data?;
    # Invoices are automatically paid or sent 1 hour after webhooks are delivered, or until all webhook delivery attempts have [been exhausted](https://stripe.com/docs/billing/webhooks#understand). This field tracks the time when webhooks for this invoice were successfully delivered. If the invoice had no webhooks to deliver, this will be set while the invoice is being created.
    int? webhooks_delivered_at?;
};

# 
public type Deleted_invoice record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "invoice" 'object;
};

# If this is a `p24` PaymentMethod, this hash contains details about the P24 payment method.
public type Param_6 record {
    "alior_bank"|"bank_millennium"|"bank_nowy_bfg_sa"|"bank_pekao_sa"|"banki_spbdzielcze"|"blik"|"bnp_paribas"|"boz"|"citi_handlowy"|"credit_agricole"|"envelobank"|"etransfer_pocztowy24"|"getin_bank"|"ideabank"|"ing"|"inteligo"|"mbank_mtransfer"|"nest_przelew"|"noble_pay"|"pbac_z_ipko"|"plus_bank"|"santander_przelew24"|"tmobile_usbugi_bankowe"|"toyota_bank"|"volkswagen_bank" bank?;
};

# If this is a `sepa_debit` PaymentMethod, this hash contains details about the SEPA debit bank account.
public type Param_7 record {
    @constraint:String {maxLength: 5000}
    string iban;
};

public type Discounts Discounts_data_param|"";

# If this is a `sofort` PaymentMethod, this hash contains details about the SOFORT payment method.
public type Param_8 record {
    "AT"|"BE"|"DE"|"ES"|"IT"|"NL" country;
};

# 
public type Issuing_dispute_not_received_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Date when the cardholder expected to receive the product.
    int? expected_at?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Description of the merchandise or service that was purchased.
    string? product_description?;
    # Whether the product was a merchandise or service.
    "merchandise"|"service" product_type?;
};

public type V1_customers_body record {|
    # The customer's address.
    Customer_adresss|string address?;
    # An integer amount in %s that represents the customer's current balance, which affect the customer's future invoices. A negative amount represents a credit that decreases the amount due on an invoice; a positive amount increases the amount due on an invoice.
    int balance?;
    @constraint:String {maxLength: 5000}
    string coupon?;
    # An arbitrary string that you can attach to a customer object. It is displayed alongside the customer in the dashboard.
    @constraint:String {maxLength: 5000}
    string description?;
    # Customer's email address. It's displayed alongside the customer in your dashboard and can be useful for searching and tracking. This may be up to *512 characters*.
    @constraint:String {maxLength: 512}
    string email?;
    # Specifies which fields in the response should be expanded.
    V1_customers_bodyExpandItemsString[] expand?;
    # The prefix for the customer used to generate unique invoice numbers. Must be 3–12 uppercase letters or numbers.
    @constraint:String {maxLength: 5000}
    string invoice_prefix?;
    # Default invoice settings for this customer.
    Customer_param invoice_settings?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    Additional_properties|"" metadata?;
    # The customer's full name or business name.
    @constraint:String {maxLength: 256}
    string name?;
    # The sequence to be used on the customer's next invoice. Defaults to 1.
    int next_invoice_sequence?;
    @constraint:String {maxLength: 5000}
    string payment_method?;
    # The customer's phone number.
    @constraint:String {maxLength: 20}
    string phone?;
    # Customer's preferred languages, ordered by preference.
    V1_customers_bodyPreferredlocalesItemsString[] preferred_locales?;
    # The API ID of a promotion code to apply to the customer. The customer will have a discount applied on all recurring payments. Charges you create through the API will not have the discount.
    @constraint:String {maxLength: 5000}
    string promotion_code?;
    # The customer's shipping information. Appears on invoices emailed to this customer.
    Customer_address_with_name|string shipping?;
    @constraint:String {maxLength: 5000}
    string 'source?;
    # Tax details about the customer.
    Tax_param tax?;
    # The customer's tax exemption. One of `none`, `exempt`, or `reverse`.
    ""|"exempt"|"none"|"reverse" tax_exempt?;
    # The customer's tax IDs.
    Data_params[] tax_id_data?;
|};

# If this is a `boleto` PaymentMethod, this hash contains details about the Boleto payment method.
public type Param_2 record {
    @constraint:String {maxLength: 5000}
    string tax_id;
};

# If this is an `eps` PaymentMethod, this hash contains details about the EPS payment method.
public type Param_3 record {
    "arzte_und_apotheker_bank"|"austrian_anadi_bank_ag"|"bank_austria"|"bankhaus_carl_spangler"|"bankhaus_schelhammer_und_schattera_ag"|"bawag_psk_ag"|"bks_bank_ag"|"brull_kallmus_bank_ag"|"btv_vier_lander_bank"|"capital_bank_grawe_gruppe_ag"|"dolomitenbank"|"easybank_ag"|"erste_bank_und_sparkassen"|"hypo_alpeadriabank_international_ag"|"hypo_bank_burgenland_aktiengesellschaft"|"hypo_noe_lb_fur_niederosterreich_u_wien"|"hypo_oberosterreich_salzburg_steiermark"|"hypo_tirol_bank_ag"|"hypo_vorarlberg_bank_ag"|"marchfelder_bank"|"oberbank_ag"|"raiffeisen_bankengruppe_osterreich"|"schoellerbank_ag"|"sparda_bank_wien"|"volksbank_gruppe"|"volkskreditbank_ag"|"vr_bank_braunau" bank?;
};

# 
public type Issuing_transaction_lodging_data record {
    # The time of checking into the lodging.
    int? check_in_at?;
    # The number of nights stayed at the lodging.
    int? nights?;
};

# If this is an `fpx` PaymentMethod, this hash contains details about the FPX payment method.
public type Param_4 record {
    "affin_bank"|"alliance_bank"|"ambank"|"bank_islam"|"bank_muamalat"|"bank_rakyat"|"bsn"|"cimb"|"deutsche_bank"|"hong_leong_bank"|"hsbc"|"kfh"|"maybank2e"|"maybank2u"|"ocbc"|"pb_enterprise"|"public_bank"|"rhb"|"standard_chartered"|"uob" bank;
};

# If this is an `ideal` PaymentMethod, this hash contains details about the iDEAL payment method.
public type Param_5 record {
    "abn_amro"|"asn_bank"|"bunq"|"handelsbanken"|"ing"|"knab"|"moneyou"|"rabobank"|"regiobank"|"revolut"|"sns_bank"|"triodos_bank"|"van_lanschot" bank?;
};

# A line item.
public type Item record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes.
    int amount_total;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.
    @constraint:String {maxLength: 5000}
    string description;
    # The discounts applied to the line item.
    Line_items_discount_amount[] discounts?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "item" 'object;
    # The price used to generate the line item.
    Price? price?;
    # The quantity of products being purchased.
    int? quantity?;
    # The taxes applied to the line item.
    Line_items_tax_amount[] taxes?;
};

# 
public type Payment_method_details_card_wallet_apple_pay record {
};

# 
public type Subscription_item_billing_thresholds record {
    # Usage threshold that triggers the subscription to create an invoice
    int? usage_gte?;
};

# 
public type Payment_method_details_card_wallet_samsung_pay record {
};

# 
public type Payment_method_card_wallet_masterpass record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# 
public type Balance_detail record {
    # Funds that are available for use.
    Balance_amount[] available;
};

# The Report Type resource corresponds to a particular type of report, such as
# the "Activity summary" or "Itemized payouts" reports. These objects are
# identified by an ID belonging to a set of enumerated values. See
# [API Access to Reports documentation](https://stripe.com/docs/reporting/statements/api)
# for those Report Type IDs, along with required and optional parameters.
# 
# Note that certain report types can only be run based on your live-mode data (not test-mode
# data), and will error when queried without a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
public type ReportingReport_type record {
    # Most recent time for which this Report Type is available. Measured in seconds since the Unix epoch.
    int data_available_end;
    # Earliest time for which this Report Type is available. Measured in seconds since the Unix epoch.
    int data_available_start;
    # List of column names that are included by default when this Report Type gets run. (If the Report Type doesn't support the `columns` parameter, this will be null.)
    Reportingreport_typeDefaultcolumnsItemsString[]? default_columns?;
    # The [ID of the Report Type](https://stripe.com/docs/reporting/statements/api#available-report-types), such as `balance.summary.1`.
    @constraint:String {maxLength: 5000}
    string id;
    # Human-readable name of the Report Type
    @constraint:String {maxLength: 5000}
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    "reporting.report_type" 'object;
    # When this Report Type was latest updated. Measured in seconds since the Unix epoch.
    int updated;
    # Version of the Report Type. Different versions report with the same ID will have the same purpose, but may take different run parameters or have different result schemas.
    int version;
};

# Subscriptions allow you to charge a customer on a recurring basis.
# 
# Related guide: [Creating Subscriptions](https://stripe.com/docs/billing/subscriptions/creating).
public type Subscription record {
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account.
    decimal? application_fee_percent?;
    # 
    Subscription_automatic_tax automatic_tax;
    # Determines the date of the first full invoice, and, for plans with `month` or `year` intervals, the day of the month for subsequent invoices.
    int billing_cycle_anchor;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
    Subscription_billing_thresholds? billing_thresholds?;
    # A date in the future at which the subscription will automatically get canceled
    int? cancel_at?;
    # If the subscription has been canceled with the `at_period_end` flag set to `true`, `cancel_at_period_end` on the subscription will be true. You can use this attribute to determine whether a subscription that has a status of active is scheduled to be canceled at the end of the current period.
    boolean cancel_at_period_end;
    # If the subscription has been canceled, the date of that cancellation. If the subscription was canceled with `cancel_at_period_end`, `canceled_at` will reflect the time of the most recent update request, not the end of the subscription period when the subscription is automatically moved to a canceled state.
    int? canceled_at?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this subscription at the end of the cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
    "charge_automatically"|"send_invoice" collection_method;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # End of the current period that the subscription has been invoiced for. At the end of this period, a new invoice will be created.
    int current_period_end;
    # Start of the current period that the subscription has been invoiced for.
    int current_period_start;
    # ID of the customer who owns the subscription.
    string|Customer|Deleted_customer customer;
    # Number of days a customer has to pay invoices generated by this subscription. This value will be `null` for subscriptions where `collection_method=charge_automatically`.
    int? days_until_due?;
    # ID of the default payment method for the subscription. It must belong to the customer associated with the subscription. This takes precedence over `default_source`. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string|Payment_method? default_payment_method?;
    # ID of the default payment source for the subscription. It must belong to the customer associated with the subscription and be in a chargeable state. If `default_payment_method` is also set, `default_payment_method` will take precedence. If neither are set, invoices will use the customer's [invoice_settings.default_payment_method](https://stripe.com/docs/api/customers/object#customer_object-invoice_settings-default_payment_method) or [default_source](https://stripe.com/docs/api/customers/object#customer_object-default_source).
    string|Alipay_account|Bank_account|Bitcoin_receiver|Card|Source? default_source?;
    # The tax rates that will apply to any subscription item that does not have `tax_rates` set. Invoices created will have their `default_tax_rates` populated from the subscription.
    Tax_rate[]? default_tax_rates?;
    # Describes the current discount applied to this subscription, if there is one. When billing, a discount applied to a subscription overrides a discount applied on a customer-wide basis.
    Discount? discount?;
    # If the subscription has ended, the date the subscription ended.
    int? ended_at?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # List of subscription items, each with an attached price.
    SubscriptionItemList items;
    # The most recent invoice this subscription has generated.
    string|Invoice? latest_invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # Specifies the approximate timestamp on which any pending invoice items will be billed according to the schedule provided at `pending_invoice_item_interval`.
    int? next_pending_invoice_item_invoice?;
    # String representing the object's type. Objects of the same type share the same value.
    "subscription" 'object;
    # If specified, payment collection for this subscription will be paused.
    Subscriptions_resource_pause_collection? pause_collection?;
    # Payment settings passed on to invoices created by the subscription.
    Subscriptions_resource_payment_settings? payment_settings?;
    # Specifies an interval for how often to bill for any pending invoice items. It is analogous to calling [Create an invoice](https://stripe.com/docs/api#create_invoice) for the given subscription at the specified interval.
    Subscription_pending_invoice_item_interval? pending_invoice_item_interval?;
    # You can use this [SetupIntent](https://stripe.com/docs/api/setup_intents) to collect user authentication when creating a subscription without immediate payment or updating a subscription's payment method, allowing you to optimize for off-session payments. Learn more in the [SCA Migration Guide](https://stripe.com/docs/billing/migration/strong-customer-authentication#scenario-2).
    string|Setup_intent? pending_setup_intent?;
    # If specified, [pending updates](https://stripe.com/docs/billing/subscriptions/pending-updates) that will be applied to the subscription once the `latest_invoice` has been paid.
    Subscriptions_resource_pending_update? pending_update?;
    # The schedule attached to the subscription
    string|Subscription_schedule? schedule?;
    # Date when the subscription was first created. The date might differ from the `created` date due to backdating.
    int start_date;
    # Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, or `unpaid`. 
    # 
    # For `collection_method=charge_automatically` a subscription moves into `incomplete` if the initial payment attempt fails. A subscription in this state can only have metadata and default_source updated. Once the first invoice is paid, the subscription moves into an `active` state. If the first invoice is not paid within 23 hours, the subscription transitions to `incomplete_expired`. This is a terminal state, the open invoice will be voided and no further invoices will be generated. 
    # 
    # A subscription that is currently in a trial period is `trialing` and moves to `active` when the trial period is over. 
    # 
    # If subscription `collection_method=charge_automatically` it becomes `past_due` when payment to renew it fails and `canceled` or `unpaid` (depending on your subscriptions settings) when Stripe has exhausted all payment retry attempts. 
    # 
    # If subscription `collection_method=send_invoice` it becomes `past_due` when its invoice is not paid by the due date, and `canceled` or `unpaid` if it is still not paid by an additional deadline after that. Note that when a subscription has a status of `unpaid`, no subsequent invoices will be attempted (invoices will be created, but then immediately automatically closed). After receiving updated payment information from a customer, you may choose to reopen and pay their closed invoices.
    "active"|"canceled"|"incomplete"|"incomplete_expired"|"past_due"|"trialing"|"unpaid" status;
    # The account (if any) the subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
    Subscription_transfer_data? transfer_data?;
    # If the subscription has a trial, the end of that trial.
    int? trial_end?;
    # If the subscription has a trial, the beginning of that trial.
    int? trial_start?;
};

# 
public type Deleted_price record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "price" 'object;
};

# 
public type Deleted_sku record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "sku" 'object;
};

# A phase item describes the price and quantity of a phase.
public type Subscription_schedule_configuration_item record {
    # Define thresholds at which an invoice will be sent, and the related subscription advanced to a new billing period
    Subscription_item_billing_thresholds? billing_thresholds?;
    # ID of the price to which the customer should be subscribed.
    string|Price|Deleted_price price;
    # Quantity of the plan to which the customer should be subscribed.
    int quantity?;
    # The tax rates which apply to this `phase_item`. When set, the `default_tax_rates` on the phase do not apply to this `phase_item`.
    Tax_rate[]? tax_rates?;
};

public type Schedule_release_body record {|
    # Specifies which fields in the response should be expanded.
    Schedule_release_bodyExpandItemsString[] expand?;
    # Keep any cancellation on the subscription that the schedule has set
    boolean preserve_cancel_date?;
|};

# 
public type Gelato_report_document_options record {
    # Array of strings of allowed identity document types. If the provided identity document isn’t one of the allowed types, the verification check will fail with a document_type_not_allowed error code.
    ("driving_license"|"id_card"|"passport")[] allowed_types?;
    # Collect an ID number and perform an [ID number check](https://stripe.com/docs/identity/verification-checks?type=id-number) with the document’s extracted name and date of birth.
    boolean require_id_number?;
    # Disable image uploads, identity document images have to be captured using the device’s camera.
    boolean require_live_capture?;
    # Capture a face image and perform a [selfie check](https://stripe.com/docs/identity/verification-checks?type=selfie) comparing a photo ID and a picture of your user’s face. [Learn more](https://stripe.com/docs/identity/selfie).
    boolean require_matching_selfie?;
};

# 
public type Source_transaction_chf_credit_transfer_data record {
    # Reference associated with the transfer.
    @constraint:String {maxLength: 5000}
    string reference?;
    # Sender's country address.
    @constraint:String {maxLength: 5000}
    string sender_address_country?;
    # Sender's line 1 address.
    @constraint:String {maxLength: 5000}
    string sender_address_line1?;
    # Sender's bank account IBAN.
    @constraint:String {maxLength: 5000}
    string sender_iban?;
    # Sender's name.
    @constraint:String {maxLength: 5000}
    string sender_name?;
};

# 
public type Payment_method_boleto record {
    # Uniquely identifies the customer tax id (CNPJ or CPF)
    @constraint:String {maxLength: 5000}
    string tax_id;
};

# 
public type Payment_method_p24 record {
    # The customer's bank, if provided.
    "alior_bank"|"bank_millennium"|"bank_nowy_bfg_sa"|"bank_pekao_sa"|"banki_spbdzielcze"|"blik"|"bnp_paribas"|"boz"|"citi_handlowy"|"credit_agricole"|"envelobank"|"etransfer_pocztowy24"|"getin_bank"|"ideabank"|"ing"|"inteligo"|"mbank_mtransfer"|"nest_przelew"|"noble_pay"|"pbac_z_ipko"|"plus_bank"|"santander_przelew24"|"tmobile_usbugi_bankowe"|"toyota_bank"|"volkswagen_bank" bank?;
};

# 
public type Payment_intent_payment_method_options_mandate_options_sepa_debit record {
};

# 
public type Quotes_resource_transfer_data record {
    # The amount in %s that will be transferred to the destination account when the invoice is paid. By default, the entire amount is transferred to the destination.
    int? amount?;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the destination account. By default, the entire amount will be transferred to the destination.
    decimal? amount_percent?;
    # The account where funds from the payment will be transferred to upon payment success.
    string|Account destination;
};

# You can configure [webhook endpoints](https://stripe.com/docs/webhooks/) via the API to be
# notified about events that happen in your Stripe account or connected
# accounts.
# 
# Most users configure webhooks from [the dashboard](https://dashboard.stripe.com/webhooks), which provides a user interface for registering and testing your webhook endpoints.
# 
# Related guide: [Setting up Webhooks](https://stripe.com/docs/webhooks/configure).
public type Webhook_endpoint record {
    # The API version events are rendered as for this webhook endpoint.
    string? api_version?;
    # The ID of the associated Connect application.
    string? application?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # An optional description of what the webhook is used for.
    string? description?;
    # The list of events to enable for this endpoint. `['*']` indicates that all events are enabled, except those that require explicit selection.
    Webhook_endpointEnabledeventsItemsString[] enabled_events;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "webhook_endpoint" 'object;
    # The endpoint's secret, used to generate [webhook signatures](https://stripe.com/docs/webhooks/signatures). Only returned at creation.
    @constraint:String {maxLength: 5000}
    string secret?;
    # The status of the webhook. It can be `enabled` or `disabled`.
    @constraint:String {maxLength: 5000}
    string status;
    # The URL of the webhook endpoint.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type InvoiceLinesList record {
    # Details about each object.
    Line_item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# You can store multiple cards on a customer in order to charge the customer
# later. You can also store multiple debit cards on a recipient in order to
# transfer to those cards later.
# 
# Related guide: [Card Payments with Sources](https://stripe.com/docs/sources/cards).
public type Card record {
    # The account this card belongs to. This attribute will not be in the card object if the card belongs to a customer or recipient instead.
    string|Account? account?;
    # City/District/Suburb/Town/Village.
    string? address_city?;
    # Billing address country, if provided when creating card.
    string? address_country?;
    # Address line 1 (Street address/PO Box/Company name).
    string? address_line1?;
    # If `address_line1` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_line1_check?;
    # Address line 2 (Apartment/Suite/Unit/Building).
    string? address_line2?;
    # State/County/Province/Region.
    string? address_state?;
    # ZIP or postal code.
    string? address_zip?;
    # If `address_zip` was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_zip_check?;
    # A set of available payout methods for this card. Only values from this set should be passed as the `method` when creating a payout.
    ("instant"|"standard")[]? available_payout_methods?;
    # Card brand. Can be `American Express`, `Diners Club`, `Discover`, `JCB`, `MasterCard`, `UnionPay`, `Visa`, or `Unknown`.
    @constraint:String {maxLength: 5000}
    string brand;
    # Two-letter ISO code representing the country of the card. You could use this attribute to get a sense of the international breakdown of cards you've collected.
    string? country?;
    # Three-letter [ISO code for currency](https://stripe.com/docs/payouts). Only applicable on accounts (not customers or recipients). The card can be used as a transfer destination for funds in this currency.
    string? currency?;
    # The customer that this card belongs to. This attribute will not be in the card object if the card belongs to an account or recipient instead.
    string|Customer|Deleted_customer? customer?;
    # If a CVC was provided, results of the check: `pass`, `fail`, `unavailable`, or `unchecked`. A result of unchecked indicates that CVC was provided but hasn't been checked yet. Checks are typically performed when attaching a card to a Customer object, or when creating a charge. For more details, see [Check if a card is valid without a charge](https://support.stripe.com/questions/check-if-a-card-is-valid-without-a-charge).
    string? cvc_check?;
    # Whether this card is the default external account for its currency.
    boolean? default_for_currency?;
    # (For tokenized numbers only.) The last four digits of the device account number.
    string? dynamic_last4?;
    # Two-digit number representing the card's expiration month.
    int exp_month;
    # Four-digit number representing the card's expiration year.
    int exp_year;
    # Uniquely identifies this particular card number. You can use this attribute to check whether two customers who’ve signed up with you are using the same card number, for example. For payment methods that tokenize card information (Apple Pay, Google Pay), the tokenized number might be provided instead of the underlying card number.
    # 
    # *Starting May 1, 2021, card fingerprint in India for Connect will change to allow two fingerprints for the same card --- one for India and one for the rest of the world.*
    string? fingerprint?;
    # Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
    @constraint:String {maxLength: 5000}
    string funding;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The last four digits of the card.
    @constraint:String {maxLength: 5000}
    string last4;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # Cardholder name.
    string? name?;
    # String representing the object's type. Objects of the same type share the same value.
    "card" 'object;
    # The recipient that this card belongs to. This attribute will not be in the card object if the card belongs to a customer or account instead.
    string|Recipient? recipient?;
    # If the card number is tokenized, this is the method that was used. Can be `android_pay` (includes Google Pay), `apple_pay`, `masterpass`, `visa_checkout`, or null.
    string? tokenization_method?;
};

# 
public type Gelato_verification_session_options record {
    # 
    Gelato_session_document_options document?;
    # 
    Gelato_session_id_number_options id_number?;
};

# 
public type Issuing_dispute_merchandise_not_as_described_evidence record {
    # (ID of a [file upload](https://stripe.com/docs/guides/file-upload)) Additional documentation supporting the dispute.
    string|File? additional_documentation?;
    # Explanation of why the cardholder is disputing this transaction.
    string? explanation?;
    # Date when the product was received.
    int? received_at?;
    # Description of the cardholder's attempt to return the product.
    string? return_description?;
    # Result of cardholder's attempt to return the product.
    "merchant_rejected"|"successful" return_status?;
    # Date when the product was returned or attempted to be returned.
    int? returned_at?;
};

# If this is a `bacs_debit` PaymentMethod, this hash contains details about the Bacs Direct Debit bank account.
public type Param_1 record {
    @constraint:String {maxLength: 5000}
    string account_number?;
    @constraint:String {maxLength: 5000}
    string sort_code?;
};

public type Current_period_start Range_query_specs|int;

# 
public type Line_items_discount_amount record {
    # The amount discounted.
    int amount;
    # A discount represents the actual application of a coupon to a particular
    # customer. It contains information about when the discount began and when it
    # will end.
    # 
    # Related guide: [Applying Discounts to Subscriptions](https://stripe.com/docs/billing/subscriptions/discounts).
    Discount discount;
};

# 
public type Payment_intent_next_action_wechat_pay_redirect_to_ios_app record {
    # An universal link that redirect to Wechat Pay APP
    @constraint:String {maxLength: 5000}
    string native_url;
};

public type V1_prices_body record {|
    # Whether the price can be used for new purchases. Defaults to `true`.
    boolean active?;
    # Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `unit_amount` or `unit_amount_decimal`) will be charged per unit in `quantity` (for prices with `usage_type=licensed`), or per unit of total usage (for prices with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
    "per_unit"|"tiered" billing_scheme?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Specifies which fields in the response should be expanded.
    V1_prices_bodyExpandItemsString[] expand?;
    # A lookup key used to retrieve prices dynamically from a static string.
    @constraint:String {maxLength: 5000}
    string lookup_key?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|} metadata?;
    # A brief description of the price, hidden from customers.
    @constraint:String {maxLength: 5000}
    string nickname?;
    # The ID of the product that this price will belong to.
    @constraint:String {maxLength: 5000}
    string product?;
    # These fields can be used to create a new product that this price will belong to.
    Inline_product_params product_data?;
    # The recurring components of a price such as `interval` and `usage_type`.
    Recurring_1 recurring?;
    # Specifies whether the price is considered inclusive of taxes or exclusive of taxes. One of `inclusive`, `exclusive`, or `unspecified`. Once specified as either `inclusive` or `exclusive`, it cannot be changed.
    "exclusive"|"inclusive"|"unspecified" tax_behavior?;
    # Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    Tier[] tiers?;
    # Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price, in `graduated` tiering pricing can successively change as the quantity grows.
    "graduated"|"volume" tiers_mode?;
    # If set to true, will atomically remove the lookup key from the existing price, and assign it to this price.
    boolean transfer_lookup_key?;
    # Apply a transformation to the reported usage or set quantity before computing the billed price. Cannot be combined with `tiers`.
    Transform_usage_param transform_quantity?;
    # A positive integer in %s (or 0 for a free price) representing how much to charge.
    int unit_amount?;
    # Same as `unit_amount`, but accepts a decimal value in %s with at most 12 decimal places. Only one of `unit_amount` and `unit_amount_decimal` can be set.
    string unit_amount_decimal?;
|};

# 
public type Account_dashboard_settings record {
    # The display name for this account. This is used on the Stripe Dashboard to differentiate between accounts.
    string? display_name?;
    # The timezone used in the Stripe Dashboard for this account. A list of possible time zone values is maintained at the [IANA Time Zone Database](http://www.iana.org/time-zones).
    string? timezone?;
};

# 
public type Deleted_account record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "account" 'object;
};

# 
public type Payment_method_sepa_debit record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Branch code of bank associated with the bank account.
    string? branch_code?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Information about the object that generated this PaymentMethod.
    Sepa_debit_generated_from? generated_from?;
    # Last four characters of the IBAN.
    string? last4?;
};

# 
public type Rule record {
    # The action taken on the payment.
    @constraint:String {maxLength: 5000}
    string action;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The predicate to evaluate the payment against.
    @constraint:String {maxLength: 5000}
    string predicate;
};

# If this is an `acss_debit` PaymentMethod, this hash contains details about the ACSS Debit payment method.
public type Payment_method_param record {
    # Customer’s bank account number
    @constraint:String {maxLength: 5000}
    string account_number;
    # Institution number of the customer’s bank
    @constraint:String {maxLength: 5000}
    string institution_number;
    # Transit number of the customer’s bank
    @constraint:String {maxLength: 5000}
    string transit_number;
};

# Automatic tax settings for this subscription.
public type Automatic_tax_config record {
    # Enabled
    boolean enabled;
};

# 
public type Payment_method_details_multibanco record {
    # Entity number associated with this Multibanco payment.
    string? entity?;
    # Reference number associated with this Multibanco payment.
    string? reference?;
};

# 
public type Payment_pages_payment_page_resources_shipping_address_collection record {
    # An array of two-letter ISO country codes representing which countries Checkout should provide as options for
    # shipping locations. Unsupported country codes: `AS, CX, CC, CU, HM, IR, KP, MH, FM, NF, MP, PW, SD, SY, UM, VI`.
    ("AC"|"AD"|"AE"|"AF"|"AG"|"AI"|"AL"|"AM"|"AO"|"AQ"|"AR"|"AT"|"AU"|"AW"|"AX"|"AZ"|"BA"|"BB"|"BD"|"BE"|"BF"|"BG"|"BH"|"BI"|"BJ"|"BL"|"BM"|"BN"|"BO"|"BQ"|"BR"|"BS"|"BT"|"BV"|"BW"|"BY"|"BZ"|"CA"|"CD"|"CF"|"CG"|"CH"|"CI"|"CK"|"CL"|"CM"|"CN"|"CO"|"CR"|"CV"|"CW"|"CY"|"CZ"|"DE"|"DJ"|"DK"|"DM"|"DO"|"DZ"|"EC"|"EE"|"EG"|"EH"|"ER"|"ES"|"ET"|"FI"|"FJ"|"FK"|"FO"|"FR"|"GA"|"GB"|"GD"|"GE"|"GF"|"GG"|"GH"|"GI"|"GL"|"GM"|"GN"|"GP"|"GQ"|"GR"|"GS"|"GT"|"GU"|"GW"|"GY"|"HK"|"HN"|"HR"|"HT"|"HU"|"ID"|"IE"|"IL"|"IM"|"IN"|"IO"|"IQ"|"IS"|"IT"|"JE"|"JM"|"JO"|"JP"|"KE"|"KG"|"KH"|"KI"|"KM"|"KN"|"KR"|"KW"|"KY"|"KZ"|"LA"|"LB"|"LC"|"LI"|"LK"|"LR"|"LS"|"LT"|"LU"|"LV"|"LY"|"MA"|"MC"|"MD"|"ME"|"MF"|"MG"|"MK"|"ML"|"MM"|"MN"|"MO"|"MQ"|"MR"|"MS"|"MT"|"MU"|"MV"|"MW"|"MX"|"MY"|"MZ"|"NA"|"NC"|"NE"|"NG"|"NI"|"NL"|"NO"|"NP"|"NR"|"NU"|"NZ"|"OM"|"PA"|"PE"|"PF"|"PG"|"PH"|"PK"|"PL"|"PM"|"PN"|"PR"|"PS"|"PT"|"PY"|"QA"|"RE"|"RO"|"RS"|"RU"|"RW"|"SA"|"SB"|"SC"|"SE"|"SG"|"SH"|"SI"|"SJ"|"SK"|"SL"|"SM"|"SN"|"SO"|"SR"|"SS"|"ST"|"SV"|"SX"|"SZ"|"TA"|"TC"|"TD"|"TF"|"TG"|"TH"|"TJ"|"TK"|"TL"|"TM"|"TN"|"TO"|"TR"|"TT"|"TV"|"TW"|"TZ"|"UA"|"UG"|"US"|"UY"|"UZ"|"VA"|"VC"|"VE"|"VG"|"VN"|"VU"|"WF"|"WS"|"XK"|"YE"|"YT"|"ZA"|"ZM"|"ZW"|"ZZ")[] allowed_countries;
};

# 
public type Account_controller record {
    # `true` if the Connect application retrieving the resource controls the account and can therefore exercise [platform controls](https://stripe.com/docs/connect/platform-controls-for-standard-accounts). Otherwise, this field is null.
    boolean is_controller?;
    # The controller type. Can be `application`, if a Connect application controls the account, or `account`, if the account controls itself.
    "account"|"application" 'type?;
};

# This resource has been renamed to [Early Fraud
# Warning](#early_fraud_warning_object) and will be removed in a future API
# version.
public type Issuer_fraud_record record {
    # An IFR is actionable if it has not received a dispute and has not been fully refunded. You may wish to proactively refund a charge that receives an IFR, in order to avoid receiving a dispute later.
    boolean actionable;
    # ID of the charge this issuer fraud record is for, optionally expanded.
    string|Charge charge;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The type of fraud labelled by the issuer. One of `card_never_received`, `fraudulent_card_application`, `made_with_counterfeit_card`, `made_with_lost_card`, `made_with_stolen_card`, `misc`, `unauthorized_use_of_card`.
    @constraint:String {maxLength: 5000}
    string fraud_type;
    # If true, the associated charge is subject to [liability shift](https://stripe.com/docs/payments/3d-secure#disputed-payments).
    boolean has_liability_shift;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "issuer_fraud_record" 'object;
    # The timestamp at which the card issuer posted the issuer fraud record.
    int post_date;
};

# 
public type Payment_method_details_ach_debit record {
    # Type of entity that holds the account. This can be either `individual` or `company`.
    "company"|"individual" account_holder_type?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Two-letter ISO code representing the country the bank account is located in.
    string? country?;
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # Routing transit number of the bank account.
    string? routing_number?;
};

# 
public type Usage_record_summary record {
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The invoice in which this usage period has been billed for.
    string? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "usage_record_summary" 'object;
    # 
    Period period;
    # The ID of the subscription item this summary is describing.
    @constraint:String {maxLength: 5000}
    string subscription_item;
    # The total usage within this usage period.
    int total_usage;
};

# 
public type Legal_entity_person_verification record {
    # A document showing address, either a passport, local ID card, or utility bill from a well-known utility company.
    Legal_entity_person_verification_document? additional_document?;
    # A user-displayable string describing the verification state for the person. For example, this may say "Provided identity information could not be verified".
    string? details?;
    # One of `document_address_mismatch`, `document_dob_mismatch`, `document_duplicate_type`, `document_id_number_mismatch`, `document_name_mismatch`, `document_nationality_mismatch`, `failed_keyed_identity`, or `failed_other`. A machine-readable code specifying the verification state for the person.
    string? details_code?;
    # 
    Legal_entity_person_verification_document document?;
    # The state of verification for the person. Possible values are `unverified`, `pending`, or `verified`.
    @constraint:String {maxLength: 5000}
    string status;
};

# 
public type Invoice_setting_customer_setting record {
    # Default custom fields to be displayed on invoices for this customer.
    Invoice_setting_custom_field[]? custom_fields?;
    # ID of a payment method that's attached to the customer, to be used as the customer's default payment method for subscriptions and invoices.
    string|Payment_method? default_payment_method?;
    # Default footer to be displayed on invoices for this customer.
    string? footer?;
};

# 
public type Payment_intent_next_action_wechat_pay_redirect_to_android_app record {
    # app_id is the APP ID registered on WeChat open platform
    @constraint:String {maxLength: 5000}
    string app_id;
    # nonce_str is a random string
    @constraint:String {maxLength: 5000}
    string nonce_str;
    # package is static value
    @constraint:String {maxLength: 5000}
    string package;
    # an unique merchant ID assigned by Wechat Pay
    @constraint:String {maxLength: 5000}
    string partner_id;
    # an unique trading ID assigned by Wechat Pay
    @constraint:String {maxLength: 5000}
    string prepay_id;
    # A signature
    @constraint:String {maxLength: 5000}
    string sign;
    # Specifies the current time in epoch format
    @constraint:String {maxLength: 5000}
    string timestamp;
};

# Payment settings to pass to invoices created by the subscription.
public type Payment_settings_1 record {
    Payment_method_options_1 payment_method_options?;
    Payment_method_types_array|"" payment_method_types?;
};

# Payment settings to pass to invoices created by the subscription.
public type Payment_settings_2 record {
    Payment_method_options payment_method_options?;
    ("ach_credit_transfer"|"ach_debit"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"fpx"|"giropay"|"ideal"|"sepa_debit"|"sofort"|"wechat_pay")[]|"" payment_method_types?;
};

# 
public type Billing_details record {
    # Billing address.
    Address? address?;
    # Email address.
    string? email?;
    # Full name.
    string? name?;
    # Billing phone number (including extension).
    string? phone?;
};

# If this is a `card` PaymentMethod, this hash contains the user's card details.
public type Update_api_param record {
    int exp_month?;
    int exp_year?;
};

# 
public type Checkout_session_payment_method_options record {
    # 
    Checkout_acss_debit_payment_method_options acss_debit?;
    # 
    Payment_method_options_boleto boleto?;
    # 
    Payment_method_options_oxxo oxxo?;
};

# The Report Run object represents an instance of a report type generated with
# specific run parameters. Once the object is created, Stripe begins processing the report.
# When the report has finished running, it will give you a reference to a file
# where you can retrieve your results. For an overview, see
# [API Access to Reports](https://stripe.com/docs/reporting/statements/api).
# 
# Note that certain report types can only be run based on your live-mode data (not test-mode
# data), and will error when queried without a [live-mode API key](https://stripe.com/docs/keys#test-live-modes).
public type ReportingReport_run record {
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # If something should go wrong during the run, a message about the failure (populated when
    #  `status=failed`).
    string? 'error?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # `true` if the report is run on live mode data and `false` if it is run on test mode data.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "reporting.report_run" 'object;
    # 
    Financial_reporting_finance_report_run_run_parameters parameters;
    # The ID of the [report type](https://stripe.com/docs/reports/report-types) to run, such as `"balance.summary.1"`.
    @constraint:String {maxLength: 5000}
    string report_type;
    # The file object representing the result of the report run (populated when
    #  `status=succeeded`).
    File? result?;
    # Status of this report run. This will be `pending` when the run is initially created.
    #  When the run finishes, this will be set to `succeeded` and the `result` field will be populated.
    #  Rarely, we may encounter an error, at which point this will be set to `failed` and the `error` field will be populated.
    @constraint:String {maxLength: 5000}
    string status;
    # Timestamp at which this run successfully finished (populated when
    #  `status=succeeded`). Measured in seconds since the Unix epoch.
    int? succeeded_at?;
};

public type Deleted_external_account Deleted_bank_account|Deleted_card;

# A list with one entry for each time that the customer sent bitcoin to the receiver. Hidden when viewing the receiver with a publishable key.
public type BitcoinTransactionList record {
    # Details about each object.
    Bitcoin_transaction[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

public type Created_1 Range_query_specs|int;

# 
public type Card_generated_from_payment_method_details record {
    # 
    Payment_method_details_card_present card_present?;
    # The type of payment method transaction-specific details from the transaction that generated this `card` payment method. Always `card_present`.
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Fee record {
    # Amount of the fee, in cents.
    int amount;
    # ID of the Connect application that earned the fee.
    string? application?;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Type of the fee, one of: `application_fee`, `stripe_fee` or `tax`.
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Source_order record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The email address of the customer placing the order.
    @constraint:String {maxLength: 5000}
    string email?;
    # List of items constituting the order.
    Source_order_item[]? items?;
    # 
    Shipping shipping?;
};

# You can now model subscriptions more flexibly using the [Prices API](https://stripe.com/docs/api#prices). It replaces the Plans API and is backwards compatible to simplify your migration.
# 
# Plans define the base price, currency, and billing cycle for recurring purchases of products.
# [Products](https://stripe.com/docs/api#products) help you track inventory or provisioning, and plans help you track pricing. Different physical goods or levels of service should be represented by products, and pricing options should be represented by plans. This approach lets you change prices without having to change your provisioning scheme.
# 
# For example, you might have a single "gold" product that has plans for $10/month, $100/year, €9/month, and €90/year.
# 
# Related guides: [Set up a subscription](https://stripe.com/docs/billing/subscriptions/set-up-subscription) and more about [products and prices](https://stripe.com/docs/billing/prices-guide).
public type Plan record {
    # Whether the plan can be used for new purchases.
    boolean active;
    # Specifies a usage aggregation strategy for plans of `usage_type=metered`. Allowed values are `sum` for summing up all usage during a period, `last_during_period` for using the last usage record reported within a period, `last_ever` for using the last usage record ever (across period bounds) or `max` which uses the usage record with the maximum reported usage during a period. Defaults to `sum`.
    "last_during_period"|"last_ever"|"max"|"sum" aggregate_usage?;
    # The unit amount in %s to be charged, represented as a whole integer if possible. Only set if `billing_scheme=per_unit`.
    int? amount?;
    # The unit amount in %s to be charged, represented as a decimal string with at most 12 decimal places. Only set if `billing_scheme=per_unit`.
    string? amount_decimal?;
    # Describes how to compute the price per period. Either `per_unit` or `tiered`. `per_unit` indicates that the fixed amount (specified in `amount`) will be charged per unit in `quantity` (for plans with `usage_type=licensed`), or per unit of total usage (for plans with `usage_type=metered`). `tiered` indicates that the unit pricing will be computed using a tiering strategy as defined using the `tiers` and `tiers_mode` attributes.
    "per_unit"|"tiered" billing_scheme;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
    "day"|"month"|"week"|"year" interval;
    # The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
    int interval_count;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # A brief description of the plan, hidden from customers.
    string? nickname?;
    # String representing the object's type. Objects of the same type share the same value.
    "plan" 'object;
    # The product whose pricing this plan determines.
    string|Product|Deleted_product? product?;
    # Each element represents a pricing tier. This parameter requires `billing_scheme` to be set to `tiered`. See also the documentation for `billing_scheme`.
    Plan_tier[] tiers?;
    # Defines if the tiering price should be `graduated` or `volume` based. In `volume`-based tiering, the maximum quantity within a period determines the per unit price. In `graduated` tiering, pricing can change as the quantity grows.
    "graduated"|"volume" tiers_mode?;
    # Apply a transformation to the reported usage or set quantity before computing the amount billed. Cannot be combined with `tiers`.
    Transform_usage? transform_usage?;
    # Default number of trial days when subscribing a customer to this plan using [`trial_from_plan=true`](https://stripe.com/docs/api#create_subscription-trial_from_plan).
    int? trial_period_days?;
    # Configures how the quantity per period should be determined. Can be either `metered` or `licensed`. `licensed` automatically bills the `quantity` set when adding it to a subscription. `metered` aggregates the total usage based on usage records. Defaults to `licensed`.
    "licensed"|"metered" usage_type;
};

public type Subscription_billing_cycle_anchor "now"|"unchanged"|int;

# 
public type Payment_method_card_wallet_apple_pay record {
};

# 
public type Payment_method_bancontact record {
};

# 
public type Payment_method_options_bancontact record {
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    "de"|"en"|"fr"|"nl" preferred_language;
};

# 
public type Checkout_acss_debit_payment_method_options record {
    # Currency supported by the bank account. Returned when the Session is in `setup` mode.
    "cad"|"usd" currency?;
    # 
    Checkout_acss_debit_mandate_options mandate_options?;
    # Bank account verification method.
    "automatic"|"instant"|"microdeposits" verification_method?;
};

# Value lists allow you to group values together which can then be referenced in rules.
# 
# Related guide: [Default Stripe Lists](https://stripe.com/docs/radar/lists#managing-list-items).
public type RadarValue_list record {
    # The name of the value list for use in rules.
    @constraint:String {maxLength: 5000}
    string alias;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The name or email address of the user who created this value list.
    @constraint:String {maxLength: 5000}
    string created_by;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The type of items in the value list. One of `card_fingerprint`, `card_bin`, `email`, `ip_address`, `country`, `string`, or `case_sensitive_string`.
    "card_bin"|"card_fingerprint"|"case_sensitive_string"|"country"|"email"|"ip_address"|"string" item_type;
    # List of items contained within this value list.
    RadarListListItemList list_items;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # The name of the value list.
    @constraint:String {maxLength: 5000}
    string name;
    # String representing the object's type. Objects of the same type share the same value.
    "radar.value_list" 'object;
};

# 
public type Payment_intent_payment_method_options record {
    # 
    Payment_intent_payment_method_options_acss_debit acss_debit?;
    # 
    Payment_method_options_afterpay_clearpay afterpay_clearpay?;
    # 
    Payment_method_options_alipay alipay?;
    # 
    Payment_method_options_bancontact bancontact?;
    # 
    Payment_method_options_boleto boleto?;
    # 
    Payment_intent_payment_method_options_card card?;
    # 
    Payment_method_options_card_present card_present?;
    # 
    Payment_method_options_ideal ideal?;
    # 
    Payment_method_options_oxxo oxxo?;
    # 
    Payment_method_options_p24 p24?;
    # 
    Payment_intent_payment_method_options_sepa_debit sepa_debit?;
    # 
    Payment_method_options_sofort sofort?;
    # 
    Payment_method_options_wechat_pay wechat_pay?;
};

# An Add Invoice Item describes the prices and quantities that will be added as pending invoice items when entering a phase.
public type Subscription_schedule_add_invoice_item record {
    # ID of the price used to generate the invoice item.
    string|Price|Deleted_price price;
    # The quantity of the invoice item.
    int? quantity?;
    # The tax rates which apply to the item. When set, the `default_tax_rates` do not apply to this item.
    Tax_rate[]? tax_rates?;
};

public type Source_type_multibanco record {
    string? entity?;
    string? reference?;
    string? refund_account_holder_address_city?;
    string? refund_account_holder_address_country?;
    string? refund_account_holder_address_line1?;
    string? refund_account_holder_address_line2?;
    string? refund_account_holder_address_postal_code?;
    string? refund_account_holder_address_state?;
    string? refund_account_holder_name?;
    string? refund_iban?;
};

public type Phase_configuration_params record {
    Add_invoice_item_entry_1[] add_invoice_items?;
    decimal application_fee_percent?;
    Automatic_tax_config_3 automatic_tax?;
    "automatic"|"phase_start" billing_cycle_anchor?;
    record {int amount_gte?; boolean reset_billing_cycle_anchor?;}|"" billing_thresholds?;
    "charge_automatically"|"send_invoice" collection_method?;
    @constraint:String {maxLength: 5000}
    string coupon?;
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    DefaulttaxratesItemsString[]|"" default_tax_rates?;
    int end_date?;
    Subscription_schedules_param_1 invoice_settings?;
    Configuration_item_params[] items;
    int iterations?;
    "always_invoice"|"create_prorations"|"none" proration_behavior?;
    Transfer_data_specs_3 transfer_data?;
    boolean trial?;
    int trial_end?;
};

# A PaymentIntent guides you through the process of collecting a payment from your customer.
# We recommend that you create exactly one PaymentIntent for each order or
# customer session in your system. You can reference the PaymentIntent later to
# see the history of payment attempts for a particular session.
# 
# A PaymentIntent transitions through
# [multiple statuses](https://stripe.com/docs/payments/intents#intent-statuses)
# throughout its lifetime as it interfaces with Stripe.js to perform
# authentication flows and ultimately creates at most one successful charge.
# 
# Related guide: [Payment Intents API](https://stripe.com/docs/payments/payment-intents).
public type Payment_intent record {
    # Amount intended to be collected by this PaymentIntent. A positive integer representing how much to charge in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal) (e.g., 100 cents to charge $1.00 or 100 to charge ¥100, a zero-decimal currency). The minimum amount is $0.50 US or [equivalent in charge currency](https://stripe.com/docs/currencies#minimum-and-maximum-charge-amounts). The amount value supports up to eight digits (e.g., a value of 99999999 for a USD charge of $999,999.99).
    int amount;
    # Amount that can be captured from this PaymentIntent.
    int amount_capturable?;
    # Amount that was collected by this PaymentIntent.
    int amount_received?;
    # ID of the Connect application that created the PaymentIntent.
    string|Application? application?;
    # The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner's Stripe account. The amount of the application fee collected will be capped at the total payment amount. For more information, see the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts).
    int? application_fee_amount?;
    # Populated when `status` is `canceled`, this is the time at which the PaymentIntent was canceled. Measured in seconds since the Unix epoch.
    int? canceled_at?;
    # Reason for cancellation of this PaymentIntent, either user-provided (`duplicate`, `fraudulent`, `requested_by_customer`, or `abandoned`) or generated by Stripe internally (`failed_invoice`, `void_invoice`, or `automatic`).
    "abandoned"|"automatic"|"duplicate"|"failed_invoice"|"fraudulent"|"requested_by_customer"|"void_invoice" cancellation_reason?;
    # Controls when the funds will be captured from the customer's account.
    "automatic"|"manual" capture_method;
    # Charges that were created by this PaymentIntent, if any.
    PaymentFlowsPaymentIntentResourceChargeList charges?;
    # The client secret of this PaymentIntent. Used for client-side retrieval using a publishable key. 
    # 
    # The client secret can be used to complete a payment from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
    # 
    # Refer to our docs to [accept a payment](https://stripe.com/docs/payments/accept-a-payment?integration=elements) and learn about how `client_secret` should be handled.
    string? client_secret?;
    "automatic"|"manual" confirmation_method;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # ID of the Customer this PaymentIntent belongs to, if one exists.
    # 
    # Payment methods attached to other Customers cannot be used with this PaymentIntent.
    # 
    # If present in combination with [setup_future_usage](https://stripe.com/docs/api#payment_intent_object-setup_future_usage), this PaymentIntent's payment method will be attached to the Customer after the PaymentIntent has been confirmed and any required actions from the user are complete.
    string|Customer|Deleted_customer? customer?;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # ID of the invoice that created this PaymentIntent, if it exists.
    string|Invoice? invoice?;
    # The payment error encountered in the previous PaymentIntent confirmation. It will be cleared if the PaymentIntent is later updated for any reason.
    Api_errors? last_payment_error?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. For more information, see the [documentation](https://stripe.com/docs/payments/payment-intents/creating-payment-intents#storing-information-in-metadata).
    record {|string...;|} metadata?;
    # If present, this property tells you what actions you need to take in order for your customer to fulfill a payment using the provided source.
    Payment_intent_next_action? next_action?;
    # String representing the object's type. Objects of the same type share the same value.
    "payment_intent" 'object;
    # The account (if any) for which the funds of the PaymentIntent are intended. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
    string|Account? on_behalf_of?;
    # ID of the payment method used in this PaymentIntent.
    string|Payment_method? payment_method?;
    # Payment-method-specific configuration for this PaymentIntent.
    Payment_intent_payment_method_options? payment_method_options?;
    # The list of payment method types (e.g. card) that this PaymentIntent is allowed to use.
    Payment_intentPaymentmethodtypesItemsString[] payment_method_types;
    # Email address that the receipt for the resulting payment will be sent to. If `receipt_email` is specified for a payment in live mode, a receipt will be sent regardless of your [email settings](https://dashboard.stripe.com/account/emails).
    string? receipt_email?;
    # ID of the review associated with this PaymentIntent, if any.
    string|Review? review?;
    # Indicates that you intend to make future payments with this PaymentIntent's payment method.
    # 
    # Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent's Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
    # 
    # When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
    "off_session"|"on_session" setup_future_usage?;
    # Shipping information for this PaymentIntent.
    Shipping? shipping?;
    # For non-card charges, you can use this value as the complete description that appears on your customers’ statements. Must contain at least one letter, maximum 22 characters.
    string? statement_descriptor?;
    # Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that’s set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
    string? statement_descriptor_suffix?;
    # Status of this PaymentIntent, one of `requires_payment_method`, `requires_confirmation`, `requires_action`, `processing`, `requires_capture`, `canceled`, or `succeeded`. Read more about each PaymentIntent [status](https://stripe.com/docs/payments/intents#intent-statuses).
    "canceled"|"processing"|"requires_action"|"requires_capture"|"requires_confirmation"|"requires_payment_method"|"succeeded" status;
    # The data with which to automatically create a Transfer when the payment is finalized. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
    Transfer_data? transfer_data?;
    # A string that identifies the resulting payment as part of a group. See the PaymentIntents [use case for connected accounts](https://stripe.com/docs/payments/connected-accounts) for details.
    string? transfer_group?;
};

public type Subscription_schedules_schedule_body record {|
    # Object representing the subscription schedule's default settings.
    Default_settings_params_1 default_settings?;
    # Configures how the subscription schedule behaves when it ends. Possible values are `release` or `cancel` with the default being `release`. `release` will end the subscription schedule and keep the underlying subscription running.`cancel` will end the subscription schedule and cancel the underlying subscription.
    "cancel"|"none"|"release"|"renew" end_behavior?;
    # Specifies which fields in the response should be expanded.
    Subscription_schedules_schedule_bodyExpandItemsString[] expand?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
    # List representing phases of the subscription schedule. Each phase can be customized to have different durations, plans, and coupons. If there are multiple phases, the `end_date` of one phase will always equal the `start_date` of the next phase. Note that past phases can be omitted.
    Phase_configuration_params_1[] phases?;
    # If the update changes the current phase, indicates if the changes should be prorated. Possible values are `create_prorations` or `none`, and the default value is `create_prorations`.
    "always_invoice"|"create_prorations"|"none" proration_behavior?;
|};

# 
public type Payment_method_details_card_wallet_masterpass record {
    # Owner's verified billing address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? billing_address?;
    # Owner's verified email. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? email?;
    # Owner's verified full name. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? name?;
    # Owner's verified shipping address. Values are verified or provided by the wallet directly (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    Address? shipping_address?;
};

# 
public type Invoices_status_transitions record {
    # The time that the invoice draft was finalized.
    int? finalized_at?;
    # The time that the invoice was marked uncollectible.
    int? marked_uncollectible_at?;
    # The time that the invoice was paid.
    int? paid_at?;
    # The time that the invoice was voided.
    int? voided_at?;
};

# 
public type Quotes_resource_upfront record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes are applied.
    int amount_total;
    # The line items that will appear on the next invoice after this quote is accepted. This does not include pending invoice items that exist on the customer but may still be included in the next invoice.
    QuotesResourceListLineItems_1 line_items?;
    # 
    Quotes_resource_total_details total_details;
};

# 
public type Setup_attempt_payment_method_details_bancontact record {
    # Bank code of bank associated with the bank account.
    string? bank_code?;
    # Name of the bank associated with the bank account.
    string? bank_name?;
    # Bank Identifier Code of the bank associated with the bank account.
    string? bic?;
    # The ID of the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Payment_method? generated_sepa_debit?;
    # The mandate for the SEPA Direct Debit PaymentMethod which was generated by this SetupAttempt.
    string|Mandate? generated_sepa_debit_mandate?;
    # Last four characters of the IBAN.
    string? iban_last4?;
    # Preferred language of the Bancontact authorization page that the customer is redirected to.
    # Can be one of `en`, `de`, `fr`, or `nl`
    "de"|"en"|"fr"|"nl" preferred_language?;
    # Owner's verified full name. Values are verified or provided by Bancontact directly
    # (if supported) at the time of authorization or settlement. They cannot be set or mutated.
    string? verified_name?;
};

# Description of the SKU’s inventory
public type Sku_inventory record {
    # The count of inventory available. Will be present if and only if `type` is `finite`.
    int? quantity?;
    # Inventory type. Possible values are `finite`, `bucket` (not quantified), and `infinite`.
    @constraint:String {maxLength: 5000}
    string 'type;
    # An indicator of the inventory available. Possible values are `in_stock`, `limited`, and `out_of_stock`. Will be present if and only if `type` is `bucket`.
    string? value?;
};

# A Location represents a grouping of readers.
# 
# Related guide: [Fleet Management](https://stripe.com/docs/terminal/creating-locations).
public type TerminalLocation record {
    # 
    Address address;
    # The display name of the location.
    @constraint:String {maxLength: 5000}
    string display_name;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|} metadata;
    # String representing the object's type. Objects of the same type share the same value.
    "terminal.location" 'object;
};

# 
public type Account_requirements_error record {
    # The code for the type of error.
    "invalid_address_city_state_postal_code"|"invalid_street_address"|"invalid_value_other"|"verification_document_address_mismatch"|"verification_document_address_missing"|"verification_document_corrupt"|"verification_document_country_not_supported"|"verification_document_dob_mismatch"|"verification_document_duplicate_type"|"verification_document_expired"|"verification_document_failed_copy"|"verification_document_failed_greyscale"|"verification_document_failed_other"|"verification_document_failed_test_mode"|"verification_document_fraudulent"|"verification_document_id_number_mismatch"|"verification_document_id_number_missing"|"verification_document_incomplete"|"verification_document_invalid"|"verification_document_issue_or_expiry_date_missing"|"verification_document_manipulated"|"verification_document_missing_back"|"verification_document_missing_front"|"verification_document_name_mismatch"|"verification_document_name_missing"|"verification_document_nationality_mismatch"|"verification_document_not_readable"|"verification_document_not_signed"|"verification_document_not_uploaded"|"verification_document_photo_mismatch"|"verification_document_too_large"|"verification_document_type_not_supported"|"verification_failed_address_match"|"verification_failed_business_iec_number"|"verification_failed_document_match"|"verification_failed_id_number_match"|"verification_failed_keyed_identity"|"verification_failed_keyed_match"|"verification_failed_name_match"|"verification_failed_other"|"verification_failed_tax_id_match"|"verification_failed_tax_id_not_issued"|"verification_missing_executives"|"verification_missing_owners"|"verification_requires_additional_memorandum_of_associations" code;
    # An informative message that indicates the error type and provides additional details about the error.
    @constraint:String {maxLength: 5000}
    string reason;
    # The specific user onboarding requirement field (in the requirements hash) that needs to be resolved.
    @constraint:String {maxLength: 5000}
    string requirement;
};

# 
public type Setup_attempt_payment_method_details_card record {
    # Populated if this authorization used 3D Secure authentication.
    Three_d_secure_details? three_d_secure?;
};

# 
public type Payment_method_wechat_pay record {
};

# Source mandate notifications should be created when a notification related to
# a source mandate must be sent to the payer. They will trigger a webhook or
# deliver an email to the customer.
public type Source_mandate_notification record {
    # 
    Source_mandate_notification_acss_debit_data acss_debit?;
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the amount associated with the mandate notification. The amount is expressed in the currency of the underlying source. Required if the notification type is `debit_initiated`.
    int? amount?;
    # 
    Source_mandate_notification_bacs_debit_data bacs_debit?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "source_mandate_notification" 'object;
    # The reason of the mandate notification. Valid reasons are `mandate_confirmed` or `debit_initiated`.
    @constraint:String {maxLength: 5000}
    string reason;
    # 
    Source_mandate_notification_sepa_debit_data sepa_debit?;
    # `Source` objects allow you to accept a variety of payment methods. They
    # represent a customer's payment instrument, and can be used with the Stripe API
    # just like a `Card` object: once chargeable, they can be charged, or can be
    # attached to customers.
    # 
    # Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
    Source 'source;
    # The status of the mandate notification. Valid statuses are `pending` or `submitted`.
    @constraint:String {maxLength: 5000}
    string status;
    # The type of source this mandate notification is attached to. Should be the source type identifier code for the payment method, such as `three_d_secure`.
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Deleted_alipay_account record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "alipay_account" 'object;
};

# 
public type Quotes_resource_subscription_data record {
    # When creating a new subscription, the date of which the subscription schedule will start after the quote is accepted. This date is ignored if it is in the past when the quote is accepted. Measured in seconds since the Unix epoch.
    int? effective_date?;
    # Integer representing the number of trial period days before the customer is charged for the first time.
    int? trial_period_days?;
};

public type Current_period_end Range_query_specs|int;

# 
public type Credit_note_tax_amount record {
    # The amount, in %s, of the tax.
    int amount;
    # Whether this tax amount is inclusive or exclusive.
    boolean inclusive;
    # The tax rate that was applied to get this tax amount.
    string|Tax_rate tax_rate;
};

# 
public type Invoice_item_threshold_reason record {
    # The IDs of the line items that triggered the threshold invoice.
    Invoice_item_threshold_reasonLineitemidsItemsString[] line_item_ids;
    # The quantity threshold boundary that applied to the given line item.
    int usage_gte;
};

# 
public type Transform_usage record {
    # Divide usage by this number.
    int divide_by;
    # After division, either round the result `up` or `down`.
    "down"|"up" round;
};

# 
public type Invoices_resource_invoice_tax_id record {
    # The type of the tax ID, one of `eu_vat`, `br_cnpj`, `br_cpf`, `gb_vat`, `nz_gst`, `au_abn`, `au_arn`, `in_gst`, `no_vat`, `za_vat`, `ch_vat`, `mx_rfc`, `sg_uen`, `ru_inn`, `ru_kpp`, `ca_bn`, `hk_br`, `es_cif`, `tw_vat`, `th_vat`, `jp_cn`, `jp_rn`, `li_uid`, `my_itn`, `us_ein`, `kr_brn`, `ca_qst`, `ca_gst_hst`, `ca_pst_bc`, `ca_pst_mb`, `ca_pst_sk`, `my_sst`, `sg_gst`, `ae_trn`, `cl_tin`, `sa_vat`, `id_npwp`, `my_frp`, `il_vat`, or `unknown`
    "ae_trn"|"au_abn"|"au_arn"|"br_cnpj"|"br_cpf"|"ca_bn"|"ca_gst_hst"|"ca_pst_bc"|"ca_pst_mb"|"ca_pst_sk"|"ca_qst"|"ch_vat"|"cl_tin"|"es_cif"|"eu_vat"|"gb_vat"|"hk_br"|"id_npwp"|"il_vat"|"in_gst"|"jp_cn"|"jp_rn"|"kr_brn"|"li_uid"|"mx_rfc"|"my_frp"|"my_itn"|"my_sst"|"no_vat"|"nz_gst"|"ru_inn"|"ru_kpp"|"sa_vat"|"sg_gst"|"sg_uen"|"th_vat"|"tw_vat"|"unknown"|"us_ein"|"za_vat" 'type;
    # The value of the tax ID.
    string? value?;
};

# Order objects are created to handle end customers' purchases of previously
# defined [products](https://stripe.com/docs/api#products). You can create, retrieve, and pay individual orders, as well
# as list all orders. Orders are identified by a unique, random ID.
# 
# Related guide: [Tax, Shipping, and Inventory](https://stripe.com/docs/orders).
public type Order record {
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount for the order.
    int amount;
    # The total amount that was returned to the customer.
    int? amount_returned?;
    # ID of the Connect Application that created the order.
    string? application?;
    # A fee in cents that will be applied to the order and transferred to the application owner’s Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees documentation.
    int? application_fee?;
    # The ID of the payment used to pay for the order. Present if the order status is `paid`, `fulfilled`, or `refunded`.
    string|Charge? charge?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The customer used for the order.
    string|Customer|Deleted_customer? customer?;
    # The email address of the customer placing the order.
    string? email?;
    # External coupon code to load for this order.
    @constraint:String {maxLength: 5000}
    string external_coupon_code?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # List of items constituting the order. An order can have up to 25 items.
    Order_item[] items;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "order" 'object;
    # A list of returns that have taken place for this order.
    OrdersResourceOrderReturnList? 'returns?;
    # The shipping method that is currently selected for this order, if any. If present, it is equal to one of the `id`s of shipping methods in the `shipping_methods` array. At order creation time, if there are multiple shipping methods, Stripe will automatically selected the first method.
    string? selected_shipping_method?;
    # The shipping address for the order. Present if the order is for goods to be shipped.
    Shipping? shipping?;
    # A list of supported shipping methods for this order. The desired shipping method can be specified either by updating the order, or when paying it.
    Shipping_method[]? shipping_methods?;
    # Current order status. One of `created`, `paid`, `canceled`, `fulfilled`, or `returned`. More details in the [Orders Guide](https://stripe.com/docs/orders/guide#understanding-order-statuses).
    @constraint:String {maxLength: 5000}
    string status;
    # The timestamps at which the order status was updated.
    Status_transitions? status_transitions?;
    # Time at which the object was last updated. Measured in seconds since the Unix epoch.
    int? updated?;
    # The user's order ID if it is different from the Stripe order ID.
    @constraint:String {maxLength: 5000}
    string upstream_id?;
};

# 
public type Payment_method_options_card_installments record {
    # Installment plans that may be selected for this PaymentIntent.
    Payment_method_details_card_installments_plan[]? available_plans?;
    # Whether Installments are enabled for this PaymentIntent.
    boolean enabled;
    # Installment plan selected for this PaymentIntent.
    Payment_method_details_card_installments_plan? plan?;
};

# 
public type Payment_pages_checkout_session_customer_details record {
    # The customer’s email at time of checkout.
    string? email?;
    # The customer’s tax exempt status at time of checkout.
    "exempt"|"none"|"reverse" tax_exempt?;
    # The customer’s tax IDs at time of checkout.
    Payment_pages_checkout_session_tax_id[]? tax_ids?;
};

# A list of items the customer is being quoted for.
public type QuotesResourceListLineItems record {
    # Details about each object.
    Item[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Payment_method_card_checks record {
    # If a address line1 was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_line1_check?;
    # If a address postal code was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? address_postal_code_check?;
    # If a CVC was provided, results of the check, one of `pass`, `fail`, `unavailable`, or `unchecked`.
    string? cvc_check?;
};

# 
public type Period record {
    # The end date of this usage period. All usage up to and including this point in time is included.
    int? end?;
    # The start date of this usage period. All usage after this point in time is included.
    int? 'start?;
};

# 
public type Person_relationship record {
    # Whether the person is a director of the account's legal entity. Currently only required for accounts in the EU. Directors are typically members of the governing board of the company, or responsible for ensuring the company meets its regulatory obligations.
    boolean? director?;
    # Whether the person has significant responsibility to control, manage, or direct the organization.
    boolean? executive?;
    # Whether the person is an owner of the account’s legal entity.
    boolean? owner?;
    # The percent owned by the person of the account's legal entity.
    decimal? percent_ownership?;
    # Whether the person is authorized as the primary representative of the account. This is the person nominated by the business to provide information about themselves, and general information about the account. There can only be one representative at any given time. At the time the account is created, this person should be set to the person responsible for opening the account.
    boolean? representative?;
    # The person's title (e.g., CEO, Support Engineer).
    string? title?;
};

# PaymentMethod objects represent your customer's payment instruments.
# They can be used with [PaymentIntents](https://stripe.com/docs/payments/payment-intents) to collect payments or saved to
# Customer objects to store instrument details for future payments.
# 
# Related guides: [Payment Methods](https://stripe.com/docs/payments/payment-methods) and [More Payment Scenarios](https://stripe.com/docs/payments/more-payment-scenarios).
public type Payment_method record {
    # 
    Payment_method_acss_debit acss_debit?;
    # 
    Payment_method_afterpay_clearpay afterpay_clearpay?;
    # 
    Payment_flows_private_payment_methods_alipay alipay?;
    # 
    Payment_method_au_becs_debit au_becs_debit?;
    # 
    Payment_method_bacs_debit bacs_debit?;
    # 
    Payment_method_bancontact bancontact?;
    # 
    Billing_details billing_details;
    # 
    Payment_method_boleto boleto?;
    # 
    Payment_method_card card?;
    # 
    Payment_method_card_present card_present?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
    string|Customer? customer?;
    # 
    Payment_method_eps eps?;
    # 
    Payment_method_fpx fpx?;
    # 
    Payment_method_giropay giropay?;
    # 
    Payment_method_grabpay grabpay?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # 
    Payment_method_ideal ideal?;
    # 
    Payment_method_interac_present interac_present?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "payment_method" 'object;
    # 
    Payment_method_oxxo oxxo?;
    # 
    Payment_method_p24 p24?;
    # 
    Payment_method_sepa_debit sepa_debit?;
    # 
    Payment_method_sofort sofort?;
    # The type of the PaymentMethod. An additional hash is included on the PaymentMethod with a name matching this value. It contains additional information specific to the PaymentMethod type.
    "acss_debit"|"afterpay_clearpay"|"alipay"|"au_becs_debit"|"bacs_debit"|"bancontact"|"boleto"|"card"|"card_present"|"eps"|"fpx"|"giropay"|"grabpay"|"ideal"|"interac_present"|"oxxo"|"p24"|"sepa_debit"|"sofort"|"wechat_pay" 'type;
    # 
    Payment_method_wechat_pay wechat_pay?;
};

# 
public type Deleted_subscription_item record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "subscription_item" 'object;
};

# Sometimes you want to add a charge or credit to a customer, but actually
# charge or credit the customer's card only at the end of a regular billing
# cycle. This is useful for combining several charges (to minimize
# per-transaction fees), or for having Stripe tabulate your usage-based billing
# totals.
# 
# Related guide: [Subscription Invoices](https://stripe.com/docs/billing/invoices/subscription#adding-upcoming-invoice-items).
public type Invoiceitem record {
    # Amount (in the `currency` specified) of the invoice item. This should always be equal to `unit_amount * quantity`.
    int amount;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # The ID of the customer who will be billed when this invoice item is billed.
    string|Customer|Deleted_customer customer;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int date;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # If true, discounts will apply to this invoice item. Always false for prorations.
    boolean discountable;
    # The discounts which apply to the invoice item. Item discounts are applied before invoice discounts. Use `expand[]=discounts` to expand each discount.
    (string|Discount)[]? discounts?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # The ID of the invoice this invoice item belongs to.
    string|Invoice? invoice?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # String representing the object's type. Objects of the same type share the same value.
    "invoiceitem" 'object;
    # 
    Invoice_line_item_period period;
    # The price of the invoice item.
    Price? price?;
    # Whether the invoice item was created automatically as a proration adjustment when the customer switched plans.
    boolean proration;
    # Quantity of units for the invoice item. If the invoice item is a proration, the quantity of the subscription that the proration was computed for.
    int quantity;
    # The subscription that this invoice item has been created for, if any.
    string|Subscription? subscription?;
    # The subscription item that this invoice item has been created for, if any.
    @constraint:String {maxLength: 5000}
    string subscription_item?;
    # The tax rates which apply to the invoice item. When set, the `default_tax_rates` on the invoice do not apply to this invoice item.
    Tax_rate[]? tax_rates?;
    # Unit amount (in the `currency` specified) of the invoice item.
    int? unit_amount?;
    # Same as `unit_amount`, but contains a decimal value with at most 12 decimal places.
    string? unit_amount_decimal?;
};

# 
public type Quotes_resource_total_details record {
    # This is the sum of all the line item discounts.
    int amount_discount;
    # This is the sum of all the line item shipping amounts.
    int? amount_shipping?;
    # This is the sum of all the line item tax amounts.
    int amount_tax;
    # 
    Quotes_resource_total_details_resource_breakdown breakdown?;
};

# Balance transactions represent funds moving through your Stripe account.
# They're created for every type of transaction that comes into or flows out of your Stripe account balance.
# 
# Related guide: [Balance Transaction Types](https://stripe.com/docs/reports/balance-transaction-types).
public type Balance_transaction record {
    # Gross amount of the transaction, in %s.
    int amount;
    # The date the transaction's net funds will become available in the Stripe balance.
    int available_on;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # The exchange rate used, if applicable, for this transaction. Specifically, if money was converted from currency A to currency B, then the `amount` in currency A, times `exchange_rate`, would be the `amount` in currency B. For example, suppose you charged a customer 10.00 EUR. Then the PaymentIntent's `amount` would be `1000` and `currency` would be `eur`. Suppose this was converted into 12.34 USD in your Stripe account. Then the BalanceTransaction's `amount` would be `1234`, `currency` would be `usd`, and `exchange_rate` would be `1.234`.
    decimal? exchange_rate?;
    # Fees (in %s) paid for this transaction.
    int fee;
    # Detailed breakdown of fees (in %s) paid for this transaction.
    Fee[] fee_details;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Net amount of the transaction, in %s.
    int net;
    # String representing the object's type. Objects of the same type share the same value.
    "balance_transaction" 'object;
    # [Learn more](https://stripe.com/docs/reports/reporting-categories) about how reporting categories can help you understand balance transactions from an accounting perspective.
    @constraint:String {maxLength: 5000}
    string reporting_category;
    # The Stripe object to which this transaction is related.
    string|Application_fee|Charge|Connect_collection_transfer|Dispute|Fee_refund|IssuingAuthorization|IssuingDispute|IssuingTransaction|Payout|Platform_tax_fee|Refund|Reserve_transaction|Tax_deducted_at_source|Topup|Transfer|Transfer_reversal? 'source?;
    # If the transaction's net funds are available in the Stripe balance yet. Either `available` or `pending`.
    @constraint:String {maxLength: 5000}
    string status;
    # Transaction type: `adjustment`, `advance`, `advance_funding`, `anticipation_repayment`, `application_fee`, `application_fee_refund`, `charge`, `connect_collection_transfer`, `contribution`, `issuing_authorization_hold`, `issuing_authorization_release`, `issuing_dispute`, `issuing_transaction`, `payment`, `payment_failure_refund`, `payment_refund`, `payout`, `payout_cancel`, `payout_failure`, `refund`, `refund_failure`, `reserve_transaction`, `reserved_funds`, `stripe_fee`, `stripe_fx_fee`, `tax_fee`, `topup`, `topup_reversal`, `transfer`, `transfer_cancel`, `transfer_failure`, or `transfer_refund`. [Learn more](https://stripe.com/docs/reports/balance-transaction-types) about balance transaction types and what they represent. If you are looking to classify transactions for accounting purposes, you might want to consider `reporting_category` instead.
    "adjustment"|"advance"|"advance_funding"|"anticipation_repayment"|"application_fee"|"application_fee_refund"|"charge"|"connect_collection_transfer"|"contribution"|"issuing_authorization_hold"|"issuing_authorization_release"|"issuing_dispute"|"issuing_transaction"|"payment"|"payment_failure_refund"|"payment_refund"|"payout"|"payout_cancel"|"payout_failure"|"refund"|"refund_failure"|"reserve_transaction"|"reserved_funds"|"stripe_fee"|"stripe_fx_fee"|"tax_fee"|"topup"|"topup_reversal"|"transfer"|"transfer_cancel"|"transfer_failure"|"transfer_refund" 'type;
};

# The Billing customer portal is a Stripe-hosted UI for subscription and
# billing management.
# 
# A portal configuration describes the functionality and features that you
# want to provide to your customers through the portal.
# 
# A portal session describes the instantiation of the customer portal for
# a particular customer. By visiting the session's URL, the customer
# can manage their subscriptions and billing details. For security reasons,
# sessions are short-lived and will expire if the customer does not visit the URL.
# Create sessions on-demand when customers intend to manage their subscriptions
# and billing details.
# 
# Learn more in the [product overview](https://stripe.com/docs/billing/subscriptions/customer-portal)
# and [integration guide](https://stripe.com/docs/billing/subscriptions/integrating-customer-portal).
public type Billing_portalSession record {
    # The configuration used by this session, describing the features available.
    string|Billing_portalConfiguration configuration;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The ID of the customer for this session.
    @constraint:String {maxLength: 5000}
    string customer;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # The IETF language tag of the locale Customer Portal is displayed in. If blank or auto, the customer’s `preferred_locales` or browser’s locale is used.
    "auto"|"bg"|"cs"|"da"|"de"|"el"|"en"|"en-AU"|"en-CA"|"en-GB"|"en-IE"|"en-IN"|"en-NZ"|"en-SG"|"es"|"es-419"|"et"|"fi"|"fil"|"fr"|"fr-CA"|"hr"|"hu"|"id"|"it"|"ja"|"ko"|"lt"|"lv"|"ms"|"mt"|"nb"|"nl"|"pl"|"pt"|"pt-BR"|"ro"|"ru"|"sk"|"sl"|"sv"|"th"|"tr"|"vi"|"zh"|"zh-HK"|"zh-TW" locale?;
    # String representing the object's type. Objects of the same type share the same value.
    "billing_portal.session" 'object;
    # The account for which the session was created on behalf of. When specified, only subscriptions and invoices with this `on_behalf_of` account appear in the portal. For more information, see the [docs](https://stripe.com/docs/connect/charges-transfers#on-behalf-of). Use the [Accounts API](https://stripe.com/docs/api/accounts/object#account_object-settings-branding) to modify the `on_behalf_of` account's branding settings, which the portal displays.
    string? on_behalf_of?;
    # The URL to redirect customers to when they click on the portal's link to return to your website.
    @constraint:String {maxLength: 5000}
    string return_url;
    # The short-lived URL of the session that gives customers access to the customer portal.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Issuing_authorization_request record {
    # The `pending_request.amount` at the time of the request, presented in your card's currency and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal). Stripe held this amount from your account to fund the authorization if the request was approved.
    int amount;
    # Detailed breakdown of amount components. These amounts are denominated in `currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    Issuing_authorization_amount_details? amount_details?;
    # Whether this request was approved.
    boolean approved;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    @constraint:String {maxLength: 5000}
    string currency;
    # The `pending_request.merchant_amount` at the time of the request, presented in the `merchant_currency` and in the [smallest currency unit](https://stripe.com/docs/currencies#zero-decimal).
    int merchant_amount;
    # The currency that was collected by the merchant and presented to the cardholder for the authorization. Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    @constraint:String {maxLength: 5000}
    string merchant_currency;
    # The reason for the approval or decline.
    "account_disabled"|"card_active"|"card_inactive"|"cardholder_inactive"|"cardholder_verification_required"|"insufficient_funds"|"not_allowed"|"spending_controls"|"suspected_fraud"|"verification_failed"|"webhook_approved"|"webhook_declined"|"webhook_timeout" reason;
};

# 
public type Payment_method_bacs_debit record {
    # Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
    string? fingerprint?;
    # Last four digits of the bank account number.
    string? last4?;
    # Sort code of the bank account. (e.g., `10-20-30`)
    string? sort_code?;
};

# 
public type Subscription_automatic_tax record {
    # Whether Stripe automatically computes tax on this subscription.
    boolean enabled;
};

public type Subscription_cancel_at_1 int|"";

# 
public type Setup_attempt_payment_method_details record {
    # 
    Setup_attempt_payment_method_details_acss_debit acss_debit?;
    # 
    Setup_attempt_payment_method_details_au_becs_debit au_becs_debit?;
    # 
    Setup_attempt_payment_method_details_bacs_debit bacs_debit?;
    # 
    Setup_attempt_payment_method_details_bancontact bancontact?;
    # 
    Setup_attempt_payment_method_details_card card?;
    # 
    Setup_attempt_payment_method_details_card_present card_present?;
    # 
    Setup_attempt_payment_method_details_ideal ideal?;
    # 
    Setup_attempt_payment_method_details_sepa_debit sepa_debit?;
    # 
    Setup_attempt_payment_method_details_sofort sofort?;
    # The type of the payment method used in the SetupIntent (e.g., `card`). An additional hash is included on `payment_method_details` with a name matching this value. It contains confirmation-specific information for the payment method.
    @constraint:String {maxLength: 5000}
    string 'type;
};

# 
public type Deleted_tax_id record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "tax_id" 'object;
};

# 
public type Setup_attempt_payment_method_details_sepa_debit record {
};

# 
public type Deleted_card record {
    # Three-letter [ISO code for the currency](https://stripe.com/docs/payouts) paid out to the bank account.
    string? currency?;
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "card" 'object;
};

# 
public type Issuing_authorization_amount_details record {
    # The fee charged by the ATM for the cash withdrawal.
    int? atm_fee?;
};

# A list of refunds that have been applied to the fee.
public type FeeRefundList record {
    # Details about each object.
    Fee_refund[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Deleted_invoiceitem record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "invoiceitem" 'object;
};

# `Source` objects allow you to accept a variety of payment methods. They
# represent a customer's payment instrument, and can be used with the Stripe API
# just like a `Card` object: once chargeable, they can be charged, or can be
# attached to customers.
# 
# Related guides: [Sources API](https://stripe.com/docs/sources) and [Sources & Customers](https://stripe.com/docs/sources/customers).
public type Source record {
    Source_type_ach_credit_transfer ach_credit_transfer?;
    Source_type_ach_debit ach_debit?;
    Source_type_acss_debit acss_debit?;
    Source_type_alipay alipay?;
    # A positive integer in the smallest currency unit (that is, 100 cents for $1.00, or 1 for ¥1, Japanese Yen being a zero-decimal currency) representing the total amount associated with the source. This is the amount for which the source will be chargeable once ready. Required for `single_use` sources.
    int? amount?;
    Source_type_au_becs_debit au_becs_debit?;
    Source_type_bancontact bancontact?;
    Source_type_card card?;
    Source_type_card_present card_present?;
    # The client secret of the source. Used for client-side retrieval using a publishable key.
    @constraint:String {maxLength: 5000}
    string client_secret;
    # 
    Source_code_verification_flow code_verification?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO code for the currency](https://stripe.com/docs/currencies) associated with the source. This is the currency for which the source will be chargeable once ready. Required for `single_use` sources.
    string? currency?;
    # The ID of the customer to which this source is attached. This will not be present when the source has not been attached to a customer.
    @constraint:String {maxLength: 5000}
    string customer?;
    Source_type_eps eps?;
    # The authentication `flow` of the source. `flow` is one of `redirect`, `receiver`, `code_verification`, `none`.
    @constraint:String {maxLength: 5000}
    string flow;
    Source_type_giropay giropay?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    Source_type_ideal ideal?;
    Source_type_klarna klarna?;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    Source_type_multibanco multibanco?;
    # String representing the object's type. Objects of the same type share the same value.
    "source" 'object;
    # Information about the owner of the payment instrument that may be used or required by particular source types.
    Source_owner? owner?;
    Source_type_p24 p24?;
    # 
    Source_receiver_flow receiver?;
    # 
    Source_redirect_flow redirect?;
    Source_type_sepa_debit sepa_debit?;
    Source_type_sofort sofort?;
    # 
    Source_order source_order?;
    # Extra information about a source. This will appear on your customer's statement every time you charge the source.
    string? statement_descriptor?;
    # The status of the source, one of `canceled`, `chargeable`, `consumed`, `failed`, or `pending`. Only `chargeable` sources can be used to create a charge.
    @constraint:String {maxLength: 5000}
    string status;
    Source_type_three_d_secure three_d_secure?;
    # The `type` of the source. The `type` is a payment method, one of `ach_credit_transfer`, `ach_debit`, `alipay`, `bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `multibanco`, `klarna`, `p24`, `sepa_debit`, `sofort`, `three_d_secure`, or `wechat`. An additional hash is included on the source with a name matching this value. It contains additional information specific to the [payment method](https://stripe.com/docs/sources) used.
    "ach_credit_transfer"|"ach_debit"|"acss_debit"|"alipay"|"au_becs_debit"|"bancontact"|"card"|"card_present"|"eps"|"giropay"|"ideal"|"klarna"|"multibanco"|"p24"|"sepa_debit"|"sofort"|"three_d_secure"|"wechat" 'type;
    # Either `reusable` or `single_use`. Whether this source should be reusable or not. Some source types may or may not be reusable by construction, while others may leave the option at creation. If an incompatible value is passed, an error will be returned.
    string? usage?;
    Source_type_wechat wechat?;
};

public type Phase_configuration_params_1 record {
    Add_invoice_item_entry_1[] add_invoice_items?;
    decimal application_fee_percent?;
    Automatic_tax_config_3 automatic_tax?;
    "automatic"|"phase_start" billing_cycle_anchor?;
    Billing_threshold_params|"" billing_thresholds?;
    "charge_automatically"|"send_invoice" collection_method?;
    @constraint:String {maxLength: 5000}
    string coupon?;
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    DefaulttaxratesItemsString[]|"" default_tax_rates?;
    int|"now" end_date?;
    Subscription_schedules_param_1 invoice_settings?;
    Configuration_item_params[] items;
    int iterations?;
    "always_invoice"|"create_prorations"|"none" proration_behavior?;
    int|"now" start_date?;
    Transfer_data_specs_3 transfer_data?;
    boolean trial?;
    int|"now" trial_end?;
};

# 
public type Verification_session_redaction record {
    # Indicates whether this object and its related objects have been redacted or not.
    "processing"|"redacted" status;
};

# 
public type Quotes_resource_total_details_resource_breakdown record {
    # The aggregated line item discounts.
    Line_items_discount_amount[] discounts;
    # The aggregated line item tax amounts by rate.
    Line_items_tax_amount[] taxes;
};

public type One_time_price_data record {
    string currency;
    @constraint:String {maxLength: 5000}
    string product;
    "exclusive"|"inclusive"|"unspecified" tax_behavior?;
    int unit_amount?;
    string unit_amount_decimal?;
};

# A `Payout` object is created when you receive funds from Stripe, or when you
# initiate a payout to either a bank account or debit card of a [connected
# Stripe account](/docs/connect/bank-debit-card-payouts). You can retrieve individual payouts,
# as well as list all payouts. Payouts are made on [varying
# schedules](/docs/connect/manage-payout-schedule), depending on your country and
# industry.
# 
# Related guide: [Receiving Payouts](https://stripe.com/docs/payouts).
public type Payout record {
    # Amount (in %s) to be transferred to your bank account or debit card.
    int amount;
    # Date the payout is expected to arrive in the bank. This factors in delays like weekends or bank holidays.
    int arrival_date;
    # Returns `true` if the payout was created by an [automated payout schedule](https://stripe.com/docs/payouts#payout-schedule), and `false` if it was [requested manually](https://stripe.com/docs/payouts#manual-payouts).
    boolean automatic;
    # ID of the balance transaction that describes the impact of this payout on your account balance.
    string|Balance_transaction? balance_transaction?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
    string currency;
    # An arbitrary string attached to the object. Often useful for displaying to users.
    string? description?;
    # ID of the bank account or card the payout was sent to.
    string|Bank_account|Card|Deleted_bank_account|Deleted_card? destination?;
    # If the payout failed or was canceled, this will be the ID of the balance transaction that reversed the initial balance transaction, and puts the funds from the failed payout back in your balance.
    string|Balance_transaction? failure_balance_transaction?;
    # Error code explaining reason for payout failure if available. See [Types of payout failures](https://stripe.com/docs/api#payout_failures) for a list of failure codes.
    string? failure_code?;
    # Message to user further explaining reason for payout failure if available.
    string? failure_message?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    record {|string...;|}? metadata?;
    # The method used to send this payout, which can be `standard` or `instant`. `instant` is only supported for payouts to debit cards. (See [Instant payouts for marketplaces](https://stripe.com/blog/instant-payouts-for-marketplaces) for more information.)
    @constraint:String {maxLength: 5000}
    string method;
    # String representing the object's type. Objects of the same type share the same value.
    "payout" 'object;
    # If the payout reverses another, this is the ID of the original payout.
    string|Payout? original_payout?;
    # If the payout was reversed, this is the ID of the payout that reverses this payout.
    string|Payout? reversed_by?;
    # The source balance this payout came from. One of `card`, `fpx`, or `bank_account`.
    @constraint:String {maxLength: 5000}
    string source_type;
    # Extra information about a payout to be displayed on the user's bank statement.
    string? statement_descriptor?;
    # Current status of the payout: `paid`, `pending`, `in_transit`, `canceled` or `failed`. A payout is `pending` until it is submitted to the bank, when it becomes `in_transit`. The status then changes to `paid` if the transaction goes through, or to `failed` or `canceled` (within 5 business days). Some failed payouts may initially show as `paid` but then change to `failed`.
    @constraint:String {maxLength: 5000}
    string status;
    # Can be `bank_account` or `card`.
    "bank_account"|"card" 'type;
};

public type Add_invoice_item_entry record {
    @constraint:String {maxLength: 5000}
    string price?;
    One_time_price_data price_data?;
    int quantity?;
    Tax_rate_array|"" tax_rates?;
};

# 
public type Payment_method_details_card_installments_plan record {
    # For `fixed_count` installment plans, this is the number of installment payments your customer will make to their credit card.
    int? count?;
    # For `fixed_count` installment plans, this is the interval between installment payments your customer will make to their credit card.
    # One of `month`.
    "month" interval?;
    # Type of installment plan, one of `fixed_count`.
    "fixed_count" 'type;
};

# 
public type Payment_method_afterpay_clearpay record {
};

# Charges that were created by this PaymentIntent, if any.
public type PaymentFlowsPaymentIntentResourceChargeList record {
    # This list only contains the latest charge, even if there were previously multiple unsuccessful charges. To view all previous charges for a PaymentIntent, you can filter the charges list using the `payment_intent` [parameter](https://stripe.com/docs/api/charges/list#list_charges-payment_intent).
    Charge[] data;
    # True if this list has another page of items after this one that can be fetched.
    boolean has_more;
    # String representing the object's type. Objects of the same type share the same value. Always has the value `list`.
    "list" 'object;
    # The URL where this list can be accessed.
    @constraint:String {maxLength: 5000}
    string url;
};

# 
public type Card_issuing_account_terms_of_service record {
    # The Unix timestamp marking when the account representative accepted the service agreement.
    int? date?;
    # The IP address from which the account representative accepted the service agreement.
    string? ip?;
    # The user agent of the browser from which the account representative accepted the service agreement.
    @constraint:String {maxLength: 5000}
    string user_agent?;
};

# 
public type Setup_attempt_payment_method_details_card_present record {
    # The ID of the Card PaymentMethod which was generated by this SetupAttempt.
    string|Payment_method? generated_card?;
};

# 
public type Subscription_schedules_resource_default_settings_automatic_tax record {
    # Whether Stripe automatically computes tax on invoices created during this phase.
    boolean enabled;
};

# 
public type Issuing_cardholder_company record {
    # Whether the company's business ID number was provided.
    boolean tax_id_provided;
};

# 
public type Setup_attempt_payment_method_details_bacs_debit record {
};

# 
public type Issuing_card_authorization_controls record {
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to allow. All other categories will be blocked. Cannot be set with `blocked_categories`.
    ("ac_refrigeration_repair"|"accounting_bookkeeping_services"|"advertising_services"|"agricultural_cooperative"|"airlines_air_carriers"|"airports_flying_fields"|"ambulance_services"|"amusement_parks_carnivals"|"antique_reproductions"|"antique_shops"|"aquariums"|"architectural_surveying_services"|"art_dealers_and_galleries"|"artists_supply_and_craft_shops"|"auto_and_home_supply_stores"|"auto_body_repair_shops"|"auto_paint_shops"|"auto_service_shops"|"automated_cash_disburse"|"automated_fuel_dispensers"|"automobile_associations"|"automotive_parts_and_accessories_stores"|"automotive_tire_stores"|"bail_and_bond_payments"|"bakeries"|"bands_orchestras"|"barber_and_beauty_shops"|"betting_casino_gambling"|"bicycle_shops"|"billiard_pool_establishments"|"boat_dealers"|"boat_rentals_and_leases"|"book_stores"|"books_periodicals_and_newspapers"|"bowling_alleys"|"bus_lines"|"business_secretarial_schools"|"buying_shopping_services"|"cable_satellite_and_other_pay_television_and_radio"|"camera_and_photographic_supply_stores"|"candy_nut_and_confectionery_stores"|"car_and_truck_dealers_new_used"|"car_and_truck_dealers_used_only"|"car_rental_agencies"|"car_washes"|"carpentry_services"|"carpet_upholstery_cleaning"|"caterers"|"charitable_and_social_service_organizations_fundraising"|"chemicals_and_allied_products"|"child_care_services"|"childrens_and_infants_wear_stores"|"chiropodists_podiatrists"|"chiropractors"|"cigar_stores_and_stands"|"civic_social_fraternal_associations"|"cleaning_and_maintenance"|"clothing_rental"|"colleges_universities"|"commercial_equipment"|"commercial_footwear"|"commercial_photography_art_and_graphics"|"commuter_transport_and_ferries"|"computer_network_services"|"computer_programming"|"computer_repair"|"computer_software_stores"|"computers_peripherals_and_software"|"concrete_work_services"|"construction_materials"|"consulting_public_relations"|"correspondence_schools"|"cosmetic_stores"|"counseling_services"|"country_clubs"|"courier_services"|"court_costs"|"credit_reporting_agencies"|"cruise_lines"|"dairy_products_stores"|"dance_hall_studios_schools"|"dating_escort_services"|"dentists_orthodontists"|"department_stores"|"detective_agencies"|"digital_goods_applications"|"digital_goods_games"|"digital_goods_large_volume"|"digital_goods_media"|"direct_marketing_catalog_merchant"|"direct_marketing_combination_catalog_and_retail_merchant"|"direct_marketing_inbound_telemarketing"|"direct_marketing_insurance_services"|"direct_marketing_other"|"direct_marketing_outbound_telemarketing"|"direct_marketing_subscription"|"direct_marketing_travel"|"discount_stores"|"doctors"|"door_to_door_sales"|"drapery_window_covering_and_upholstery_stores"|"drinking_places"|"drug_stores_and_pharmacies"|"drugs_drug_proprietaries_and_druggist_sundries"|"dry_cleaners"|"durable_goods"|"duty_free_stores"|"eating_places_restaurants"|"educational_services"|"electric_razor_stores"|"electrical_parts_and_equipment"|"electrical_services"|"electronics_repair_shops"|"electronics_stores"|"elementary_secondary_schools"|"employment_temp_agencies"|"equipment_rental"|"exterminating_services"|"family_clothing_stores"|"fast_food_restaurants"|"financial_institutions"|"fines_government_administrative_entities"|"fireplace_fireplace_screens_and_accessories_stores"|"floor_covering_stores"|"florists"|"florists_supplies_nursery_stock_and_flowers"|"freezer_and_locker_meat_provisioners"|"fuel_dealers_non_automotive"|"funeral_services_crematories"|"furniture_home_furnishings_and_equipment_stores_except_appliances"|"furniture_repair_refinishing"|"furriers_and_fur_shops"|"general_services"|"gift_card_novelty_and_souvenir_shops"|"glass_paint_and_wallpaper_stores"|"glassware_crystal_stores"|"golf_courses_public"|"government_services"|"grocery_stores_supermarkets"|"hardware_equipment_and_supplies"|"hardware_stores"|"health_and_beauty_spas"|"hearing_aids_sales_and_supplies"|"heating_plumbing_a_c"|"hobby_toy_and_game_shops"|"home_supply_warehouse_stores"|"hospitals"|"hotels_motels_and_resorts"|"household_appliance_stores"|"industrial_supplies"|"information_retrieval_services"|"insurance_default"|"insurance_underwriting_premiums"|"intra_company_purchases"|"jewelry_stores_watches_clocks_and_silverware_stores"|"landscaping_services"|"laundries"|"laundry_cleaning_services"|"legal_services_attorneys"|"luggage_and_leather_goods_stores"|"lumber_building_materials_stores"|"manual_cash_disburse"|"marinas_service_and_supplies"|"masonry_stonework_and_plaster"|"massage_parlors"|"medical_and_dental_labs"|"medical_dental_ophthalmic_and_hospital_equipment_and_supplies"|"medical_services"|"membership_organizations"|"mens_and_boys_clothing_and_accessories_stores"|"mens_womens_clothing_stores"|"metal_service_centers"|"miscellaneous"|"miscellaneous_apparel_and_accessory_shops"|"miscellaneous_auto_dealers"|"miscellaneous_business_services"|"miscellaneous_food_stores"|"miscellaneous_general_merchandise"|"miscellaneous_general_services"|"miscellaneous_home_furnishing_specialty_stores"|"miscellaneous_publishing_and_printing"|"miscellaneous_recreation_services"|"miscellaneous_repair_shops"|"miscellaneous_specialty_retail"|"mobile_home_dealers"|"motion_picture_theaters"|"motor_freight_carriers_and_trucking"|"motor_homes_dealers"|"motor_vehicle_supplies_and_new_parts"|"motorcycle_shops_and_dealers"|"motorcycle_shops_dealers"|"music_stores_musical_instruments_pianos_and_sheet_music"|"news_dealers_and_newsstands"|"non_fi_money_orders"|"non_fi_stored_value_card_purchase_load"|"nondurable_goods"|"nurseries_lawn_and_garden_supply_stores"|"nursing_personal_care"|"office_and_commercial_furniture"|"opticians_eyeglasses"|"optometrists_ophthalmologist"|"orthopedic_goods_prosthetic_devices"|"osteopaths"|"package_stores_beer_wine_and_liquor"|"paints_varnishes_and_supplies"|"parking_lots_garages"|"passenger_railways"|"pawn_shops"|"pet_shops_pet_food_and_supplies"|"petroleum_and_petroleum_products"|"photo_developing"|"photographic_photocopy_microfilm_equipment_and_supplies"|"photographic_studios"|"picture_video_production"|"piece_goods_notions_and_other_dry_goods"|"plumbing_heating_equipment_and_supplies"|"political_organizations"|"postal_services_government_only"|"precious_stones_and_metals_watches_and_jewelry"|"professional_services"|"public_warehousing_and_storage"|"quick_copy_repro_and_blueprint"|"railroads"|"real_estate_agents_and_managers_rentals"|"record_stores"|"recreational_vehicle_rentals"|"religious_goods_stores"|"religious_organizations"|"roofing_siding_sheet_metal"|"secretarial_support_services"|"security_brokers_dealers"|"service_stations"|"sewing_needlework_fabric_and_piece_goods_stores"|"shoe_repair_hat_cleaning"|"shoe_stores"|"small_appliance_repair"|"snowmobile_dealers"|"special_trade_services"|"specialty_cleaning"|"sporting_goods_stores"|"sporting_recreation_camps"|"sports_and_riding_apparel_stores"|"sports_clubs_fields"|"stamp_and_coin_stores"|"stationary_office_supplies_printing_and_writing_paper"|"stationery_stores_office_and_school_supply_stores"|"swimming_pools_sales"|"t_ui_travel_germany"|"tailors_alterations"|"tax_payments_government_agencies"|"tax_preparation_services"|"taxicabs_limousines"|"telecommunication_equipment_and_telephone_sales"|"telecommunication_services"|"telegraph_services"|"tent_and_awning_shops"|"testing_laboratories"|"theatrical_ticket_agencies"|"timeshares"|"tire_retreading_and_repair"|"tolls_bridge_fees"|"tourist_attractions_and_exhibits"|"towing_services"|"trailer_parks_campgrounds"|"transportation_services"|"travel_agencies_tour_operators"|"truck_stop_iteration"|"truck_utility_trailer_rentals"|"typesetting_plate_making_and_related_services"|"typewriter_stores"|"u_s_federal_government_agencies_or_departments"|"uniforms_commercial_clothing"|"used_merchandise_and_secondhand_stores"|"utilities"|"variety_stores"|"veterinary_services"|"video_amusement_game_supplies"|"video_game_arcades"|"video_tape_rental_stores"|"vocational_trade_schools"|"watch_jewelry_repair"|"welding_repair"|"wholesale_clubs"|"wig_and_toupee_stores"|"wires_money_orders"|"womens_accessory_and_specialty_shops"|"womens_ready_to_wear_stores"|"wrecking_and_salvage_yards")[]? allowed_categories?;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) of authorizations to decline. All other categories will be allowed. Cannot be set with `allowed_categories`.
    ("ac_refrigeration_repair"|"accounting_bookkeeping_services"|"advertising_services"|"agricultural_cooperative"|"airlines_air_carriers"|"airports_flying_fields"|"ambulance_services"|"amusement_parks_carnivals"|"antique_reproductions"|"antique_shops"|"aquariums"|"architectural_surveying_services"|"art_dealers_and_galleries"|"artists_supply_and_craft_shops"|"auto_and_home_supply_stores"|"auto_body_repair_shops"|"auto_paint_shops"|"auto_service_shops"|"automated_cash_disburse"|"automated_fuel_dispensers"|"automobile_associations"|"automotive_parts_and_accessories_stores"|"automotive_tire_stores"|"bail_and_bond_payments"|"bakeries"|"bands_orchestras"|"barber_and_beauty_shops"|"betting_casino_gambling"|"bicycle_shops"|"billiard_pool_establishments"|"boat_dealers"|"boat_rentals_and_leases"|"book_stores"|"books_periodicals_and_newspapers"|"bowling_alleys"|"bus_lines"|"business_secretarial_schools"|"buying_shopping_services"|"cable_satellite_and_other_pay_television_and_radio"|"camera_and_photographic_supply_stores"|"candy_nut_and_confectionery_stores"|"car_and_truck_dealers_new_used"|"car_and_truck_dealers_used_only"|"car_rental_agencies"|"car_washes"|"carpentry_services"|"carpet_upholstery_cleaning"|"caterers"|"charitable_and_social_service_organizations_fundraising"|"chemicals_and_allied_products"|"child_care_services"|"childrens_and_infants_wear_stores"|"chiropodists_podiatrists"|"chiropractors"|"cigar_stores_and_stands"|"civic_social_fraternal_associations"|"cleaning_and_maintenance"|"clothing_rental"|"colleges_universities"|"commercial_equipment"|"commercial_footwear"|"commercial_photography_art_and_graphics"|"commuter_transport_and_ferries"|"computer_network_services"|"computer_programming"|"computer_repair"|"computer_software_stores"|"computers_peripherals_and_software"|"concrete_work_services"|"construction_materials"|"consulting_public_relations"|"correspondence_schools"|"cosmetic_stores"|"counseling_services"|"country_clubs"|"courier_services"|"court_costs"|"credit_reporting_agencies"|"cruise_lines"|"dairy_products_stores"|"dance_hall_studios_schools"|"dating_escort_services"|"dentists_orthodontists"|"department_stores"|"detective_agencies"|"digital_goods_applications"|"digital_goods_games"|"digital_goods_large_volume"|"digital_goods_media"|"direct_marketing_catalog_merchant"|"direct_marketing_combination_catalog_and_retail_merchant"|"direct_marketing_inbound_telemarketing"|"direct_marketing_insurance_services"|"direct_marketing_other"|"direct_marketing_outbound_telemarketing"|"direct_marketing_subscription"|"direct_marketing_travel"|"discount_stores"|"doctors"|"door_to_door_sales"|"drapery_window_covering_and_upholstery_stores"|"drinking_places"|"drug_stores_and_pharmacies"|"drugs_drug_proprietaries_and_druggist_sundries"|"dry_cleaners"|"durable_goods"|"duty_free_stores"|"eating_places_restaurants"|"educational_services"|"electric_razor_stores"|"electrical_parts_and_equipment"|"electrical_services"|"electronics_repair_shops"|"electronics_stores"|"elementary_secondary_schools"|"employment_temp_agencies"|"equipment_rental"|"exterminating_services"|"family_clothing_stores"|"fast_food_restaurants"|"financial_institutions"|"fines_government_administrative_entities"|"fireplace_fireplace_screens_and_accessories_stores"|"floor_covering_stores"|"florists"|"florists_supplies_nursery_stock_and_flowers"|"freezer_and_locker_meat_provisioners"|"fuel_dealers_non_automotive"|"funeral_services_crematories"|"furniture_home_furnishings_and_equipment_stores_except_appliances"|"furniture_repair_refinishing"|"furriers_and_fur_shops"|"general_services"|"gift_card_novelty_and_souvenir_shops"|"glass_paint_and_wallpaper_stores"|"glassware_crystal_stores"|"golf_courses_public"|"government_services"|"grocery_stores_supermarkets"|"hardware_equipment_and_supplies"|"hardware_stores"|"health_and_beauty_spas"|"hearing_aids_sales_and_supplies"|"heating_plumbing_a_c"|"hobby_toy_and_game_shops"|"home_supply_warehouse_stores"|"hospitals"|"hotels_motels_and_resorts"|"household_appliance_stores"|"industrial_supplies"|"information_retrieval_services"|"insurance_default"|"insurance_underwriting_premiums"|"intra_company_purchases"|"jewelry_stores_watches_clocks_and_silverware_stores"|"landscaping_services"|"laundries"|"laundry_cleaning_services"|"legal_services_attorneys"|"luggage_and_leather_goods_stores"|"lumber_building_materials_stores"|"manual_cash_disburse"|"marinas_service_and_supplies"|"masonry_stonework_and_plaster"|"massage_parlors"|"medical_and_dental_labs"|"medical_dental_ophthalmic_and_hospital_equipment_and_supplies"|"medical_services"|"membership_organizations"|"mens_and_boys_clothing_and_accessories_stores"|"mens_womens_clothing_stores"|"metal_service_centers"|"miscellaneous"|"miscellaneous_apparel_and_accessory_shops"|"miscellaneous_auto_dealers"|"miscellaneous_business_services"|"miscellaneous_food_stores"|"miscellaneous_general_merchandise"|"miscellaneous_general_services"|"miscellaneous_home_furnishing_specialty_stores"|"miscellaneous_publishing_and_printing"|"miscellaneous_recreation_services"|"miscellaneous_repair_shops"|"miscellaneous_specialty_retail"|"mobile_home_dealers"|"motion_picture_theaters"|"motor_freight_carriers_and_trucking"|"motor_homes_dealers"|"motor_vehicle_supplies_and_new_parts"|"motorcycle_shops_and_dealers"|"motorcycle_shops_dealers"|"music_stores_musical_instruments_pianos_and_sheet_music"|"news_dealers_and_newsstands"|"non_fi_money_orders"|"non_fi_stored_value_card_purchase_load"|"nondurable_goods"|"nurseries_lawn_and_garden_supply_stores"|"nursing_personal_care"|"office_and_commercial_furniture"|"opticians_eyeglasses"|"optometrists_ophthalmologist"|"orthopedic_goods_prosthetic_devices"|"osteopaths"|"package_stores_beer_wine_and_liquor"|"paints_varnishes_and_supplies"|"parking_lots_garages"|"passenger_railways"|"pawn_shops"|"pet_shops_pet_food_and_supplies"|"petroleum_and_petroleum_products"|"photo_developing"|"photographic_photocopy_microfilm_equipment_and_supplies"|"photographic_studios"|"picture_video_production"|"piece_goods_notions_and_other_dry_goods"|"plumbing_heating_equipment_and_supplies"|"political_organizations"|"postal_services_government_only"|"precious_stones_and_metals_watches_and_jewelry"|"professional_services"|"public_warehousing_and_storage"|"quick_copy_repro_and_blueprint"|"railroads"|"real_estate_agents_and_managers_rentals"|"record_stores"|"recreational_vehicle_rentals"|"religious_goods_stores"|"religious_organizations"|"roofing_siding_sheet_metal"|"secretarial_support_services"|"security_brokers_dealers"|"service_stations"|"sewing_needlework_fabric_and_piece_goods_stores"|"shoe_repair_hat_cleaning"|"shoe_stores"|"small_appliance_repair"|"snowmobile_dealers"|"special_trade_services"|"specialty_cleaning"|"sporting_goods_stores"|"sporting_recreation_camps"|"sports_and_riding_apparel_stores"|"sports_clubs_fields"|"stamp_and_coin_stores"|"stationary_office_supplies_printing_and_writing_paper"|"stationery_stores_office_and_school_supply_stores"|"swimming_pools_sales"|"t_ui_travel_germany"|"tailors_alterations"|"tax_payments_government_agencies"|"tax_preparation_services"|"taxicabs_limousines"|"telecommunication_equipment_and_telephone_sales"|"telecommunication_services"|"telegraph_services"|"tent_and_awning_shops"|"testing_laboratories"|"theatrical_ticket_agencies"|"timeshares"|"tire_retreading_and_repair"|"tolls_bridge_fees"|"tourist_attractions_and_exhibits"|"towing_services"|"trailer_parks_campgrounds"|"transportation_services"|"travel_agencies_tour_operators"|"truck_stop_iteration"|"truck_utility_trailer_rentals"|"typesetting_plate_making_and_related_services"|"typewriter_stores"|"u_s_federal_government_agencies_or_departments"|"uniforms_commercial_clothing"|"used_merchandise_and_secondhand_stores"|"utilities"|"variety_stores"|"veterinary_services"|"video_amusement_game_supplies"|"video_game_arcades"|"video_tape_rental_stores"|"vocational_trade_schools"|"watch_jewelry_repair"|"welding_repair"|"wholesale_clubs"|"wig_and_toupee_stores"|"wires_money_orders"|"womens_accessory_and_specialty_shops"|"womens_ready_to_wear_stores"|"wrecking_and_salvage_yards")[]? blocked_categories?;
    # Limit spending with amount-based rules that apply across any cards this card replaced (i.e., its `replacement_for` card and _that_ card's `replacement_for` card, up the chain).
    Issuing_card_spending_limit[]? spending_limits?;
    # Currency of the amounts within `spending_limits`. Always the same as the currency of the card.
    string? spending_limits_currency?;
};

# 
public type Deleted_customer record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "customer" 'object;
};

# 
public type Account_sepa_debit_payments_settings record {
    # SEPA creditor identifier that identifies the company making the payment.
    @constraint:String {maxLength: 5000}
    string creditor_id?;
};

# 
public type Payment_method_card_wallet_amex_express_checkout record {
};

# 
public type Payment_method_options_sofort record {
    # Preferred language of the SOFORT authorization page that the customer is redirected to.
    "de"|"en"|"es"|"fr"|"it"|"nl"|"pl" preferred_language?;
};

# A SetupAttempt describes one attempted confirmation of a SetupIntent,
# whether that confirmation was successful or unsuccessful. You can use
# SetupAttempts to inspect details of a specific attempt at setting up a
# payment method using a SetupIntent.
public type Setup_attempt record {
    # The value of [application](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-application) on the SetupIntent at the time of this confirmation.
    string|Application? application?;
    # Time at which the object was created. Measured in seconds since the Unix epoch.
    int created;
    # The value of [customer](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-customer) on the SetupIntent at the time of this confirmation.
    string|Customer|Deleted_customer? customer?;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # Has the value `true` if the object exists in live mode or the value `false` if the object exists in test mode.
    boolean livemode;
    # String representing the object's type. Objects of the same type share the same value.
    "setup_attempt" 'object;
    # The value of [on_behalf_of](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-on_behalf_of) on the SetupIntent at the time of this confirmation.
    string|Account? on_behalf_of?;
    # ID of the payment method used with this SetupAttempt.
    string|Payment_method payment_method;
    # 
    Setup_attempt_payment_method_details payment_method_details;
    # The error encountered during this attempt to confirm the SetupIntent, if any.
    Api_errors? setup_error?;
    # ID of the SetupIntent that this attempt belongs to.
    string|Setup_intent setup_intent;
    # Status of this SetupAttempt, one of `requires_confirmation`, `requires_action`, `processing`, `succeeded`, `failed`, or `abandoned`.
    @constraint:String {maxLength: 5000}
    string status;
    # The value of [usage](https://stripe.com/docs/api/setup_intents/object#setup_intent_object-usage) on the SetupIntent at the time of this confirmation, one of `off_session` or `on_session`.
    @constraint:String {maxLength: 5000}
    string usage;
};

# 
public type Quotes_resource_recurring record {
    # Total before any discounts or taxes are applied.
    int amount_subtotal;
    # Total after discounts and taxes are applied.
    int amount_total;
    # The frequency at which a subscription is billed. One of `day`, `week`, `month` or `year`.
    "day"|"month"|"week"|"year" interval;
    # The number of intervals (specified in the `interval` attribute) between subscription billings. For example, `interval=month` and `interval_count=3` bills every 3 months.
    int interval_count;
    # 
    Quotes_resource_total_details total_details;
};

# 
public type Payment_pages_checkout_session_total_details record {
    # This is the sum of all the line item discounts.
    int amount_discount;
    # This is the sum of all the line item shipping amounts.
    int? amount_shipping?;
    # This is the sum of all the line item tax amounts.
    int amount_tax;
    # 
    Payment_pages_checkout_session_total_details_resource_breakdown breakdown?;
};

public type Package_dimentions_specs record {
    decimal height;
    decimal length;
    decimal weight;
    decimal width;
};

public type V1_invoices_body record {|
    # The account tax IDs associated with the invoice. Only editable when the invoice is a draft.
    AccounttaxidsItemsString[]|"" account_tax_ids?;
    # A fee in %s that will be applied to the invoice and transferred to the application owner's Stripe account. The request must be made with an OAuth key or the Stripe-Account header in order to take an application fee. For more information, see the application fees [documentation](https://stripe.com/docs/billing/invoices/connect#collecting-fees).
    int application_fee_amount?;
    # Controls whether Stripe will perform [automatic collection](https://stripe.com/docs/billing/invoices/workflow/#auto_advance) of the invoice. When `false`, the invoice's state will not automatically advance without an explicit action.
    boolean auto_advance?;
    # Settings for automatic tax lookup for this invoice.
    Automatic_tax_param automatic_tax?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay this invoice using the default source attached to the customer. When sending an invoice, Stripe will email this invoice to the customer with payment instructions. Defaults to `charge_automatically`.
    "charge_automatically"|"send_invoice" collection_method?;
    # A list of up to 4 custom fields to be displayed on the invoice.
    Invoice_settings_custom_fields|"" custom_fields?;
    # The ID of the customer who will be billed.
    @constraint:String {maxLength: 5000}
    string customer;
    # The number of days from when the invoice is created until it is due. Valid only for invoices where `collection_method=send_invoice`.
    int days_until_due?;
    # ID of the default payment method for the invoice. It must belong to the customer associated with the invoice. If not set, defaults to the subscription's default payment method, if any, or to the default payment method in the customer's invoice settings.
    @constraint:String {maxLength: 5000}
    string default_payment_method?;
    # ID of the default payment source for the invoice. It must belong to the customer associated with the invoice and be in a chargeable state. If not set, defaults to the subscription's default source, if any, or to the customer's default source.
    @constraint:String {maxLength: 5000}
    string default_source?;
    # The tax rates that will apply to any line item that does not have `tax_rates` set.
    V1_invoices_bodyDefaulttaxratesItemsString[] default_tax_rates?;
    # An arbitrary string attached to the object. Often useful for displaying to users. Referenced as 'memo' in the Dashboard.
    @constraint:String {maxLength: 1500}
    string description?;
    # The coupons to redeem into discounts for the invoice. If not specified, inherits the discount from the invoice's customer. Pass an empty string to avoid inheriting any discounts.
    Discounts_data_param|"" discounts?;
    # The date on which payment for this invoice is due. Valid only for invoices where `collection_method=send_invoice`.
    int due_date?;
    # Specifies which fields in the response should be expanded.
    V1_invoices_bodyExpandItemsString[] expand?;
    # Footer to be displayed on the invoice.
    @constraint:String {maxLength: 5000}
    string footer?;
    # Set of [key-value pairs](https://stripe.com/docs/api/metadata) that you can attach to an object. This can be useful for storing additional information about the object in a structured format. Individual keys can be unset by posting an empty value to them. All keys can be unset by posting an empty value to `metadata`.
    record {|string...;|}|"" metadata?;
    # The account (if any) for which the funds of the invoice payment are intended. If set, the invoice will be presented with the branding and support information of the specified account. See the [Invoices with Connect](https://stripe.com/docs/billing/invoices/connect) documentation for details.
    string on_behalf_of?;
    # Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
    Payment_settings payment_settings?;
    # Extra information about a charge for the customer's credit card statement. It must contain at least one letter. If not specified and this invoice is part of a subscription, the default `statement_descriptor` will be set to the first subscription item's product's `statement_descriptor`.
    @constraint:String {maxLength: 22}
    string statement_descriptor?;
    # The ID of the subscription to invoice, if any. If not set, the created invoice will include all pending invoice items for the customer. If set, the created invoice will only include pending invoice items for that subscription and pending invoice items not associated with any subscription. The subscription's billing cycle and regular subscription events won't be affected.
    @constraint:String {maxLength: 5000}
    string subscription?;
    # If specified, the funds from the invoice will be transferred to the destination and the ID of the resulting transfer will be found on the invoice's charge.
    Transfer_data_specs_1 transfer_data?;
|};

# A phase describes the plans, coupon, and trialing status of a subscription for a predefined time period.
public type Subscription_schedule_phase_configuration record {
    # A list of prices and quantities that will generate invoice items appended to the first invoice for this phase.
    Subscription_schedule_add_invoice_item[] add_invoice_items;
    # A non-negative decimal between 0 and 100, with at most two decimal places. This represents the percentage of the subscription invoice subtotal that will be transferred to the application owner's Stripe account during this phase of the schedule.
    decimal? application_fee_percent?;
    # Automatic tax configuration details
    Schedules_phase_automatic_tax automatic_tax?;
    # Possible values are `phase_start` or `automatic`. If `phase_start` then billing cycle anchor of the subscription is set to the start of the phase when entering the phase. If `automatic` then the billing cycle anchor is automatically modified as needed when entering the phase. For more information, see the billing cycle [documentation](https://stripe.com/docs/billing/subscriptions/billing-cycle).
    "automatic"|"phase_start" billing_cycle_anchor?;
    # Define thresholds at which an invoice will be sent, and the subscription advanced to a new billing period
    Subscription_billing_thresholds? billing_thresholds?;
    # Either `charge_automatically`, or `send_invoice`. When charging automatically, Stripe will attempt to pay the underlying subscription at the end of each billing cycle using the default source attached to the customer. When sending an invoice, Stripe will email your customer an invoice with payment instructions.
    "charge_automatically"|"send_invoice" collection_method?;
    # ID of the coupon to use during this phase of the subscription schedule.
    string|Coupon|Deleted_coupon? coupon?;
    # ID of the default payment method for the subscription schedule. It must belong to the customer associated with the subscription schedule. If not set, invoices will use the default payment method in the customer's invoice settings.
    string|Payment_method? default_payment_method?;
    # The default tax rates to apply to the subscription during this phase of the subscription schedule.
    Tax_rate[]? default_tax_rates?;
    # The end of this phase of the subscription schedule.
    int end_date;
    # The invoice settings applicable during this phase.
    Invoice_setting_subscription_schedule_setting? invoice_settings?;
    # Subscription items to configure the subscription to during this phase of the subscription schedule.
    Subscription_schedule_configuration_item[] items;
    # If the subscription schedule will prorate when transitioning to this phase. Possible values are `create_prorations` and `none`.
    "always_invoice"|"create_prorations"|"none" proration_behavior;
    # The start of this phase of the subscription schedule.
    int start_date;
    # The account (if any) the associated subscription's payments will be attributed to for tax reporting, and where funds from each payment will be transferred to for each of the subscription's invoices.
    Subscription_transfer_data? transfer_data?;
    # When the trial ends within the phase.
    int? trial_end?;
};

# 
public type Deleted_plan record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "plan" 'object;
};

# 
public type Deleted_recipient record {
    # Always true for a deleted object
    true deleted;
    # Unique identifier for the object.
    @constraint:String {maxLength: 5000}
    string id;
    # String representing the object's type. Objects of the same type share the same value.
    "recipient" 'object;
};

# 
public type Issuing_cardholder_spending_limit record {
    # Maximum amount allowed to spend per interval.
    int amount;
    # Array of strings containing [categories](https://stripe.com/docs/api#issuing_authorization_object-merchant_data-category) this limit applies to. Omitting this field will apply the limit to all categories.
    ("ac_refrigeration_repair"|"accounting_bookkeeping_services"|"advertising_services"|"agricultural_cooperative"|"airlines_air_carriers"|"airports_flying_fields"|"ambulance_services"|"amusement_parks_carnivals"|"antique_reproductions"|"antique_shops"|"aquariums"|"architectural_surveying_services"|"art_dealers_and_galleries"|"artists_supply_and_craft_shops"|"auto_and_home_supply_stores"|"auto_body_repair_shops"|"auto_paint_shops"|"auto_service_shops"|"automated_cash_disburse"|"automated_fuel_dispensers"|"automobile_associations"|"automotive_parts_and_accessories_stores"|"automotive_tire_stores"|"bail_and_bond_payments"|"bakeries"|"bands_orchestras"|"barber_and_beauty_shops"|"betting_casino_gambling"|"bicycle_shops"|"billiard_pool_establishments"|"boat_dealers"|"boat_rentals_and_leases"|"book_stores"|"books_periodicals_and_newspapers"|"bowling_alleys"|"bus_lines"|"business_secretarial_schools"|"buying_shopping_services"|"cable_satellite_and_other_pay_television_and_radio"|"camera_and_photographic_supply_stores"|"candy_nut_and_confectionery_stores"|"car_and_truck_dealers_new_used"|"car_and_truck_dealers_used_only"|"car_rental_agencies"|"car_washes"|"carpentry_services"|"carpet_upholstery_cleaning"|"caterers"|"charitable_and_social_service_organizations_fundraising"|"chemicals_and_allied_products"|"child_care_services"|"childrens_and_infants_wear_stores"|"chiropodists_podiatrists"|"chiropractors"|"cigar_stores_and_stands"|"civic_social_fraternal_associations"|"cleaning_and_maintenance"|"clothing_rental"|"colleges_universities"|"commercial_equipment"|"commercial_footwear"|"commercial_photography_art_and_graphics"|"commuter_transport_and_ferries"|"computer_network_services"|"computer_programming"|"computer_repair"|"computer_software_stores"|"computers_peripherals_and_software"|"concrete_work_services"|"construction_materials"|"consulting_public_relations"|"correspondence_schools"|"cosmetic_stores"|"counseling_services"|"country_clubs"|"courier_services"|"court_costs"|"credit_reporting_agencies"|"cruise_lines"|"dairy_products_stores"|"dance_hall_studios_schools"|"dating_escort_services"|"dentists_orthodontists"|"department_stores"|"detective_agencies"|"digital_goods_applications"|"digital_goods_games"|"digital_goods_large_volume"|"digital_goods_media"|"direct_marketing_catalog_merchant"|"direct_marketing_combination_catalog_and_retail_merchant"|"direct_marketing_inbound_telemarketing"|"direct_marketing_insurance_services"|"direct_marketing_other"|"direct_marketing_outbound_telemarketing"|"direct_marketing_subscription"|"direct_marketing_travel"|"discount_stores"|"doctors"|"door_to_door_sales"|"drapery_window_covering_and_upholstery_stores"|"drinking_places"|"drug_stores_and_pharmacies"|"drugs_drug_proprietaries_and_druggist_sundries"|"dry_cleaners"|"durable_goods"|"duty_free_stores"|"eating_places_restaurants"|"educational_services"|"electric_razor_stores"|"electrical_parts_and_equipment"|"electrical_services"|"electronics_repair_shops"|"electronics_stores"|"elementary_secondary_schools"|"employment_temp_agencies"|"equipment_rental"|"exterminating_services"|"family_clothing_stores"|"fast_food_restaurants"|"financial_institutions"|"fines_government_administrative_entities"|"fireplace_fireplace_screens_and_accessories_stores"|"floor_covering_stores"|"florists"|"florists_supplies_nursery_stock_and_flowers"|"freezer_and_locker_meat_provisioners"|"fuel_dealers_non_automotive"|"funeral_services_crematories"|"furniture_home_furnishings_and_equipment_stores_except_appliances"|"furniture_repair_refinishing"|"furriers_and_fur_shops"|"general_services"|"gift_card_novelty_and_souvenir_shops"|"glass_paint_and_wallpaper_stores"|"glassware_crystal_stores"|"golf_courses_public"|"government_services"|"grocery_stores_supermarkets"|"hardware_equipment_and_supplies"|"hardware_stores"|"health_and_beauty_spas"|"hearing_aids_sales_and_supplies"|"heating_plumbing_a_c"|"hobby_toy_and_game_shops"|"home_supply_warehouse_stores"|"hospitals"|"hotels_motels_and_resorts"|"household_appliance_stores"|"industrial_supplies"|"information_retrieval_services"|"insurance_default"|"insurance_underwriting_premiums"|"intra_company_purchases"|"jewelry_stores_watches_clocks_and_silverware_stores"|"landscaping_services"|"laundries"|"laundry_cleaning_services"|"legal_services_attorneys"|"luggage_and_leather_goods_stores"|"lumber_building_materials_stores"|"manual_cash_disburse"|"marinas_service_and_supplies"|"masonry_stonework_and_plaster"|"massage_parlors"|"medical_and_dental_labs"|"medical_dental_ophthalmic_and_hospital_equipment_and_supplies"|"medical_services"|"membership_organizations"|"mens_and_boys_clothing_and_accessories_stores"|"mens_womens_clothing_stores"|"metal_service_centers"|"miscellaneous"|"miscellaneous_apparel_and_accessory_shops"|"miscellaneous_auto_dealers"|"miscellaneous_business_services"|"miscellaneous_food_stores"|"miscellaneous_general_merchandise"|"miscellaneous_general_services"|"miscellaneous_home_furnishing_specialty_stores"|"miscellaneous_publishing_and_printing"|"miscellaneous_recreation_services"|"miscellaneous_repair_shops"|"miscellaneous_specialty_retail"|"mobile_home_dealers"|"motion_picture_theaters"|"motor_freight_carriers_and_trucking"|"motor_homes_dealers"|"motor_vehicle_supplies_and_new_parts"|"motorcycle_shops_and_dealers"|"motorcycle_shops_dealers"|"music_stores_musical_instruments_pianos_and_sheet_music"|"news_dealers_and_newsstands"|"non_fi_money_orders"|"non_fi_stored_value_card_purchase_load"|"nondurable_goods"|"nurseries_lawn_and_garden_supply_stores"|"nursing_personal_care"|"office_and_commercial_furniture"|"opticians_eyeglasses"|"optometrists_ophthalmologist"|"orthopedic_goods_prosthetic_devices"|"osteopaths"|"package_stores_beer_wine_and_liquor"|"paints_varnishes_and_supplies"|"parking_lots_garages"|"passenger_railways"|"pawn_shops"|"pet_shops_pet_food_and_supplies"|"petroleum_and_petroleum_products"|"photo_developing"|"photographic_photocopy_microfilm_equipment_and_supplies"|"photographic_studios"|"picture_video_production"|"piece_goods_notions_and_other_dry_goods"|"plumbing_heating_equipment_and_supplies"|"political_organizations"|"postal_services_government_only"|"precious_stones_and_metals_watches_and_jewelry"|"professional_services"|"public_warehousing_and_storage"|"quick_copy_repro_and_blueprint"|"railroads"|"real_estate_agents_and_managers_rentals"|"record_stores"|"recreational_vehicle_rentals"|"religious_goods_stores"|"religious_organizations"|"roofing_siding_sheet_metal"|"secretarial_support_services"|"security_brokers_dealers"|"service_stations"|"sewing_needlework_fabric_and_piece_goods_stores"|"shoe_repair_hat_cleaning"|"shoe_stores"|"small_appliance_repair"|"snowmobile_dealers"|"special_trade_services"|"specialty_cleaning"|"sporting_goods_stores"|"sporting_recreation_camps"|"sports_and_riding_apparel_stores"|"sports_clubs_fields"|"stamp_and_coin_stores"|"stationary_office_supplies_printing_and_writing_paper"|"stationery_stores_office_and_school_supply_stores"|"swimming_pools_sales"|"t_ui_travel_germany"|"tailors_alterations"|"tax_payments_government_agencies"|"tax_preparation_services"|"taxicabs_limousines"|"telecommunication_equipment_and_telephone_sales"|"telecommunication_services"|"telegraph_services"|"tent_and_awning_shops"|"testing_laboratories"|"theatrical_ticket_agencies"|"timeshares"|"tire_retreading_and_repair"|"tolls_bridge_fees"|"tourist_attractions_and_exhibits"|"towing_services"|"trailer_parks_campgrounds"|"transportation_services"|"travel_agencies_tour_operators"|"truck_stop_iteration"|"truck_utility_trailer_rentals"|"typesetting_plate_making_and_related_services"|"typewriter_stores"|"u_s_federal_government_agencies_or_departments"|"uniforms_commercial_clothing"|"used_merchandise_and_secondhand_stores"|"utilities"|"variety_stores"|"veterinary_services"|"video_amusement_game_supplies"|"video_game_arcades"|"video_tape_rental_stores"|"vocational_trade_schools"|"watch_jewelry_repair"|"welding_repair"|"wholesale_clubs"|"wig_and_toupee_stores"|"wires_money_orders"|"womens_accessory_and_specialty_shops"|"womens_ready_to_wear_stores"|"wrecking_and_salvage_yards")[]? categories?;
    # Interval (or event) to which the amount applies.
    "all_time"|"daily"|"monthly"|"per_authorization"|"weekly"|"yearly" interval;
};

# 
public type Invoice_payment_method_options_card record {
    # We strongly recommend that you rely on our SCA Engine to automatically prompt your customers for authentication based on risk level and [other requirements](https://stripe.com/docs/strong-customer-authentication). However, if you wish to request 3D Secure based on logic from your own fraud engine, provide this option. Read our guide on [manually requesting 3D Secure](https://stripe.com/docs/payments/3d-secure#manual-three-ds) for more information on how this configuration interacts with Radar and our SCA Engine.
    "any"|"automatic" request_three_d_secure?;
};

# 
public type Legal_entity_person_verification_document record {
    # The back of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? back?;
    # A user-displayable string describing the verification state of this document. For example, if a document is uploaded and the picture is too fuzzy, this may say "Identity document is too unclear to read".
    string? details?;
    # One of `document_corrupt`, `document_country_not_supported`, `document_expired`, `document_failed_copy`, `document_failed_other`, `document_failed_test_mode`, `document_fraudulent`, `document_failed_greyscale`, `document_incomplete`, `document_invalid`, `document_manipulated`, `document_missing_back`, `document_missing_front`, `document_not_readable`, `document_not_uploaded`, `document_photo_mismatch`, `document_too_large`, or `document_type_not_supported`. A machine-readable code specifying the verification state for this document.
    string? details_code?;
    # The front of an ID returned by a [file upload](https://stripe.com/docs/api#create_file) with a `purpose` value of `identity_document`.
    string|File? front?;
};

# 
public type Package_dimensions record {
    # Height, in inches.
    decimal height;
    # Length, in inches.
    decimal length;
    # Weight, in ounces.
    decimal weight;
    # Width, in inches.
    decimal width;
};
