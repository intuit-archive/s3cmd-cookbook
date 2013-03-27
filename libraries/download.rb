class Download

  def command(args)
    bucket      = args[:bucket]
    object_name = args[:object_name]
    file_name   = args[:file_name]
    force       = args[:force] ? '--force' : ''

    object_name.slice!(0) if object_name.start_with? '/'

    cmd =  "s3cmd #{force} "
    cmd << "get s3://#{bucket}/#{object_name} #{file_name}"
    cmd
  end

end
