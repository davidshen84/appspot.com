data "google_iam_policy" "project-iam" {

  binding {
    members = [
      "user:davidshen84@gmail.com"
    ]
    role = "roles/owner"
  }

  binding {
    members = [
      "user:davidshen84@gmail.com"
    ]
    role = "roles/storage.admin"
  }

  binding {
    members = [
      "user:davidshen84@gmail.com"
    ]
    role = "roles/datastore.owner"
  }

  binding {
    members = [
      "user:davidshen84@gmail.com"
    ]
    role = "roles/iam.serviceAccountAdmin"
  }

  binding {
    members = [
      "user:davidshen84@gmail.com"
    ]
    role = "roles/iam.serviceAccountTokenCreator"
  }

  binding {
    members = [
      "serviceAccount:43274281830@cloudbuild.gserviceaccount.com",
      "user:davidshen84@gmail.com"
    ]
    role = "roles/iam.serviceAccountUser"
  }

  binding {
    members = [
      "user:davidshen84@gmail.com"
    ]
    role = "roles/cloudkms.admin"
  }


  # default service account
  binding {
    members = ["serviceAccount:davidshen84@appspot.gserviceaccount.com"]
    role    = "roles/pubsub.publisher"
  }

  binding {
    members = ["serviceAccount:davidshen84@appspot.gserviceaccount.com"]
    role    = "roles/pubsub.subscriber"
  }

  binding {
    members = ["serviceAccount:davidshen84@appspot.gserviceaccount.com"]
    role    = "roles/logging.logWriter"
  }

  binding {
    members = ["serviceAccount:davidshen84@appspot.gserviceaccount.com"]
    role    = "roles/iap.httpsResourceAccessor"
  }

  binding {
    members = ["serviceAccount:davidshen84@appspot.gserviceaccount.com"]
    role    = "roles/datastore.user"
  }

  # gcp infra
  binding {
    members = [
      "serviceAccount:43274281830@cloudbuild.gserviceaccount.com",
    ]
    role = "roles/appengine.appAdmin"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcp-gae-service.iam.gserviceaccount.com",
    ]
    role = "roles/appengine.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:43274281830@cloudbuild.gserviceaccount.com",
    ]
    role = "roles/cloudbuild.builds.builder"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcp-sa-cloudbuild.iam.gserviceaccount.com"
    ]
    role = "roles/cloudbuild.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcp-sa-cloudscheduler.iam.gserviceaccount.com"
    ]
    role = "roles/cloudscheduler.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@compute-system.iam.gserviceaccount.com"
    ]
    role = "roles/compute.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@container-engine-robot.iam.gserviceaccount.com"
    ]
    role = "roles/container.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@containerregistry.iam.gserviceaccount.com"
    ]
    role = "roles/containerregistry.ServiceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@dataflow-service-producer-prod.iam.gserviceaccount.com"
    ]
    role = "roles/dataflow.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcf-admin-robot.iam.gserviceaccount.com",
    ]
    role = "roles/cloudfunctions.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcp-sa-websecurityscanner.iam.gserviceaccount.com",
    ]
    role = "roles/websecurityscanner.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:davidshen84@appspot.gserviceaccount.com"
    ]
    role = "roles/datastore.user"
  }

  binding {
    members = [
      "serviceAccount:43274281830@cloudservices.gserviceaccount.com"
    ]
    role = "roles/editor"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@cloud-filer.iam.gserviceaccount.com"
    ]
    role = "roles/file.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcp-sa-firebase.iam.gserviceaccount.com"
    ]
    role = "roles/firebase.managementServiceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@firebase-rules.iam.gserviceaccount.com"
    ]
    role = "roles/firebaserules.system"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@gcp-sa-firestore.iam.gserviceaccount.com"
    ]
    role = "roles/firestore.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@serverless-robot-prod.iam.gserviceaccount.com"
    ]
    role = "roles/run.serviceAgent"
  }

  binding {
    members = [
      "serviceAccount:service-43274281830@sourcerepo-service-accounts.iam.gserviceaccount.com"
    ]
    role = "roles/sourcerepo.serviceAgent"
  }
}
