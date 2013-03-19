action :sync_to_s3 do

  directory   = new_resource.directory
  bucket      = new_resource.bucket
  path = new_resource.path
  force       = new_resource.force ? '--force' : ''

  object_name.slice!(0) if object_name.start_with? '/'

  execute "Downloading s3://#{bucket}/#{object_name} from s3 to #{file_name}" do
    command "s3cmd #{force} get s3://#{bucket}/#{object_name} #{file_name}"
  end

end
