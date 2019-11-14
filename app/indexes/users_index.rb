class UsersIndex < Chewy::Index
    define_type User.all do
        field :first_name
        field :last_name
        field :gender
        field :age
    end
end
