# recrd/terraform/secrets

To be able to securely version control our Kubernetes Secrets we decided to use [Sealed Secrets][].
We regularly deploy Kubernetes Controllers using [Terraform Helm provider][].

Please deploy the linked controller in this project.

To validate the configuration generate a new sealed secret and update the `FIXME` placeholder in [test.tf][].

You can generate a new sealed secret with [kubeseal][]:

```shell
echo -n 's3cr3t' | kubeseal --format yaml --raw --name test-secret
```

`terraform apply` will create the `test-secret` SealedSecret resource.
If the controller is configured correctly it is generating a `test-secret` Secret by unsealing the SealedSecret.

[Sealed Secrets]: https://github.com/bitnami-labs/sealed-secrets
[Terraform Helm provider]: https://registry.terraform.io/providers/hashicorp/helm/2.5.1
[kubeseal]: https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.17.5
[test.tf]: ./test.tf

---

The project is configured to be able to test it using [kind][]. You can use it to validate your solution.

[kind]: https://kind.sigs.k8s.io/
