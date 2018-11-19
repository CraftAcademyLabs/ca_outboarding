class MemberIndex < Chewy::Index
    define_type User.all do
        field :first_name
    end
end