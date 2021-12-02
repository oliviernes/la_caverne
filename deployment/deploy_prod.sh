#!/bin/sh

ssh olivier@172.26.0.3 <<EOF
  docker exec -it la_caverne bash <<EOF
  touch file_from_jenkins
  EOF
EOF
