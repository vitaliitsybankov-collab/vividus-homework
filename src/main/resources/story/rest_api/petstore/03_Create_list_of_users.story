Description: Task 3.3 - Verify a list of users can be created

Scenario: Verify multiple users can be created in a single request
Given I initialize scenario variable `username1` with value `#{generate(Name.username)}`
Given I initialize scenario variable `username2` with value `#{generate(Name.username)}`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
Given request body: [
  {
    "id": 0,
    "username": "${username1}",
    "firstName": "Anna",
    "lastName": "Smith",
    "email": "${username1}@example.com",
    "password": "Password123!",
    "phone": "1234567890",
    "userStatus": 1
  },
  {
    "id": 0,
    "username": "${username2}",
    "firstName": "Mark",
    "lastName": "Jones",
    "email": "${username2}@example.com",
    "password": "Password123!",
    "phone": "1234567890",
    "userStatus": 1
  }
]
When I execute HTTP POST request for resource with relative URL `/user/createWithList`
Then `${responseCode}` is equal to `200`

When I execute HTTP GET request for resource with relative URL `/user/${username1}`
Then `${responseCode}` is equal to `200`
Then JSON element value from `${response}` by JSON path `$.username` is equal to `${username1}`

When I execute HTTP GET request for resource with relative URL `/user/${username2}`
Then `${responseCode}` is equal to `200`
Then JSON element value from `${response}` by JSON path `$.username` is equal to `${username2}`
