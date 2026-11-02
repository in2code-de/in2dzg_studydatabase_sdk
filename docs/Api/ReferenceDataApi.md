# In2code\In2DzgStudyDatabase\ReferenceDataApi



All URIs are relative to /api/v1, except if the operation defines another base path.

| Method | HTTP request | Description |
| ------------- | ------------- | ------------- |
| [**listIllnesses()**](ReferenceDataApi.md#listIllnesses) | **GET** /illness/list | List illnesses |
| [**listStudyCenters()**](ReferenceDataApi.md#listStudyCenters) | **GET** /study-center/list | List study centers |


## `listIllnesses()`

```php
listIllnesses($acceptLanguage, $pagination, $orderings, $filterSearch, $filterArea): \In2code\In2DzgStudyDatabase\Model\IllnessCollection
```

List illnesses

Illnesses with their illness areas, sorted by id without `orderings`.

### Example

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

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |
| **pagination** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter**](../Model/.md)| Pagination as &#x60;pagination[page]&#x60; (page number from 1) and &#x60;pagination[itemsPerPage]&#x60; (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400. | [optional] |
| **orderings** | [**\In2code\In2DzgStudyDatabase\Model\ListIllnessesOrderingsParameter**](../Model/.md)| Sorting as &#x60;orderings[&lt;field&gt;]&#x3D;asc|desc&#x60;, several fields in the order of the request (&#x60;orderings[name]&#x3D;desc&amp;orderings[snomedCode]&#x3D;asc&#x60;). Ties are broken by id. Unknown fields or directions result in 400. | [optional] |
| **filterSearch** | **string**| Full-text search in name, synonyms, ICD-10 and SNOMED code | [optional] |
| **filterArea** | **int**| Uid of an illness area the illness is assigned to | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\IllnessCollection**](../Model/IllnessCollection.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)

## `listStudyCenters()`

```php
listStudyCenters($acceptLanguage, $pagination, $orderings, $filterSearch): \In2code\In2DzgStudyDatabase\Model\StudyCenterCollection
```

List study centers

Study centers, sorted by id without `orderings`.

### Example

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
$orderings = {"zip":"asc"}; // \In2code\In2DzgStudyDatabase\Model\ListStudyCentersOrderingsParameter | Sorting as `orderings[<field>]=asc|desc`, several fields in the order of the request (`orderings[name]=desc&orderings[region]=asc`). Ties are broken by id. Unknown fields or directions result in 400.
$filterSearch = Berlin; // string | Full-text search in name, address, postal code, city, region, phone, fax, email and website

try {
    $result = $apiInstance->listStudyCenters($acceptLanguage, $pagination, $orderings, $filterSearch);
    print_r($result);
} catch (Exception $e) {
    echo 'Exception when calling ReferenceDataApi->listStudyCenters: ', $e->getMessage(), PHP_EOL;
}
```

### Parameters

| Name | Type | Description  | Notes |
| ------------- | ------------- | ------------- | ------------- |
| **acceptLanguage** | **string**| Preferred language according to RFC 9110, weights allowed (&#x60;de;q&#x3D;0.5, en&#x60;). Regions are reduced to the language (&#x60;en-GB&#x60; delivers &#x60;en-US&#x60;). Without a matching language, German. | [optional] |
| **pagination** | [**\In2code\In2DzgStudyDatabase\Model\ListStudiesPaginationParameter**](../Model/.md)| Pagination as &#x60;pagination[page]&#x60; (page number from 1) and &#x60;pagination[itemsPerPage]&#x60; (items per page, 1 to 100). An empty value counts as not set. Other keys, a non-integer or a value out of range result in 400. | [optional] |
| **orderings** | [**\In2code\In2DzgStudyDatabase\Model\ListStudyCentersOrderingsParameter**](../Model/.md)| Sorting as &#x60;orderings[&lt;field&gt;]&#x3D;asc|desc&#x60;, several fields in the order of the request (&#x60;orderings[name]&#x3D;desc&amp;orderings[region]&#x3D;asc&#x60;). Ties are broken by id. Unknown fields or directions result in 400. | [optional] |
| **filterSearch** | **string**| Full-text search in name, address, postal code, city, region, phone, fax, email and website | [optional] |

### Return type

[**\In2code\In2DzgStudyDatabase\Model\StudyCenterCollection**](../Model/StudyCenterCollection.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: `application/json`

[[Back to top]](#) [[Back to API list]](../../README.md#endpoints)
[[Back to Model list]](../../README.md#models)
[[Back to README]](../../README.md)
