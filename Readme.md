# Using The Registry

The registry can be used like this.

    First we'll pull an image docker pull gcr.io/google-samples/hello-app:1.0
    Then we'll tag the image to use the local registry docker tag gcr.io/google-samples/hello-app:1.0 localhost:5001/hello-app:1.0
    Then we'll push it to the registry docker push localhost:5001/hello-app:1.0
    And now we can use the image kubectl create deployment hello-server --image=localhost:5001/hello-app:1.0

If you build your own image and tag it like localhost:5001/image:foo and then use it in kubernetes as localhost:5001/image:foo.


# Testing Ingress-nginx

Apply the contents
kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml

kubectl apply -f https://kind.sigs.k8s.io/examples/ingress/usage.yaml


Now verify that the ingress works
<!-- # should output "foo" -->
curl localhost/foo
<!-- # should output "bar" -->
curl localhost/bar

<!-- # should output "foo" -->
curl localhost/foo
<!-- # should output "bar" -->
curl localhost/bar
