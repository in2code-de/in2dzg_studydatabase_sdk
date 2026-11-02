# OpenAPIClient-php

Read-only JSON interface of the cross-disease study portal.

All endpoints live below `/api/v1/` and are public; no authentication is required. The API is
strictly read-only.

**Use cases:** The central study portal, the decentralised portals of the centers and further
applications (e.g. apps) query the studies independently of platform and CMS, for example all
studies of an illness area that are open for recruitment (see the example at `GET /study/list`),
a single study by id, or the selection lists and reference data needed to build a filter form.

**Language:** The content language is chosen with the `Accept-Language` header
(e.g. `en`, `en-US` or `de;q=0.5, en`). German and English are supported; without a matching
language, German is delivered. The delivered language is stated in the `Content-Language`
header.

**Studies** are only delivered while they are published and their study period is running:
before the study start and from the study end on they are missing from lists, and the detail
endpoint answers with 404. Studies without a start or end are not restricted. Start and end
apply at minute precision: a study ending at 10:00:30 is no longer delivered from 10:01:00 on.

**Lists** are paginated (`pagination[page]`, `pagination[itemsPerPage]`, at most 100), can be
narrowed with `filter[...]` and sorted with `orderings[<field>]=asc|desc`, e.g.
`/study/list?orderings[start]=desc&pagination[itemsPerPage]=10`; without `orderings` they are
sorted by id. Unknown filters, ordering fields, pagination keys or invalid values are answered
with 400, as is any other unknown query parameter. Texts are sorted by their value in the
delivered language.

**Rate limit:** Each client IP may send 100 requests per minute across all endpoints
(sliding window). Beyond that, the API answers with 429 and states the seconds until the next
allowed request in the `Retry-After` header.

**Errors** are always delivered as JSON in the format `{\"error\": {\"status\", \"message\", \"details\"}}`:
400 for invalid parameters (`details` lists every violation), 404 for an unknown endpoint or
record, 405 for any method other than `GET`, 429 when the rate limit is exceeded and 500 for an
internal error, without technical details.

**Best practices**
- *Usage:* Ids are language-independent. The uids for the study filters are provided by the
  selection list and reference data endpoints; never hardcode uids in the client, look them up
  there instead.
- *Performance:* Only fetch as many items per page as are displayed, and store responses with
  their `ETag` and revalidate them via `If-None-Match` – a `304` has no body but still counts
  towards the rate limit. Selection lists and reference data change rarely.
- *Limits:* At most 100 items per page and 100 requests per minute per IP. Fetch large amounts
  of data page by page with pauses, and on 429 wait for `Retry-After` instead of retrying
  immediately.
- *Security:* The API only delivers published data intended for display. HTML-escape texts
  such as descriptions or criteria in the client before output.


