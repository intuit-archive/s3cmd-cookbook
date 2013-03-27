class Upload

  def command(args)
    acl_public  = args[:acl_public] ? '--acl-public' : ''
    bucket      = args[:bucket]
    object_name = args[:object_name]
    headers     = args[:headers]
    file_name   = args[:file_name]
    force       = args[:force] ? '--force' : ''

    object_name[0] = '' if object_name[0] == '/'

    cmd =  "s3cmd #{force} #{acl_public} "
    cmd << header_args(headers)
    cmd << " put #{file_name} s3://#{bucket}/#{object_name}"

    cmd
  end

  def header_args(headers)
    headers.each_pair.map {|k,v| "--add-header='#{k}':'#{v}'"}.join(' ')
  end

end
