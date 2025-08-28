secret2json() {
  secret="$1"
  shift
  aws secretsmanager get-secret-value --secret-id "$secret" | jq --raw-output '.SecretString' | jq
}

secret2env() {
  secret="$1"
  shift
  aws secretsmanager get-secret-value --secret-id "$secret" | jq --raw-output '.SecretString' | jq -r 'to_entries|map("\(.key)=\(.value|@sh)")|.[]'
}
