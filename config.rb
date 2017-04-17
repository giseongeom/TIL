=begin
This file can be used to (e.g.):
- alter certain inner parts of Gollum,
- extend it with your stuff.

It is especially useful for customizing supported formats/markups. For more information and examples:
- https://github.com/gollum/gollum#config-file

=end

# enter your Ruby code here ...

# ~*~ encoding: utf-8 ~*~
module Gollum
  class Wiki
    include Pagination

    class << self
      def default_committer_name
        @default_committer_name || 'GiSeong Eom'
      end
      def default_committer_email
        @default_committer_email || 'jurist@kldp.org'
      end
    end
  end
end