For more information, please visit [https://www.in2code.de](https://www.in2code.de).

## Installation & Usage

### Requirements

PHP 8.1 and later.

### Composer

To install the bindings via [Composer](https://getcomposer.org/), add the following to `composer.json`:

```json
{
  "repositories": [
    {
      "type": "vcs",
      "url": "https://github.com/GIT_USER_ID/GIT_REPO_ID.git"
    }
  ],
  "require": {
    "GIT_USER_ID/GIT_REPO_ID": "*@dev"
  }
}
```

Then run `composer install`

### Manual Installation

Download the files and include `autoload.php`:

```php
<?php
require_once('/path/to/OpenAPIClient-php/vendor/autoload.php');
```

## Getting Started

Please follow the [installation procedure](#installation--usage) and then run the following:

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');




$apiInstance = new In2code\In2DzgStudyDatabase\Api\ReferenceDataApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.
$pagination = {"page":1,"itemsPerPage":10}; // \In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter | Pagination as `pagination[page]` (page number from 1) and `pagination[itemsPerPage]` (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400.
$orderings = {"name":"asc"}; // \In2code\In2DzgStudyDatabase\Model\ListIllnessesOrderingsParameter | Sorting as `orderings[<field>]=asc|desc`, several fields in the order of the request (`orderings[name]=desc&orderings[snomedCode]=asc`). Ties are broken by id. Unknown fields or directions result in 400.
$filterSearch = Zucker; // string | Full-text search in name, synonyms, ICD-10 and SNOMED code
$filterArea = 1; // int | Uid of an illness area the illness is assigned to

try {
    $result = $apiInstance->listIllnesses($acceptLanguage, $pagination, $orderings, $filterSearch, $filterArea);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ReferenceDataApi->listIllnesses: ', $e->getMessage(), PHP_EOL;
}

```

## API Endpoints

All URIs are relative to */api/v1*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ReferenceDataApi* | [**listIllnesses**](docs/Api/ReferenceDataApi.md#listillnesses) | **GET** /illness/list | List illnesses
*ReferenceDataApi* | [**listStudyCenters**](docs/Api/ReferenceDataApi.md#liststudycenters) | **GET** /study-center/list | List study centers
*SelectionListsApi* | [**getIllnessArea**](docs/Api/SelectionListsApi.md#getillnessarea) | **GET** /study/category/illnessArea/{uid} | Single illness area
*SelectionListsApi* | [**getPhase**](docs/Api/SelectionListsApi.md#getphase) | **GET** /study/category/phase/{uid} | Single study phase
*SelectionListsApi* | [**getStudyCategory**](docs/Api/SelectionListsApi.md#getstudycategory) | **GET** /study/category/{type}/{uid} | Single entry of a selection list
*SelectionListsApi* | [**listIllnessAreas**](docs/Api/SelectionListsApi.md#listillnessareas) | **GET** /study/category/illnessArea | Illness areas
*SelectionListsApi* | [**listPhases**](docs/Api/SelectionListsApi.md#listphases) | **GET** /study/category/phase | Study phases
*SelectionListsApi* | [**listStudyCategories**](docs/Api/SelectionListsApi.md#liststudycategories) | **GET** /study/category/{type} | Entries of a selection list
*StudiesApi* | [**getStudy**](docs/Api/StudiesApi.md#getstudy) | **GET** /study/{uid} | Study details
*StudiesApi* | [**listStudies**](docs/Api/StudiesApi.md#liststudies) | **GET** /study/list | List studies

## Models

- [Category](docs/Model/Category.md)
- [CategoryCollection](docs/Model/CategoryCollection.md)
- [CategoryFilter](docs/Model/CategoryFilter.md)
- [Compliance](docs/Model/Compliance.md)
- [Contact](docs/Model/Contact.md)
- [Criterion](docs/Model/Criterion.md)
- [CriterionType](docs/Model/CriterionType.md)
- [DurationUnit](docs/Model/DurationUnit.md)
- [Eligibility](docs/Model/Eligibility.md)
- [Error](docs/Model/Error.md)
- [ErrorError](docs/Model/ErrorError.md)
- [ErrorErrorDetailsInner](docs/Model/ErrorErrorDetailsInner.md)
- [Funding](docs/Model/Funding.md)
- [Gender](docs/Model/Gender.md)
- [Illness](docs/Model/Illness.md)
- [IllnessArea](docs/Model/IllnessArea.md)
- [IllnessAreaCollection](docs/Model/IllnessAreaCollection.md)
- [IllnessCollection](docs/Model/IllnessCollection.md)
- [IllnessFilter](docs/Model/IllnessFilter.md)
- [ListIllnessesOrderingsParameter](docs/Model/ListIllnessesOrderingsParameter.md)
- [ListPhasesOrderingsParameter](docs/Model/ListPhasesOrderingsParameter.md)
- [ListStudiesOrderingsParameter](docs/Model/ListStudiesOrderingsParameter.md)
- [ListStudiesPaginationParameter](docs/Model/ListStudiesPaginationParameter.md)
- [ListStudyCategoriesOrderingsParameter](docs/Model/ListStudyCategoriesOrderingsParameter.md)
- [ListStudyCentersOrderingsParameter](docs/Model/ListStudyCentersOrderingsParameter.md)
- [OrderingDirection](docs/Model/OrderingDirection.md)
- [OrderingsInner](docs/Model/OrderingsInner.md)
- [Pagination](docs/Model/Pagination.md)
- [Phase](docs/Model/Phase.md)
- [PhaseCollection](docs/Model/PhaseCollection.md)
- [Placebo](docs/Model/Placebo.md)
- [RegisterId](docs/Model/RegisterId.md)
- [RegisterIdType](docs/Model/RegisterIdType.md)
- [Result](docs/Model/Result.md)
- [Study](docs/Model/Study.md)
- [StudyCenter](docs/Model/StudyCenter.md)
- [StudyCenterAssignment](docs/Model/StudyCenterAssignment.md)
- [StudyCenterCollection](docs/Model/StudyCenterCollection.md)
- [StudyCenterFilter](docs/Model/StudyCenterFilter.md)
- [StudyCollection](docs/Model/StudyCollection.md)
- [StudyFilter](docs/Model/StudyFilter.md)
- [StudyIllness](docs/Model/StudyIllness.md)
- [StudyListItem](docs/Model/StudyListItem.md)
- [StudyListPeriod](docs/Model/StudyListPeriod.md)
- [StudyPeriod](docs/Model/StudyPeriod.md)
- [StudyPlacebo](docs/Model/StudyPlacebo.md)
- [UidList](docs/Model/UidList.md)

## Authorization
Endpoints do not require authorization.

## Tests

To run the tests, use:

```bash
composer install
vendor/bin/phpunit
```

## Author



## About this package

This PHP package is automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: `1.0.0`
    - Package version: `1.0.0`
    - Generator version: `7.27.0`
- Build package: `org.openapitools.codegen.languages.PhpClientCodegen`
