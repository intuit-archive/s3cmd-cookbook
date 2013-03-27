class Upload

  def command(args)
    @headers    = args[:headers]

    acl_public  = args[:acl_public] ? '--acl-public' : ''
    bucket      = args[:bucket]
    object_name = args[:object_name]
    file_name   = args[:file_name]
    force       = args[:force] ? '--force' : ''

    object_name[0] = '' if object_name[0] == '/'

    cmd =  "s3cmd #{force} #{acl_public} "
    cmd << headers
    cmd << " put #{file_name} s3://#{bucket}/#{object_name}"

    cmd
  end

  def headers
    @headers.each_pair.map {|k,v| "--add-header='#{k}':'#{v}'"}.join(' ')
  end

end
