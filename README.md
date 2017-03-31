# Hands on with Habitat


## Pre-requisites

The following components must be installed:

1.  Chef Development Kit - [https://downloads.chef.io/chefdk/](https://downloads.chef.io/chefdk/)
1.  Vagrant - [https://www.vagrantup.com/downloads.html](https://www.vagrantup.com/downloads.html)
1.  VirtualBox or VMWare

## Quick Reference for the Hands on with Habitat Workshop

1.  Clone this repository - `git clone https://github.com/nathenharvey/hands_on_with_habitat.git`
1.  Move to the newly created directory - `cd hands_on_with_habitat`
1.  Converge the Test Kitchen - `kitchen converge`
1.  Login to the Test Kitchen - `kitchen login`
1.  Start MongoDB - `sudo hab start nathenharvey/mongodb`
1.  Stop MongoDB by pressing `Ctrl-C`
1.  Write the MongoDB configuration to a file `sudo hab sup config nathenharvey/mongodb > user.toml`
1.  Edit `user.toml`, change the value for `cluster_auth_mode`

   Change:
   ```
   [mongod.security]
   authorization = "disabled"
   cluster_auth_mode = "keyFile"
   javascript_enabled = true
   key_file = ""
   ```

   To:
   ```
   [mongod.security]
   authorization = "disabled"
   cluster_auth_mode = ""
   javascript_enabled = true
   key_file = ""
   ```

1.  Move the `user.toml` - `sudo mv user.toml /hab/svc/mongodb/`
1.  Restart MongoDB - `sudo hab start nathenharvey/mongodb`
1.  Open another shell and move into the cloned repository's directory - `cd hands_on_with_habitat`
1.  Login to the Test Kitchen - `kitchen login`
1.  Start the Java Application - `sudo hab start nathenharvey/national-parks --listen-gossip 0.0.0.0:9639 --listen-http 0.0.0.0:9632 --peer 127.0.0.1 --bind database:mongodb.default`

Verify everything is working in your browser:

* http://localhost:8080/national-parks
* http://localhost:9631/services/mongodb/default/config
* http://localhost:9632/services/national-parks/default/config
