Description: Task 3.8 - Verify a pet can be deleted

Scenario: Create a pet to delete
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

Scenario: Verify the pet can be deleted
When I execute HTTP DELETE request for resource with relative URL `/pet/${pet-id}`
Then `${responseCode}` is equal to `200`

When I execute HTTP GET request for resource with relative URL `/pet/${pet-id}`
Then `${responseCode}` is equal to `404`
