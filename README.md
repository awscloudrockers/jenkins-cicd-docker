2. Configure Jenkins Job
Add Parameters
Navigate to Jenkins: Log in and find your Jenkins dashboard.

Open Your Pipeline Job: Click on the existing pipeline job that corresponds to the modified Jenkinsfile.

Configure Job: Look for the "Configure" option in the sidebar or the main job page.

Add Parameters:

Click on "This project is parameterized" (if not already enabled).
Add the following parameters:
String Parameter: DOCKER_IMAGE_NAME (remove the default value so users must enter it)
String Parameter: GIT_REPO_URL (remove the default value so users must enter it)
String Parameter: DOCKERHUB_USERNAME (remove the default value so users must enter it)
Credentials Parameter: Select "Username with password" or appropriate credential type and configure it with ID dockerhub_id (matching what's in the pipeline script).
Save Changes
Click "Save" to apply the changes to your Jenkins job configuration.
3. Run the Pipeline
Trigger a build of your Jenkins pipeline job to execute the pipeline with the configured parameters.
Jenkins will prompt users to enter values for DOCKER_IMAGE_NAME, GIT_REPO_URL, and DOCKERHUB_USERNAME when starting the build.
Credentials for DockerHub should be managed securely through Jenkins' credential management.
Summary
By configuring parameters in your Jenkins job and removing hardcoded values from the pipeline script, you ensure flexibility and reusability. Users can now provide different values for Docker image name, Git repository URL, DockerHub username, and credentials when running the pipeline, making it adaptable to various projects and environments.
