# docker-compose example

This docker-compose file MUST move to low path from ROOT.
Maybe, there is long path at file system @gitlab.
 eg) Not running (gitlab) @/Users/ghun/Workspace/Development/_document/dockercompose
     Running @/Users/ghun/Workspace/dockercompose
   

## sequence



## infra docker-compose
 gitlab: gitlab
 - mongo: mongodb
 - postgresql: postgresql




# uninstall 
clear all

```
$ ./0.clear.all.sh

[CAUTION] All data(database, log, images) will be deleted.
 Are you sure? [y/N] y

down all container
Stopping micro_resource   ... done
Stopping micro_api        ... done
Stopping micro_user       ... done
Stopping micro_experiment ... done
Stopping publisher_board  ... done
Stopping infra_mgr        ... done
Stopping infra_rdb        ... done
Stopping infra_gitlab     ... done
Stopping infra_nosql      ... done
Removing micro_resource   ... done
Removing micro_api        ... done
Removing micro_user       ... done
Removing micro_experiment ... done
Removing publisher_board  ... done
Removing infra_mgr        ... done
Removing infra_rdb        ... done
Removing infra_gitlab     ... done
Removing infra_nosql      ... done
Removing network standalone_default

delete all docker images
Untagged: registry.bokchi.com/publisher_board:0.0.2-community
Untagged: registry.bokchi.com/publisher_board@sha256:c0fdbd82b0f81d47a96e3bf6a0fb6c9f4ac2939fd525aef064e7b29be8217d99
Deleted: sha256:15119aca61500703a12c4b8aab422e48fed3320e5002361102e630bac60e8e4d
Deleted: sha256:efa73df8b67fb6b168346b725fa24ee9224c835b17fdebb50c9e2ff310f5fc0f
Deleted: sha256:b56742bcbb8d637ebf8b1f53b2e58c2e4cd2cb554a2c6e0aa2a38d7b9f227404

...(skip)...

Deleted: sha256:abebed1e4e8c594d0dfc1dee466e232942379f9521ff72bf2ecc10abf13bcf5b
Deleted: sha256:ec4a38999118b78eab6899b913a548cb0b2c9b68fd05aff846a56b628b597f38

delete all directories


```

