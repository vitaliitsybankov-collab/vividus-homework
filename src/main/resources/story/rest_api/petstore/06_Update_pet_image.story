Description: Task 3.6 - Verify a pet's image can be updated
!-- Uses the placeholder image at src/main/resources/data/pet-photo.png; replace it with a
!-- real sample image if desired.

Scenario: Create a pet to update its image
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

Scenario: Verify the pet's image can be uploaded/updated
Given multipart request:
|type|name           |value           |contentType|fileName      |
|file|file           |/data/pet-photo.png|image/png|pet-photo.png|
|string|additionalMetadata|automated upload|text/plain|              |
When I execute HTTP POST request for resource with relative URL `/pet/${pet-id}/uploadImage`
Then `${responseCode}` is equal to `200`
When I save JSON element value from `${response}` by JSON path `$.message` to scenario variable `upload-message`
Then `${upload-message}` matches `.*[Ff]ile uploaded.*`
