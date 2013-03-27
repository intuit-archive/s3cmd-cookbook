action :download do
  file_name   = new_resource.file_name
  bucket      = new_resource.bucket
  object_name = new_resource.object_name
  force       = new_resource.force ? '--force' : ''

  cmd = Download.new.command :file_name   => new_resource.file_name,
                             :bucket      => new_resource.bucket,
                             :object_name => new_resource.object_name,
                             :force       => new_resource.force

  execute "Downloading from s3 with cmd: '#{cmd}'" do
    command cmd
  end

  file file_name do
    owner new_resource.owner
    group new_resource.group
    mode new_resource.mode
  end
end

action :upload do
  cmd = Uplaod.new.command :headers     => new_resource.headers,
                           :file_name   => new_resource.file_name,
                           :bucket      => new_resource.bucket,
                           :object_name => new_resource.object_name,
                           :acl_public  => new_resource.acl_public,
                           :force       => new_resource.force

  execute "Uploading to S3 with cmd: '#{cmd}'" do
    command cmd
  end
end
