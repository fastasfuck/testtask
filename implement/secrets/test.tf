resource "kubernetes_manifest" "test_secret" {
  manifest = {
    "apiVersion" = "bitnami.com/v1alpha1"
    "kind"       = "SealedSecret"
    "metadata" = {
      "name"      = "test-secret"
      "namespace" = "default"
    }
    "spec" = {
      "encryptedData" = {
        "foo" = "czNjcjN0Cg=="
      }
    }
  }
}
