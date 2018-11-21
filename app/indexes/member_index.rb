class MemberIndex < Chewy::Index
    define_type Member.all do
        field :first_name, :last_name, :age, :gender
    end
end 
