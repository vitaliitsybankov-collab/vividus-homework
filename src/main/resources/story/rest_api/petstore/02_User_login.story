Description: Task 3.2 - Verify a user can log in

Scenario: Verify user login returns a session token
Given I initialize scenario variable `username` with value `#{generate(Name.username)}`
When I set request headers:
|name        |value           |
|Content-Type|application/json|
Given request body: {
  "id": 0,
  "username": "${username}",
  "firstName": "John",
  "lastName": "Doe",
  "email": "${username}@example.com",
  "password": "Password123!",
  "phone": "1234567890",
  "userStatus": 1
}
When I execute HTTP POST request for resource with relative URL `/user`
Then `${responseCode}` is equal to `200`

When I execute HTTP GET request for resource with relative URL `/user/login?username=${username}&password=Password123!`
Then `${responseCode}` is equal to `200`
When I save JSON element value from `${response}` by JSON path `$.message` to scenario variable `login-message`
Then `${login-message}` matches `logged in user session:.*`
