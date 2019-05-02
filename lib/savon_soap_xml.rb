# Hack Savon to work properly with arrays
module Savon #:nodoc:
  module SOAP #:nodoc:
    class XML #:nodoc:
      private

      def add_namespaces_to_body(hash, path = [input[1].to_s])
        return unless hash
        return hash if hash.is_a? Array
        return hash.to_s unless hash.is_a? Hash

        hash.inject({}) do |newhash, (key, value)|
          camelcased_key = Gyoku::XMLKey.create(key)
          newpath = path + [camelcased_key]

          if used_namespaces[newpath]
            newhash.merge(
              "#{used_namespaces[newpath]}:#{camelcased_key}" =>
                  add_namespaces_to_body(value, types[newpath] ? [types[newpath]] : newpath)
            )
          else
            newhash.merge(key => value)
          end
        end
      end
    end
  end
end
