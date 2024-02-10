module Bookmarks
  class Create
    # fid is the id of the user that made the bookmark
    def initialize(fid, cast)
      @fid = fid
      @cast = cast
    end

    def call
      bookmark = Bookmark.new(user: user, cast:, caster_id: caster_id)

      # We always allow bookmark creation, even if the user has no balance
      transfer = if user.balance > amount
        Transfers::Create.new(user, amount, caster:).call
      elsif user.balance > 0
        Transfers::Create.new(user, user.balance, caster:).call
      end

      bookmark.transfer = transfer if transfer
      bookmark.save!
    end

    private

    attr_reader :fid, :cast

    def user
      @user ||= User.find_by(fid: fid)
    end

    def amount
      # @TODO: parse amount from cast
      10
    end

    def caster_id
      # @TODO: parse caster_id from cast
      1
    end

    def caster
      @caster ||= User.find_by(fid: caster_id)
    end
  end
end
