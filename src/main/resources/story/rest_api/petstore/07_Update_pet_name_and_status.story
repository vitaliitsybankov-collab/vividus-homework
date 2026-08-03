Description: Task 3.7 - Verify a pet's name and status can be updated

Scenario: Create a pet to update
Given I initialize scenario variable `pet-name` with value `#{generate(Name.firstName)}`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
Given request body: {
  "id": 0,
  "name": "${pet-name}",
  "photoUrls": [],
  "status": "available"
}
When I execute HTTP POST request for resource with relative URL `/pet`
Then `${responseCode}` is equal to `200`
When I save JSON element value from `${response}` by JSON path `$.id` to story variable `pet-id`

Scenario: Verify the pet's name and status can be updated
Given I initialize scenario variable `updated-name` with value `#{generate(Name.firstName)}`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
Given request body: {
  "id": ${pet-id},
  "name": "${updated-name}",
  "photoUrls": [],
  "status": "sold"
}
When I execute HTTP PUT request for resource with relative URL `/pet`
Then `${responseCode}` is equal to `200`
Then JSON element value from `${response}` by JSON path `$.name` is equal to `${updated-name}`
Then JSON element value from `${response}` by JSON path `$.status` is equal to `sold`

When I execute HTTP GET request for resource with relative URL `/pet/${pet-id}`
Then `${responseCode}` is equal to `200`
Then JSON element value from `${response}` by JSON path `$.name` is equal to `${updated-name}`
Then JSON element value from `${response}` by JSON path `$.status` is equal to `sold`
