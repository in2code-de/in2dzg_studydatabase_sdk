# In2code\In2DzgStudyDatabase\SelectionListsApi



All URIs are relative to /api/v1, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**getIllnessArea()**](SelectionListsApi.md#getIllnessArea) | **GET** /study/category/illnessArea/{uid} | Single illness area |
| [**getPhase()**](SelectionListsApi.md#getPhase) | **GET** /study/category/phase/{uid} | Single study phase |
| [**getStudyCategory()**](SelectionListsApi.md#getStudyCategory) | **GET** /study/category/{type}/{uid} | Single entry of a selection list |
| [**listIllnessAreas()**](SelectionListsApi.md#listIllnessAreas) | **GET** /study/category/illnessArea | Illness areas |
| [**listPhases()**](SelectionListsApi.md#listPhases) | **GET** /study/category/phase | Study phases |
| [**listStudyCategories()**](SelectionListsApi.md#listStudyCategories) | **GET** /study/category/{type} | Entries of a selection list |


## `getIllnessArea()`

```php
getIllnessArea($uid, $acceptLanguage): \In2code\In2DzgStudyDatabase\Model\IllnessArea
```

Single illness area

Illness area with icon.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\SelectionListsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$uid = 1; // int
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.

try {
    $result = $apiInstance->getIllnessArea($uid, $acceptLanguage);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling SelectionListsApi->getIllnessArea: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **uid** | **int**|  | |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\IllnessArea**](../Model/IllnessArea.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getPhase()`

```php
getPhase($uid, $acceptLanguage): \In2code\In2DzgStudyDatabase\Model\Phase
```

Single study phase

Study phase with explanatory text.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\SelectionListsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$uid = 1; // int
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.

try {
    $result = $apiInstance->getPhase($uid, $acceptLanguage);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling SelectionListsApi->getPhase: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **uid** | **int**|  | |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\Phase**](../Model/Phase.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `getStudyCategory()`

```php
getStudyCategory($type, $uid, $acceptLanguage): \In2code\In2DzgStudyDatabase\Model\Category
```

Single entry of a selection list

If the category does not belong to the requested type, the API answers with 404.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\SelectionListsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$type = type; // string | Selection list of the study. Phases and illness areas have their own endpoints.
$uid = 2; // int
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.

try {
    $result = $apiInstance->getStudyCategory($type, $uid, $acceptLanguage);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling SelectionListsApi->getStudyCategory: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **type** | **string**| Selection list of the study. Phases and illness areas have their own endpoints. | |
| **uid** | **int**|  | |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\Category**](../Model/Category.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `listIllnessAreas()`

```php
listIllnessAreas($acceptLanguage, $pagination, $orderings, $filterSearch): \In2code\In2DzgStudyDatabase\Model\IllnessAreaCollection
```

Illness areas

Illness areas, sorted by id without `orderings`. Searches the name.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\SelectionListsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.
$pagination = {"page":1,"itemsPerPage":10}; // \In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter | Pagination as `pagination[page]` (page number from 1) and `pagination[itemsPerPage]` (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400.
$orderings = {"name":"asc"}; // \In2code\In2DzgStudyDatabase\Model\ListPhasesOrderingsParameter | Sorting as `orderings[name]=asc|desc`. Ties are broken by id. Unknown fields or directions result in 400.
$filterSearch = 'filterSearch_example'; // string | Full-text search in the title or name

try {
    $result = $apiInstance->listIllnessAreas($acceptLanguage, $pagination, $orderings, $filterSearch);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling SelectionListsApi->listIllnessAreas: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |
| **pagination** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter**](../Model/.md)| Pagination as &#x60;pagination[page]&#x60; (page number from 1) and &#x60;pagination[itemsPerPage]&#x60; (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400. | [optional] |
| **orderings** | [**\In2code\In2DzgStudyDatabase\Model\ListPhasesOrderingsParameter**](../Model/.md)| Sorting as &#x60;orderings[name]&#x3D;asc|desc&#x60;. Ties are broken by id. Unknown fields or directions result in 400. | [optional] |
| **filterSearch** | **string**| Full-text search in the title or name | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\IllnessAreaCollection**](../Model/IllnessAreaCollection.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `listPhases()`

```php
listPhases($acceptLanguage, $pagination, $orderings, $filterSearch): \In2code\In2DzgStudyDatabase\Model\PhaseCollection
```

Study phases

Study phases with explanatory text, sorted by id without `orderings`. Searches name and explanatory text.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\SelectionListsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.
$pagination = {"page":1,"itemsPerPage":10}; // \In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter | Pagination as `pagination[page]` (page number from 1) and `pagination[itemsPerPage]` (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400.
$orderings = {"name":"asc"}; // \In2code\In2DzgStudyDatabase\Model\ListPhasesOrderingsParameter | Sorting as `orderings[name]=asc|desc`. Ties are broken by id. Unknown fields or directions result in 400.
$filterSearch = 'filterSearch_example'; // string | Full-text search in the title or name

try {
    $result = $apiInstance->listPhases($acceptLanguage, $pagination, $orderings, $filterSearch);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling SelectionListsApi->listPhases: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |
| **pagination** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter**](../Model/.md)| Pagination as &#x60;pagination[page]&#x60; (page number from 1) and &#x60;pagination[itemsPerPage]&#x60; (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400. | [optional] |
| **orderings** | [**\In2code\In2DzgStudyDatabase\Model\ListPhasesOrderingsParameter**](../Model/.md)| Sorting as &#x60;orderings[name]&#x3D;asc|desc&#x60;. Ties are broken by id. Unknown fields or directions result in 400. | [optional] |
| **filterSearch** | **string**| Full-text search in the title or name | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\PhaseCollection**](../Model/PhaseCollection.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `listStudyCategories()`

```php
listStudyCategories($type, $acceptLanguage, $pagination, $orderings, $filterSearch): \In2code\In2DzgStudyDatabase\Model\CategoryCollection
```

Entries of a selection list

Categories of a selection list, sorted by id without `orderings`. An unknown or unconfigured type results in 404.

### Example

```php
<?php
require_once(__DIR__ . '/vendor/autoload.php');



$apiInstance = new In2code\In2DzgStudyDatabase\Api\SelectionListsApi(
    // If you want use custom http client, pass your client which implements `GuzzleHttp\ClientInterface`.
    // This is optional, `GuzzleHttp\Client` will be used as default.
    new GuzzleHttp\Client()
);
$type = type; // string | Selection list of the study. Phases and illness areas have their own endpoints.
$acceptLanguage = en; // string | Preferred language according to RFC 9110, weights allowed (`de;q=0.5, en`). Regions are reduced to the language (`en-GB` delivers `en-US`). Without a matching language, German.
$pagination = {"page":1,"itemsPerPage":10}; // \In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter | Pagination as `pagination[page]` (page number from 1) and `pagination[itemsPerPage]` (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400.
$orderings = {"title":"asc"}; // \In2code\In2DzgStudyDatabase\Model\ListStudyCategoriesOrderingsParameter | Sorting as `orderings[title]=asc|desc`. Ties are broken by id. Unknown fields or directions result in 400.
$filterSearch = 'filterSearch_example'; // string | Full-text search in the title or name

try {
    $result = $apiInstance->listStudyCategories($type, $acceptLanguage, $pagination, $orderings, $filterSearch);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling SelectionListsApi->listStudyCategories: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **type** | **string**| Selection list of the study. Phases and illness areas have their own endpoints. | |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |
| **pagination** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter**](../Model/.md)| Pagination as &#x60;pagination[page]&#x60; (page number from 1) and &#x60;pagination[itemsPerPage]&#x60; (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400. | [optional] |
| **orderings** | [**\In2code\In2DzgStudyDatabase\Model\ListStudyCategoriesOrderingsParameter**](../Model/.md)| Sorting as &#x60;orderings[title]&#x3D;asc|desc&#x60;. Ties are broken by id. Unknown fields or directions result in 400. | [optional] |
| **filterSearch** | **string**| Full-text search in the title or name | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\CategoryCollection**](../Model/CategoryCollection.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
