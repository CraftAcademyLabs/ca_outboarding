class MembersIndex < Chewy::Index
    define_type Members.all do
        field :first_name, :last_name, :age, :gender
    end
end 
