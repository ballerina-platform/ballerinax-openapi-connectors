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

# Provides API key configurations needed when communicating with a remote HTTP endpoint.
public type ApiKeysConfig record {|
    # API keys related to connector authentication
    map<string> apiKeys;
|};

# This is a generated connector for [Wordnik API v4.0](https://developer.wordnik.com/docs) OpenAPI specification.
# Wordnik is the worlds biggest online English dictionary, by number of words.
@display {label: "Wordnik", iconPath: "resources/wordnik.svg"}
public isolated client class Client {
    final http:Client clientEp;
    final readonly & map<string> apiKeys;
    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Create a [Wordnik account](https://developer.wordnik.com/#wordnikUsername) and obtain tokens by following [this guide](https://developer.wordnik.com/gettingstarted).
    #
    # + apiKeyConfig - Provide your API key as `api_key`. Eg: `{"api_key" : "<your API key>"}` 
    # + clientConfig - The configurations to be used when initializing the `connector` 
    # + serviceUrl - URL of the target service 
    # + return - An error if connector initialization failed 
    public isolated function init(ApiKeysConfig apiKeyConfig, http:ClientConfiguration clientConfig =  {}, string serviceUrl = "https://api.wordnik.com/v4") returns error? {
        http:Client httpEp = check new (serviceUrl, clientConfig);
        self.clientEp = httpEp;
        self.apiKeys = apiKeyConfig.apiKeys.cloneReadOnly();
    }
    # Returns usage statistics for the API account.
    #
    # + apiKey - Wordnik authentication token 
    # + return - No response was specified 
    remote isolated function getApiTokenStatus(string? apiKey = ()) returns ApiTokenStatus|error {
        string  path = string `/account.json/apiTokenStatus`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"api_key": apiKey};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        ApiTokenStatus response = check self.clientEp-> get(path, accHeaders, targetType = ApiTokenStatus);
        return response;
    }
    # Authenticates a User
    #
    # + username - A confirmed Wordnik username 
    # + password - The user's password 
    # + return - No response was specified 
    remote isolated function authenticate(string username, string password) returns AuthenticationToken|error {
        string  path = string `/account.json/authenticate/${username}`;
        map<anydata> queryParam = {"password": password, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        AuthenticationToken response = check self.clientEp-> get(path, targetType = AuthenticationToken);
        return response;
    }
    # Authenticates a user
    #
    # + username - A confirmed Wordnik username 
    # + payload - The user's password 
    # + return - No response was specified 
    remote isolated function authenticatePost(string username, string payload) returns AuthenticationToken|error {
        string  path = string `/account.json/authenticate/${username}`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        AuthenticationToken response = check self.clientEp->post(path, request, targetType=AuthenticationToken);
        return response;
    }
    # Returns the logged-in User
    #
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + return - No response was specified 
    remote isolated function getLoggedInUser(string authToken) returns User|error {
        string  path = string `/account.json/user`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        User response = check self.clientEp-> get(path, accHeaders, targetType = User);
        return response;
    }
    # Fetches WordList objects for the logged-in user.
    #
    # + authToken - auth_token of logged-in user 
    # + skip - Results to skip 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getWordListsForLoggedInUser(string authToken, int skip = 0, int 'limit = 50) returns WordList[]|error {
        string  path = string `/account.json/wordLists`;
        map<anydata> queryParam = {"skip": skip, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WordList[] response = check self.clientEp-> get(path, accHeaders, targetType = WordListArr);
        return response;
    }
    # Fetches audio metadata for a word.
    #
    # + word - Word to get audio for. 
    # + useCanonical - Use the canonical form of the word 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getAudio(string word, string useCanonical = "false", int 'limit = 50) returns AudioFile[]|error {
        string  path = string `/word.json/${word}/audio`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        AudioFile[] response = check self.clientEp-> get(path, targetType = AudioFileArr);
        return response;
    }
    # Return definitions for a word
    #
    # + word - Word to return definitions for 
    # + 'limit - Maximum number of results to return 
    # + partOfSpeech - CSV list of part-of-speech types 
    # + includeRelated - Return related words with definitions 
    # + sourceDictionaries - Source dictionary to return definitions from.  If 'all' is received, results are returned from all sources. If multiple values are received (e.g. 'century,wiktionary'), results are returned from the first specified dictionary that has definitions. If left blank, results are returned from the first dictionary that has definitions. By default, dictionaries are searched in this order: ahd, wiktionary, webster, century, wordnet 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + includeTags - Return a closed set of XML tags in response 
    # + return - No response was specified 
    remote isolated function getDefinitions(string word, int 'limit = 200, string? partOfSpeech = (), string includeRelated = "false", string[]? sourceDictionaries = (), string useCanonical = "false", string includeTags = "false") returns Definition[]|error {
        string  path = string `/word.json/${word}/definitions`;
        map<anydata> queryParam = {"limit": 'limit, "partOfSpeech": partOfSpeech, "includeRelated": includeRelated, "sourceDictionaries": sourceDictionaries, "useCanonical": useCanonical, "includeTags": includeTags, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Definition[] response = check self.clientEp-> get(path, targetType = DefinitionArr);
        return response;
    }
    # Fetches etymology data
    #
    # + word - Word to return 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + return - No response was specified 
    remote isolated function getEtymologies(string word, string useCanonical = "false") returns string[]|error {
        string  path = string `/word.json/${word}/etymologies`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        string[] response = check self.clientEp-> get(path, targetType = stringArr);
        return response;
    }
    # Returns examples for a word
    #
    # + word - Word to return examples for 
    # + includeDuplicates - Show duplicate examples from different sources 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + skip - Results to skip 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getExamples(string word, string includeDuplicates = "false", string useCanonical = "false", int skip = 0, int 'limit = 5) returns ExampleSearchResults|error {
        string  path = string `/word.json/${word}/examples`;
        map<anydata> queryParam = {"includeDuplicates": includeDuplicates, "useCanonical": useCanonical, "skip": skip, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        ExampleSearchResults response = check self.clientEp-> get(path, targetType = ExampleSearchResults);
        return response;
    }
    # Returns word usage over time
    #
    # + word - Word to return 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + startYear - Starting Year 
    # + endYear - Ending Year 
    # + return - No response was specified 
    remote isolated function getWordFrequency(string word, string useCanonical = "false", int startYear = 1800, int endYear = 2012) returns FrequencySummary|error {
        string  path = string `/word.json/${word}/frequency`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "startYear": startYear, "endYear": endYear, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        FrequencySummary response = check self.clientEp-> get(path, targetType = FrequencySummary);
        return response;
    }
    # Returns syllable information for a word
    #
    # + word - Word to get syllables for 
    # + useCanonical - If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + sourceDictionary - Get from a single dictionary. Valid options: ahd, century, wiktionary, webster, and wordnet. 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getHyphenation(string word, string useCanonical = "false", string? sourceDictionary = (), int 'limit = 50) returns Syllable[]|error {
        string  path = string `/word.json/${word}/hyphenation`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "sourceDictionary": sourceDictionary, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Syllable[] response = check self.clientEp-> get(path, targetType = SyllableArr);
        return response;
    }
    # Fetches bi-gram phrases for a word
    #
    # + word - Word to fetch phrases for 
    # + 'limit - Maximum number of results to return 
    # + wlmi - Minimum WLMI for the phrase 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + return - No response was specified 
    remote isolated function getPhrases(string word, int 'limit = 5, int wlmi = 0, string useCanonical = "false") returns Bigram[]|error {
        string  path = string `/word.json/${word}/phrases`;
        map<anydata> queryParam = {"limit": 'limit, "wlmi": wlmi, "useCanonical": useCanonical, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Bigram[] response = check self.clientEp-> get(path, targetType = BigramArr);
        return response;
    }
    # Returns text pronunciations for a given word
    #
    # + word - Word to get pronunciations for 
    # + useCanonical - If true will try to return a correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + sourceDictionary - Get from a single dictionary 
    # + typeFormat - Text pronunciation type 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getTextPronunciations(string word, string useCanonical = "false", string? sourceDictionary = (), string? typeFormat = (), int 'limit = 50) returns TextPron[]|error {
        string  path = string `/word.json/${word}/pronunciations`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "sourceDictionary": sourceDictionary, "typeFormat": typeFormat, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        TextPron[] response = check self.clientEp-> get(path, targetType = TextPronArr);
        return response;
    }
    # Given a word as a string, returns relationships from the Word Graph
    #
    # + word - Word to fetch relationships for 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + relationshipTypes - Limits the total results per type of relationship type 
    # + limitPerRelationshipType - Restrict to the supplied relatinship types 
    # + return - No response was specified 
    remote isolated function getRelatedWords(string word, string useCanonical = "false", string? relationshipTypes = (), int limitPerRelationshipType = 10) returns Related[]|error {
        string  path = string `/word.json/${word}/relatedWords`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "relationshipTypes": relationshipTypes, "limitPerRelationshipType": limitPerRelationshipType, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Related[] response = check self.clientEp-> get(path, targetType = RelatedArr);
        return response;
    }
    # Returns the Scrabble score for a word
    #
    # + word - Word to get scrabble score for. 
    # + return - No response was specified 
    remote isolated function getScrabbleScore(string word) returns int|error {
        string  path = string `/word.json/${word}/scrabbleScore`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        int response = check self.clientEp-> get(path, targetType = int);
        return response;
    }
    # Returns a top example for a word
    #
    # + word - Word to fetch examples for 
    # + useCanonical - If true will try to return the correct word root ('cats' -> 'cat'). If false returns exactly what was requested. 
    # + return - No response was specified 
    remote isolated function getTopExample(string word, string useCanonical = "false") returns Example|error {
        string  path = string `/word.json/${word}/topExample`;
        map<anydata> queryParam = {"useCanonical": useCanonical, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        Example response = check self.clientEp-> get(path, targetType = Example);
        return response;
    }
    # Fetches a WordList by ID
    #
    # + permalink - permalink of WordList to fetch 
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + return - No response was specified 
    remote isolated function getWordListByPermalink(string permalink, string authToken) returns WordList|error {
        string  path = string `/wordList.json/${permalink}`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WordList response = check self.clientEp-> get(path, accHeaders, targetType = WordList);
        return response;
    }
    # Updates an existing WordList
    #
    # + permalink - permalink of WordList to update 
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + payload - Updated WordList 
    # + return - No response was specified 
    remote isolated function updateWordList(string permalink, string authToken, WordList payload) returns json|error {
        string  path = string `/wordList.json/${permalink}`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->put(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Deletes an existing WordList
    #
    # + permalink - ID of WordList to delete 
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + return - No response was specified 
    remote isolated function deleteWordList(string permalink, string authToken) returns json|error {
        string  path = string `/wordList.json/${permalink}`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        //TODO: Update the request as needed;
        json response = check self.clientEp-> delete(path, request, headers = accHeaders, targetType = json);
        return response;
    }
    # Removes words from a WordList
    #
    # + permalink - permalink of WordList to use 
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + payload - Words to remove from WordList 
    # + return - No response was specified 
    remote isolated function deleteWordsFromWordList(string permalink, string authToken, StringValue[] payload) returns json|error {
        string  path = string `/wordList.json/${permalink}/deleteWords`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Fetches words in a WordList
    #
    # + permalink - ID of WordList to use 
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + sortBy - Field to sort by 
    # + sortOrder - Direction to sort 
    # + skip - Results to skip 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getWordListWords(string permalink, string authToken, string sortBy = "createDate", string sortOrder = "desc", int skip = 0, int 'limit = 100) returns WordListWord[]|error {
        string  path = string `/wordList.json/${permalink}/words`;
        map<anydata> queryParam = {"sortBy": sortBy, "sortOrder": sortOrder, "skip": skip, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        WordListWord[] response = check self.clientEp-> get(path, accHeaders, targetType = WordListWordArr);
        return response;
    }
    # Adds words to a WordList
    #
    # + permalink - permalink of WordList to user 
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + payload - Array of words to add to WordList 
    # + return - No response was specified 
    remote isolated function addWordsToWordList(string permalink, string authToken, StringValue[] payload) returns json|error {
        string  path = string `/wordList.json/${permalink}/words`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        json response = check self.clientEp->post(path, request, headers = accHeaders, targetType=json);
        return response;
    }
    # Creates a WordList.
    #
    # + authToken - The auth token of the logged-in user, obtained by calling /account.{format}/authenticate/{username} (described above) 
    # + payload - WordList to create 
    # + return - No response was specified 
    remote isolated function createWordList(string authToken, WordList payload) returns WordList|error {
        string  path = string `/wordLists.json`;
        map<anydata> queryParam = {"api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        map<any> headerValues = {"auth_token": authToken};
        map<string|string[]> accHeaders = getMapForHeaders(headerValues);
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        request.setPayload(jsonBody);
        WordList response = check self.clientEp->post(path, request, headers = accHeaders, targetType=WordList);
        return response;
    }
    # Returns a single random WordObject
    #
    # + hasDictionaryDef - Only return words with dictionary definitions 
    # + includePartOfSpeech - CSV part-of-speech values to include (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + excludePartOfSpeech - CSV part-of-speech values to exclude (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + minCorpusCount - Minimum corpus frequency for terms 
    # + maxCorpusCount - Maximum corpus frequency for terms 
    # + minDictionaryCount - Minimum dictionary count 
    # + maxDictionaryCount - Maximum dictionary count 
    # + minLength - Minimum word length 
    # + maxLength - Maximum word length 
    # + return - No response was specified 
    remote isolated function getRandomWord(string hasDictionaryDef = "true", string? includePartOfSpeech = (), string? excludePartOfSpeech = (), int minCorpusCount = 0, int maxCorpusCount = -1, int minDictionaryCount = 1, int maxDictionaryCount = -1, int minLength = 5, int maxLength = -1) returns WordObject|error {
        string  path = string `/words.json/randomWord`;
        map<anydata> queryParam = {"hasDictionaryDef": hasDictionaryDef, "includePartOfSpeech": includePartOfSpeech, "excludePartOfSpeech": excludePartOfSpeech, "minCorpusCount": minCorpusCount, "maxCorpusCount": maxCorpusCount, "minDictionaryCount": minDictionaryCount, "maxDictionaryCount": maxDictionaryCount, "minLength": minLength, "maxLength": maxLength, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        WordObject response = check self.clientEp-> get(path, targetType = WordObject);
        return response;
    }
    # Returns an array of random WordObjects
    #
    # + hasDictionaryDef - Only return words with dictionary definitions 
    # + includePartOfSpeech - CSV part-of-speech values to include (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + excludePartOfSpeech - CSV part-of-speech values to exclude (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + minCorpusCount - Minimum corpus frequency for terms 
    # + maxCorpusCount - Maximum corpus frequency for terms 
    # + minDictionaryCount - Minimum dictionary count 
    # + maxDictionaryCount - Maximum dictionary count 
    # + minLength - Minimum word length 
    # + maxLength - Maximum word length 
    # + sortBy - Attribute to sort by 
    # + sortOrder - Sort direction 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function getRandomWords(string hasDictionaryDef = "true", string? includePartOfSpeech = (), string? excludePartOfSpeech = (), int minCorpusCount = 0, int maxCorpusCount = -1, int minDictionaryCount = 1, int maxDictionaryCount = -1, int minLength = 5, int maxLength = -1, string? sortBy = (), string? sortOrder = (), int 'limit = 10) returns WordObject[]|error {
        string  path = string `/words.json/randomWords`;
        map<anydata> queryParam = {"hasDictionaryDef": hasDictionaryDef, "includePartOfSpeech": includePartOfSpeech, "excludePartOfSpeech": excludePartOfSpeech, "minCorpusCount": minCorpusCount, "maxCorpusCount": maxCorpusCount, "minDictionaryCount": minDictionaryCount, "maxDictionaryCount": maxDictionaryCount, "minLength": minLength, "maxLength": maxLength, "sortBy": sortBy, "sortOrder": sortOrder, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        WordObject[] response = check self.clientEp-> get(path, targetType = WordObjectArr);
        return response;
    }
    # Reverse dictionary search
    #
    # + query - Search term 
    # + findSenseForWord - Restricts words and finds closest sense 
    # + includeSourceDictionaries - Only include these comma-delimited source dictionaries 
    # + excludeSourceDictionaries - Exclude these comma-delimited source dictionaries 
    # + includePartOfSpeech - Only include these comma-delimited parts of speech (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + excludePartOfSpeech - Exclude these comma-delimited parts of speech (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + minCorpusCount - Minimum corpus frequency for terms 
    # + maxCorpusCount - Maximum corpus frequency for terms 
    # + minLength - Minimum word length 
    # + maxLength - Maximum word length 
    # + expandTerms - Expand terms 
    # + includeTags - Return a closed set of XML tags in response 
    # + sortBy - Attribute to sort by 
    # + sortOrder - Sort direction 
    # + skip - Results to skip 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function reverseDictionary(string query, string? findSenseForWord = (), string? includeSourceDictionaries = (), string? excludeSourceDictionaries = (), string? includePartOfSpeech = (), string? excludePartOfSpeech = (), int minCorpusCount = 5, int maxCorpusCount = -1, int minLength = 1, int maxLength = -1, string? expandTerms = (), string includeTags = "false", string? sortBy = (), string? sortOrder = (), string skip = "0", int 'limit = 10) returns DefinitionSearchResults|error {
        string  path = string `/words.json/reverseDictionary`;
        map<anydata> queryParam = {"query": query, "findSenseForWord": findSenseForWord, "includeSourceDictionaries": includeSourceDictionaries, "excludeSourceDictionaries": excludeSourceDictionaries, "includePartOfSpeech": includePartOfSpeech, "excludePartOfSpeech": excludePartOfSpeech, "minCorpusCount": minCorpusCount, "maxCorpusCount": maxCorpusCount, "minLength": minLength, "maxLength": maxLength, "expandTerms": expandTerms, "includeTags": includeTags, "sortBy": sortBy, "sortOrder": sortOrder, "skip": skip, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        DefinitionSearchResults response = check self.clientEp-> get(path, targetType = DefinitionSearchResults);
        return response;
    }
    # Searches words
    #
    # + query - Search query 
    # + allowRegex - Search term is a Regular Expression 
    # + caseSensitive - Search case sensitive 
    # + includePartOfSpeech - Only include these comma-delimited parts of speech (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + excludePartOfSpeech - Exclude these comma-delimited parts of speech (allowable values are noun, adjective, verb, adverb, interjection, pronoun, preposition, abbreviation, affix, article, auxiliary-verb, conjunction, definite-article, family-name, given-name, idiom, imperative, noun-plural, noun-posessive, past-participle, phrasal-prefix, proper-noun, proper-noun-plural, proper-noun-posessive, suffix, verb-intransitive, verb-transitive) 
    # + minCorpusCount - Minimum corpus frequency for terms 
    # + maxCorpusCount - Maximum corpus frequency for terms 
    # + minDictionaryCount - Minimum number of dictionary entries for words returned 
    # + maxDictionaryCount - Maximum dictionary definition count 
    # + minLength - Minimum word length 
    # + maxLength - Maximum word length 
    # + skip - Results to skip 
    # + 'limit - Maximum number of results to return 
    # + return - No response was specified 
    remote isolated function searchWords(string query, string allowRegex = "false", string caseSensitive = "true", string? includePartOfSpeech = (), string? excludePartOfSpeech = (), int minCorpusCount = 5, int maxCorpusCount = -1, int minDictionaryCount = 1, int maxDictionaryCount = -1, int minLength = 1, int maxLength = -1, int skip = 0, int 'limit = 10) returns WordSearchResults|error {
        string  path = string `/words.json/search/${query}`;
        map<anydata> queryParam = {"allowRegex": allowRegex, "caseSensitive": caseSensitive, "includePartOfSpeech": includePartOfSpeech, "excludePartOfSpeech": excludePartOfSpeech, "minCorpusCount": minCorpusCount, "maxCorpusCount": maxCorpusCount, "minDictionaryCount": minDictionaryCount, "maxDictionaryCount": maxDictionaryCount, "minLength": minLength, "maxLength": maxLength, "skip": skip, "limit": 'limit, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        WordSearchResults response = check self.clientEp-> get(path, targetType = WordSearchResults);
        return response;
    }
    # Returns a specific WordOfTheDay
    #
    # + date - Fetches by date in yyyy-MM-dd 
    # + return - No response was specified 
    remote isolated function getWordOfTheDay(string? date = ()) returns WordOfTheDay|error {
        string  path = string `/words.json/wordOfTheDay`;
        map<anydata> queryParam = {"date": date, "api_key": self.apiKeys["api_key"]};
        path = path + check getPathForQueryParam(queryParam);
        WordOfTheDay response = check self.clientEp-> get(path, targetType = WordOfTheDay);
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

# Generate header map for given header values.
#
# + headerParam - Headers  map 
# + return - Returns generated map or error at failure of client initialization 
isolated function  getMapForHeaders(map<any> headerParam)  returns  map<string|string[]> {
    map<string|string[]> headerMap = {};
    foreach  var [key, value] in  headerParam.entries() {
        if  value  is  string ||  value  is  string[] {
            headerMap[key] = value;
        }
    }
    return headerMap;
}
