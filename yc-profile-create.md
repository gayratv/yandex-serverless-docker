
https://cloud.yandex.ru/docs/cli/cli-ref/managed-yc/config/profile/create

yc config profile list
yc config profile activate battery
yc config profile delete cloud_gajratvlasov

yc config profile create cloud_gajratvlasov_serverless_container_test

https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token

yc config set token AgAAAAACaSGqAATuwYGDcxo27EgFrGC9DL2Bmts
yc config set cloud-id b1gib03pgvqrrfvhl3kb
yc config set folder-id b1gtq2211g7ik3bbunt3
yc config profile get cloud_gajratvlasov_serverless_container_test

yc iam key create --service-account-name desktop -o service_account_key_file.json