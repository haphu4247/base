# My Base Project 

Step for Web build:
[command]: [firebase login]
[command1]: [firebase init]
? What do you want to use as your public directory? [build/web]
? Configure as a single-page app (rewrite all urls to /index.html)? [Yes]
? Set up automatic builds and deploys with GitHub? [Yes]
? File build/web/index.html already exists. Overwrite? [No]

? For which GitHub repository would you like to set up a GitHub workflow? (format: user/repository) [haphu4247/profiles]

✔  Created service account github-action-508993030 with Firebase Hosting admin permissions.
✔  Uploaded service account JSON to GitHub as secret FIREBASE_SERVICE_ACCOUNT_MY_PROFILE_77120.
i  You can manage your secrets at https://github.com/haphu4247/profiles/settings/secrets.

? Set up the workflow to run a build script before every deploy? [Yes]
? What script should be run before every deploy? [flutter build web]
? GitHub workflow file for PR previews exists. Overwrite? firebase-hosting-pull-request.yml [Yes]

✔  Created workflow file /Users/ngan/Documents/GitHub/profiles/.github/workflows/firebase-hosting-pull-request.yml
? Set up automatic deployment to your site's live channel when a PR is merged? [Yes]
? What is the name of the GitHub branch associated with your site's live channel? [main]
? The GitHub workflow file for deploying to the live channel already exists. Overwrite? firebase-hosting-merge.yml [Yes]

add this ["site": "phuhp"] to [firebase.json]
[command2]: [firebase deploy --only hosting:phuhp]

