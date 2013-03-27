class Upload

  def command(args)
    @headers    = args[:headers]

    acl_public  = args[:acl_public] ? '--acl-public' : ''
    bucket      = args[:bucket]
    object_name = args[:object_name]
    file_name   = args[:file_name]

    object_name.slice!(0) if object_name.start_with? '/'

    cmd =  "s3cmd #{acl_public} "
    cmd << headers
    cmd << " put #{file_name} s3://#{bucket}/#{object_name}"

    cmd
  end

  def headers
    @headers.each_pair.map {|k,v| "--add-header='#{k}':'#{v}'"}.join(' ')
  end

end
