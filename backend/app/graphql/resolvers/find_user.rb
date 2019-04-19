module Resolvers
  class FindUser < Resolvers::Base
    type Types::UserType, null: false

    def resolve
      # call your application logic here:
      context[:current_user]
    end
  end
end
