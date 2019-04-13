module Resolvers
  class FindUser < Resolvers::Base
    type Types::UserType, null: false

    argument :id , Int, required: true

    def resolve(id: nil)
      # call your application logic here:
      User.find id
    end
  end
end
