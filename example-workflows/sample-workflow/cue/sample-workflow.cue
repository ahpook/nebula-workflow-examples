package nebula


workflow: {

	steps: [{
		name: "Step-1-Provision-K8s-cluster"
		input: [
			"echo \"Hello world. I am Step 1\"",
			"sleep 5",
		]
	}, {
		name: "Step-2-Notify-team"
		input: [
			"echo \"Hello world. I am Step 2\"",
			"sleep 2",
		]
		dependsOn: "Step-1-Provision-K8s-cluster"
	}, { 
		name: "Step-3-Deploy-supporting-services"
		input: [
			"echo \"Hello world. I am Step 3\"",
			"sleep 2",
		]
		dependsOn: "Step-1-Provision-K8s-cluster",
	}, {
	name:        "Step-3-Deploy-supporting-services"
	input: [
		"echo \"Hello world. I am Step 3\"",
		"sleep 2",
	]
	dependsOn: "Step-1-Provision-K8s-cluster"
	}, {
		name:        "Step-4-Deploy-application-bits-to-Stage"
		input: [
			"echo \"Hello world. I am Step 4\"",
			"sleep 5",
		]
		dependsOn: "Step-3-Deploy-supporting-services"
	}, {
		name:        "Step-5-Manual-approval-to-Prod"
		input: [
			"echo \"Hello world. I am Step 5\"",
			"sleep 2",
			"echo \"Waiting on some manual approval from approvers @kenazk\"",
			"sleep 3",
		]
		dependsOn: "Step-4-Deploy-application-bits-to-Stage"
	}, {
		name:        "Step-6-Adjust-traffic-throttle-by-10-percent"
		input: [
			"echo \"Hello world. I am Step 6\"",
		]
		dependsOn: "Step-5-Manual-approval-to-Prod"
	}, {
		name:        "Step-7-Manual-approval-to-Prod"
		input: [
			"echo \"Hello world. I am Step 7\"",
		]
		dependsOn: "Step-6-Adjust-traffic-throttle-by-10-percent"
	}, {
		name:        "Step-4a-Notify-team"
		description: ""
		image:       "alpine:latest"
		input: [
			"echo \"Deployment to stage is complete. Please verify application instance.\"",
			"sleep 2",
		]
		dependsOn: "Step-4-Deploy-application-bits-to-Stage"
	}, {
		name:        "Step-5a-Update-JIRA-ticket-with-deployment-time"
		input: [
			"echo \"Update to stage complete\"",
			"sleep 3",
		]
		dependsOn: "Step-5-Manual-approval-to-Prod"
	}, {
		name:  "Step-8-Adjust-traffic-to-100-percent"
		input: [
			"echo \"Traffic adjusted to 100% - Fully deployed\"",
			"sleep 3",
		]
		dependsOn: "Step-7-Manual-approval-to-Prod"
	}, {
		name:  "Step-9-Notify-team-deployment-complete"
		input: [
			"echo \"Team notified via Slack, email - deployment complete\"",
			"sleep 2",
		]
		dependsOn: "Step-8-Adjust-traffic-to-100-percent"
	}]
	
}