Description: Task 3.5 - Verify a new pet can be added

Scenario: Verify a new pet can be added to the store
Given I initialize scenario variable `pet-name` with value `#{generate(Name.firstName)}`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
Given request body: {
  "id": 0,
  "category": {
    "id": 1,
    "name": "dogs"
  },
  "name": "${pet-name}",
  "photoUrls": [
    "https://example.com/photo.jpg"
  ],
  "tags": [
    {
      "id": 0,
      "name": "friendly"
    }
  ],
  "status": "available"
}
When I execute HTTP POST request for resource with relative URL `/pet`
Then `${responseCode}` is equal to `200`
When I save JSON element value from `${response}` by JSON path `$.id` to scenario variable `pet-id`
Then JSON element value from `${response}` by JSON path `$.name` is equal to `${pet-name}`

When I execute HTTP GET request for resource with relative URL `/pet/${pet-id}`
Then `${responseCode}` is equal to `200`
Then JSON element value from `${response}` by JSON path `$.name` is equal to `${pet-name}`
