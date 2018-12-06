class UsersIndex < Chewy::Index
    define_type User.all do
        field :first_name
        field :last_name
        field :age
        field :role
        field :gender
    end
end 
