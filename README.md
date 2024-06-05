---
title: Home
permalink: /
redirect_from:
  - /someengineering/
---

# Some Engineering Helm Chart Repository

![](https://user-images.githubusercontent.com/2124094/164599444-448f92f1-7a73-4a86-a377-bc650f10e756.png)

## Example Usage

```bash
$ helm repo add someengineering https://helm.some.engineering
$ helm upgrade --install --namespace fix --create-namespace fixinventory someengineering/fixinventory
# Wait for deployment to finish and pods to settle
# Run Fix Shell to configure the system
$ kubectl -n fix exec -it service/fixinventory-fixcore -- fixsh
# Access the web interface to read the documentation and API docs or run Jupyter notebooks
$ kubectl -n fix port-forward services/fixinventory-fixcore 8900:8900
```
Open https://127.0.0.1:8900 in your browser. Ignore the self-signed cert or alternatively fetch https://127.0.0.1:8900/ca/cert and compare its fingerprint with the one returned in the `SHA256-Fingerprint` header.
Then validate the connection using the `Authorization` header which contains a JWT signed by Fix Core using the pre-shared-key (PSK). The JWT payload contains a field sha256_fingerprint
which should match the fingerprint of the certificate (and the http header). The PSK can be found in the `fixinventory-psk` secret (e.g. `kubectl -n fix get secrets/fixinventory-psk -o json | jq -r .data.psk | base64 -d; echo`).

Read more on how security between Fix components is bootstrapped at https://inventory.fix.security/reference/security

## Charts

### [`fixinventory`](./someengineering/fixinventory/README.md)

- [Chart documentation](./someengineering/fixinventory/README.md)
- [Installation instructions](https://inventory.fix.security)

## Contact

Have questions or need help? [Join us in the Some Engineering Discord server](https://discord.gg/someengineering) or [open a GitHub issue](https://github.com/someengineering/helm-charts/issues/new).

## License

```
Copyright 2022 Some Engineering Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
