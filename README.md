# s3cmd cookbook
Configures s3cmd

# Requirements
* Chef 10.x

Platform:
* CentOS 6.x
* RHEL 6.x

# Usage
Add the s3cmd cookbook to your role/run_list.

# Attributes
## default
node["s3cmd"]["version"] - Version of s3cmd to install.

# Recipes
## default
Configures s3cmd

# Providers
## file
### Download
Downloads a file from s3

    s3cmd_file "LOCAL_FILE" do
      action :download
      bucket "BUCKET_TO_DOWNLOAD_FROM"
      object_name "OBJECT_TO_DOWNLOAD"
      owner "LOCAL_FILE_OWNER"
      group "LOCAL_FILE_GROUP"
      mode "LOCAL_FILE_MODE"
      force true
    end

### Upload
Uploads a file to s3

    s3cmd_file "LOCAL_FILE" do
      action :upload
      bucket "BUCKET_TO_DOWNLOAD_FROM"
      headers 'header1' => 'value1',
              'header2' => 'value2'
      object_name "OBJECT_TO_DOWNLOAD"
      acl_public true
    end

# Authors
* Thomas Bishop (@thbishop)
* Brett Weaver (@brettweavnet)
