# Query the local Docker Repository for the latest tag
repo_version = curl -sX GET http://127.0.0.1:5000/v2/_catalog  | cut -d'"' -f4
if [ -z "$repo_version" ]; then
  echo "ERROR: Unable to determine the latest version of the Docker Repository"
  exit 1
fi

