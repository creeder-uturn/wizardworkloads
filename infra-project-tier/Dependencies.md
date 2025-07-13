# Dependencies

Some projects may depend on other projects being run first. There are several options for orchestrating this long term, but documenting dependencies is always recommended.

## Current Dependencies

The following dependencies exist in these projects:

- A given region's `network` must be deployed before any other resources in that region.
- `global/service_iam_roles` must be deployed before any `website_service`.

