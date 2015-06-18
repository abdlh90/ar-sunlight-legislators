require_relative '../../db/config'

class Person < ActiveRecord::Base
def name
"#{firstname} #{middlename} #{lastname} #{name_suffix}#"
end
end