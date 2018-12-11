class UsersIndex < Chewy::Index
    define_type User.all do
        field :first_name, :last_name, :gender
    end
end
