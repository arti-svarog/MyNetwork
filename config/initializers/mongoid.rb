module Mongoid
  module Document
    def as_json(options={})
      attrs = super(options)
      attrs["id"] = attrs["_id"].to_s
      attrs.delete('_id') if(attrs.has_key?('_id'))
      attrs
    end
  end
end

module BSON
	class ObjectId
		def to_json(*args)
			to_s.to_json
		end

		def as_json(*args)
			to_s.as_json
		end
	end
end

Mongo::Logger.logger       = ::Logger.new('mongo.log')
Mongo::Logger.logger.level = ::Logger::INFO
