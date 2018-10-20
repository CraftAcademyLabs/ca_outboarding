class User < ApplicationRecord

    validates_length_of :first_name, minimum: 3, maximum: 50, allow_blank: true
    validates_length_of :last_name, minimum: 3, maximum: 50, allow_blank: true

    def full_name
        if self.first_name && self.last_name
          [self.first_name, self.last_name].join(' ')
        end
      end
    
    
      def display_name
        self.full_name ? self.full_name : self.email
      end
end
