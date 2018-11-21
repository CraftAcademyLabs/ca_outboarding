class MembersIndex < Chewy::Index
    define_type Member.all do
        field :first_name
    end
end 
