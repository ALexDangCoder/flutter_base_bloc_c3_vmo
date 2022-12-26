GREEN='\033[1;32m'

echo "${GREEN}========================Setup Credential CICD Start======================="

#Use to write authenticate content to env file for fastlane ios authenticate
echo "$CREDENTIAL_IOS" | base64 -d > ios/AuthKey.p8
echo "$CREDENTIAL_ANDROID" | base64 -d > android/google_credential_ci.json

echo "${GREEN}========================Setup Credential CICD Finish======================="
