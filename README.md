# create-push-subscription
A GitHub action that creates a Google Pub/Sub push subscription for an Octue service.

## Usage
To automatically create a push subscription on e.g. pull request merge / package release, add the following to your
GitHub Actions workflow:

```yaml
permissions:
  id-token: write
  contents: read

steps:
  - uses: actions/checkout@v3

  - name: Authenticate with Google Cloud
    uses: google-github-actions/auth@v0.8.1
    with:
      create_credentials_file: true
      workload_identity_provider: 'projects/<project-id>/locations/global/workloadIdentityPools/<pool-name>/providers/<provider-name>'
      service_account: '<service-account>@<project-name>.iam.gserviceaccount.com'

  - name: Get package version
    id: get-package-version
    run: echo "PACKAGE_VERSION=$(poetry version -s)" >> $GITHUB_OUTPUT
    # run: echo "PACKAGE_VERSION=$(python setup.py --version)" >> $GITHUB_OUTPUT  <- Use this instead if your package uses a `setup.py` file.

  - uses: octue/create-push-subscription@0.2.2
    with:
      project_name: <project-name>
      service_namespace: my-org
      service_name: my-service
      service_revision_tag: ${{ steps.get-package-version.outputs.PACKAGE_VERSION }}
      push_endpoint: https://example.com/endpoint

```
