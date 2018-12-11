class UsersIndex < Chewy::Index
    define_type User.all do
<<<<<<< HEAD
        field :first_name
        field :last_name
        field :age
        field :role
        field :gender
=======
        field :first_name, :last_name, :gender
>>>>>>> f6861bfe009e250fc2f1ebba904682d754c84244
    end
end
