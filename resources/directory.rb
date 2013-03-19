actions :sync_to_s3

attribute :directory, :kind_of => String, :name_attribute => true
attribute :bucket, :kind_of => String
attribute :path, :kind_of => String
attribute :force, :kind_of => [ TrueClass, FalseClass ], :default => true
attribute :public, :kind_of => [ TrueClass, FalseClass ], :default => false
