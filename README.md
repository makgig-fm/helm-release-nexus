# Helm Release Nexus

Build lint and publish own chart to Nexus helm repo with support context path.

## Usage
Using action with context path
```yaml
steps:
  - name: Build and Publish to Nexus
      uses: makgig-fm/helm-release-nexus@v1
      with:
        username: ${{ secrets.HELM_USR }}
        password: ${{ secrets.HELM_PSW }}
        registry-url: http(s)://you.nexusHelmRepo.url/repository/helm/
        context-path: /repository/helm/
```
### Parameters

| Key | Value                                                                                       | Required | Default |
| ------------- |---------------------------------------------------------------------------------------------| ------------- | ------------- |
| `username` | Username for registry                                                                       | **Yes** | "" |
| `password` | Password for registry                                                                       | **Yes** | "" |
| `registry-url` | Registry url                                                                                | **Yes** | "" |
| `context-path` | Set helm context path                                               | No | "" |

## TODO
