#!/usr/bin/env bash
if [[ $TRAVIS_PULL_REQUEST == "false" &&  $TRAVIS_BRANCH == "master" ]]; then
  openssl aes-256-cbc -K $encrypted_02f86fe65d47_key -iv $encrypted_02f86fe65d47_iv -in markt_deploy_id_rsa.enc -out markt_deploy_id_rsa -d
  fab deploy -i markt_deploy_id_rsa -H deploy@kiesinger.okfn.de:2207
else 
  echo "not a push to master, so not deploying"
  exit 0
fi

