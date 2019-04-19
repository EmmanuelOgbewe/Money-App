module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    #get User back given Auth token in Header
    field :user, Types::UserType, null: false, resolver: Resolvers::FindUser



  end
end
