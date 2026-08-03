# Automation Tests Hometask (SQE L&D Mentoring Program)

Vividus-based test automation project covering:

- **Task 1 — UI**: 9 scenarios against [EPAM.com](https://www.epam.com) (`src/main/resources/story/web_app/epam`)
- **Task 2 — UI**: 9 scenarios against the [Tricentis Demo Web Shop](https://demowebshop.tricentis.com) (`src/main/resources/story/web_app/shop`)
- **Task 3 — API**: 8 scenarios against the [Petstore Swagger API](https://petstore.swagger.io) (`src/main/resources/story/rest_api/petstore`)

## Prerequisites

- Git, Java 21, Google Chrome (latest) — see the official
  [Getting Started guide](https://docs.vividus.dev/vividus/latest/getting-started.html).

## Setup

```shell
git clone --recursive <this-repo-url>.git
cd vividus-automation-hometask
./gradlew build
```

If you didn't clone with `--recursive`, initialize the build-system submodule separately:

```shell
git submodule update --init --recursive
```

## Running the suites

Each task is its own **configuration set**, selected via `configuration-set.active`
in `src/main/resources/overriding.properties` (or as a CLI/system property):

```shell
# Task 1 - EPAM.com UI
./gradlew runStories -Dconfiguration-set.active=web-app-epam

# Task 2 - Demo e-shop UI
./gradlew runStories -Dconfiguration-set.active=web-app-shop

# Task 3 - Petstore API
./gradlew runStories -Dconfiguration-set.active=rest-api-petstore
```

After each run, Vividus prints a link to the generated Allure report.


## Acceptance criteria checklist

- [ ] All 26 test cases automated and passing locally
- [ ] Project pushed to your own GitHub repository
- [ ] Repository link sent to the mentor for review
