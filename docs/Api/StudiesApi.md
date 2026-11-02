# In2code\In2DzgStudyDatabase\StudiesApi

Studies of the database, list and detail view

All URIs are relative to /api/v1, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getStudy()**](StudiesApi.md#getStudy) | **GET** /study/{uid} | Study details |
| [**listStudies()**](StudiesApi.md#listStudies) | **GET** /study/list | List studies |


## `getStudy()`

```php
getStudy($uid, $acceptLanguage): \In2code\In2DzgStudyDatabase\Model\Study
```

Study details

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\StudiesApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$uid = 1; // int | Uid of the study record
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.

try {
    $result = $apiInstance->getStudy($uid, $acceptLanguage);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling StudiesApi->getStudy: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **uid** | **int**| Uid of the study record | |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\Study**](../Model/Study.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `listStudies()`

```php
listStudies($acceptLanguage, $pagination, $orderings, $filterSearch, $filterIllnessAreas, $filterIllnessIndications, $filterType, $filterPhase, $filterInterventionType, $filterRecruitingState, $filterStudyCenters): \In2code\In2DzgStudyDatabase\Model\StudyCollection
```

List studies

Returns the visible studies, sorted by id without `orderings`. All filters are combined with AND; several uids within one filter with OR.  Prefilled is the example \"all open diabetes studies, 10 per page, by study start descending\": `/study/list?filter[illnessAreas]=5&filter[recruitingState]=11&orderings[start]=desc&pagination[page]=1&pagination[itemsPerPage]=10`. The uids (illness area \"Diabetes & Stoffwechsel\", recruiting state \"Teilnehmende gesucht\") come from `GET /study/category/illnessArea` and `GET /study/category/recruitingState`.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\StudiesApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.
$pagination = {"page":1,"itemsPerPage":10}; // \In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter | Pagination as `pagination[page]` (page number from 1) and `pagination[itemsPerPage]` (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400.
$orderings = {"start":"desc"}; // \In2code\In2DzgStudyDatabase\Model\ListStudiesOrderingsParameter | Sorting as `orderings[<field>]=asc|desc`, several fields in the order of the request (`orderings[readableTitle]=desc&orderings[updated]=asc`). Ties are broken by id. Unknown fields or directions result in 400.  `start`/`end` are study start and end (`period`), `created`/`updated` the creation and last modification of the record. Studies without a date have the value 0 and come first when sorting ascending.
$filterSearch = 'filterSearch_example'; // string | Full-text search in readable and original title, goal, short description, placebo description, search words, illness suggestion and intervention description
$filterIllnessAreas = 5; // \In2code\In2DzgStudyDatabase\Model\UidList | Uids of illness areas, as a comma-separated list (`1,2`) or as an array (`filter[illnessAreas][]=1&filter[illnessAreas][]=2`). A study matches as soon as one of the areas is assigned to it as its area or as a further affected area.
$filterIllnessIndications = new \In2code\In2DzgStudyDatabase\Model\\In2code\In2DzgStudyDatabase\Model\UidList(); // \In2code\In2DzgStudyDatabase\Model\UidList | Uids of illnesses, as a comma-separated list or as an array. A study matches as soon as it is assigned to at least one of the illnesses.
$filterType = 56; // int | Uid of the study type category
$filterPhase = 56; // int | Uid of the study phase
$filterInterventionType = 56; // int | Uid of the intervention category
$filterRecruitingState = 11; // int | Uid of the recruiting state category
$filterStudyCenters = new \In2code\In2DzgStudyDatabase\Model\\In2code\In2DzgStudyDatabase\Model\UidList(); // \In2code\In2DzgStudyDatabase\Model\UidList | Uids of study centers from `GET /study-center/list`, as a comma-separated list or as an array. A study matches as soon as it is conducted at at least one of the centers, e.g. for a portal showing the studies of its own institution.

try {
    $result = $apiInstance->listStudies($acceptLanguage, $pagination, $orderings, $filterSearch, $filterIllnessAreas, $filterIllnessIndications, $filterType, $filterPhase, $filterInterventionType, $filterRecruitingState, $filterStudyCenters);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling StudiesApi->listStudies: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |
| **pagination** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter**](../Model/.md)| Pagination as &#x60;pagination[page]&#x60; (page number from 1) and &#x60;pagination[itemsPerPage]&#x60; (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400. | [optional] |
| **orderings** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesOrderingsParameter**](../Model/.md)| Sorting as &#x60;orderings[&lt;field&gt;]&#x3D;asc|desc&#x60;, several fields in the order of the request (&#x60;orderings[readableTitle]&#x3D;desc&amp;orderings[updated]&#x3D;asc&#x60;). Ties are broken by id. Unknown fields or directions result in 400.  &#x60;start&#x60;/&#x60;end&#x60; are study start and end (&#x60;period&#x60;), &#x60;created&#x60;/&#x60;updated&#x60; the creation and last modification of the record. Studies without a date have the value 0 and come first when sorting ascending. | [optional] |
| **filterSearch** | **string**| Full-text search in readable and original title, goal, short description, placebo description, search words, illness suggestion and intervention description | [optional] |
| **filterIllnessAreas** | [**\In2code\In2DzgStudyDatabase\Model\UidList**](../Model/.md)| Uids of illness areas, as a comma-separated list (&#x60;1,2&#x60;) or as an array (&#x60;filter[illnessAreas][]&#x3D;1&amp;filter[illnessAreas][]&#x3D;2&#x60;). A study matches as soon as one of the areas is assigned to it as its area or as a further affected area. | [optional] |
| **filterIllnessIndications** | [**\In2code\In2DzgStudyDatabase\Model\UidList**](../Model/.md)| Uids of illnesses, as a comma-separated list or as an array. A study matches as soon as it is assigned to at least one of the illnesses. | [optional] |
| **filterType** | **int**| Uid of the study type category | [optional] |
| **filterPhase** | **int**| Uid of the study phase | [optional] |
| **filterInterventionType** | **int**| Uid of the intervention category | [optional] |
| **filterRecruitingState** | **int**| Uid of the recruiting state category | [optional] |
| **filterStudyCenters** | [**\In2code\In2DzgStudyDatabase\Model\UidList**](../Model/.md)| Uids of study centers from &#x60;GET /study-center/list&#x60;, as a comma-separated list or as an array. A study matches as soon as it is conducted at at least one of the centers, e.g. for a portal showing the studies of its own institution. | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\StudyCollection**](../Model/StudyCollection.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
