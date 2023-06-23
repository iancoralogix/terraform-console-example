global_config = {
  environments = {
    ###########################################
    ######## Production Environment ###########
    ###########################################
    prod = {
      vpc = {
        id   = "vpc-01abc23d4e567f890"
        cidr = "10.0.0.0/16"
        subnets = [
          {
            id                = "subnet-0a1b2c3d4e5f67890"
            cidr              = "10.0.1.0/24"
            availability_zone = "us-west-2a"
          },
          {
            id                = "subnet-1a2b3c4d5e6f78901"
            cidr              = "10.0.2.0/24"
            availability_zone = "us-west-2b"
          }
        ]
      }

      security_groups = {
        web = ["sg-01abc23d4e567f890", "sg-0a1b2c3d4e5f67890"]
        db  = ["sg-1a2b3c4d5e6f78901", "sg-2a3b4c5d6e7f89012"]
      }

      ec2_instances = {
        web_servers = [
          {
            name               = "web-server-1"
            instance_type      = "t3.micro"
            ami_id             = "ami-0abcdef1234567890"
            subnet_id          = "subnet-0a1b2c3d4e5f67890"
            security_group_ids = ["sg-01abc23d4e567f890"]
            key_pair_name      = "prod-key-pair"
            user_data          = "#!/bin/bash\necho 'Hello, World!' > /var/www/html/index.html"
            tags               = { Name = "web-server-1", Environment = "prod" }
          },
          {
            name               = "web-server-2"
            instance_type      = "t3.micro"
            ami_id             = "ami-0abcdef1234567890"
            subnet_id          = "subnet-1a2b3c4d5e6f78901"
            security_group_ids = ["sg-01abc23d4e567f890"]
            key_pair_name      = "prod-key-pair"
            user_data          = "#!/bin/bash\necho 'Hello, World!' > /var/www/html/index.html"
            tags               = { Name = "web-server-2", Environment = "prod" }
          }
        ],

        db_servers = [
          {
            name               = "db-server-1"
            instance_type      = "r5.large"
            ami_id             = "ami-0abcdef1234567890"
            subnet_id          = "subnet-0a1b2c3d4e5f67890"
            security_group_ids = ["sg-1a2b3c4d5e6f78901"]
            key_pair_name      = "prod-key-pair"
            user_data          = "#!/bin/bash\nsudo apt-get update\nsudo apt-get install -y postgresql"
            tags               = { Name = "db-server-1", Environment = "prod" }
          },
          {
            name               = "db-server-2"
            instance_type      = "r5.large"
            ami_id             = "ami-0abcdef1234567890"
            subnet_id          = "subnet-1a2b3c4d5e6f78901"
            security_group_ids = ["sg-1a2b3c4d5e6f78901"]
            key_pair_name      = "prod-key-pair"
            user_data          = "#!/bin/bash\nsudo apt-get update\nsudo apt-get install -y postgresql"
            tags               = { Name = "db-server-2", Environment = "prod" }
          }
        ]
      }
    },

    ###########################################
    ######## Development Environment ##########
    ###########################################
    dev = {
      vpc = {
        id   = "vpc-00112233445566788"
        cidr = "10.1.0.0/16"
        subnets = [
          {
            id                = "subnet-00112233445566788"
            cidr              = "10.1.1.0/24"
            availability_zone = "us-west-2a"
          },
          {
            id                = "subnet-00223344556677889"
            cidr              = "10.1.2.0/24"
            availability_zone = "us-west-2b"
          }
        ]
      }

      security_groups = {
        web = ["sg-00112233445566788", "sg-00223344556677889"]
        db  = ["sg-00334455667788990", "sg-00445566778899001"]
      }

      ec2_instances = {
        web_servers = [
          {
            name               = "dev-web-server-1"
            instance_type      = "t3.micro"
            ami_id             = "ami-0a1b2c3d4e5f6g7h8"
            subnet_id          = "subnet-00112233445566788"
            security_group_ids = ["sg-00112233445566788"]
            key_pair_name      = "dev-key-pair"
            user_data          = "#!/bin/bash\necho 'Hello, Dev World!' > /var/www/html/index.html"
            tags               = { Name = "dev-web-server-1", Environment = "dev" }
          }
        ],

        db_servers = [
          {
            name               = "dev-db-server-1"
            instance_type      = "t3.medium"
            ami_id             = "ami-0a1b2c3d4e5f6g7h8"
            subnet_id          = "subnet-00223344556677889"
            security_group_ids = ["sg-00334455667788990"]
            key_pair_name      = "dev-key-pair"
            user_data          = "#!/bin/bash\nsudo apt-get update\nsudo apt-get install -y postgresql"
            tags               = { Name = "dev-db-server-1", Environment = "dev" }
          }
        ]
      }
    },

    ###########################################
    ######## UAT Environment ##################
    ###########################################
    uat = {
      vpc = {
        id   = "vpc-02def45g6h789j012"
        cidr = "10.1.0.0/16"
        subnets = [
          {
            id                = "subnet-1a2b3c4d5e6f78902"
            cidr              = "10.1.1.0/24"
            availability_zone = "us-west-2a"
          }
        ]
      }

      security_groups = {
        web = ["sg-1a2b3c4d5e6f78902"]
        db  = ["sg-2b3c4d5e6f789012"]
      }

      ec2_instances = {
        web_servers = [
          {
            name               = "web-server-1"
            instance_type      = "t2.micro"
            ami_id             = "ami-01bcde23f456gh789"
            subnet_id          = "subnet-1a2b3c4d5e6f78902"
            security_group_ids = ["sg-1a2b3c4d5e6f78902"]
            key_pair_name      = "uat-key-pair"
            user_data          = "#!/bin/bash\necho 'Hello, UAT!' > /var/www/html/index.html"
            tags               = { Name = "web-server-1", Environment = "uat" }
          }
        ],

        db_servers = [
          {
            name               = "db-server-1"
            instance_type      = "t2.medium"
            ami_id             = "ami-01bcde23f456gh789"
            subnet_id          = "subnet-1a2b3c4d5e6f78902"
            security_group_ids = ["sg-2b3c4d5e6f789012"]
            key_pair_name      = "uat-key-pair"
            user_data          = "#!/bin/bash\nsudo apt-get update\nsudo apt-get install -y postgresql"
            tags               = { Name = "db-server-1", Environment = "uat" }
          }
        ]
      }
    }
  }
}
