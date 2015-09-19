require "partner_friendly/version"

module PartnerFriendly
  class Process

    def self.clean(user)
      if user.email.include?('+')
        e = []
        e = user.email.split(/[+@]/)
        user.email = e[0] + '@' + e[2]
      else
        user.email
      end
    end

  end
end