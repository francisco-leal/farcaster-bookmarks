require "eth"

module Airdrops
  class Claim
    attr_reader :user, :request

    def initialize(user, request)
      @user = user
      @request = request
    end

    def call
      return if !@request.valid
      return if user.airdrops.last.created_at < 7.days.ago

      transaction = client.transact_and_wait(
        book,
        "mint",
        "0x0914543c9716D8A4811187a78606A50cA81B9C14", # @TODO: replace with user's address
        amount,
        sender_key: token_owner_key,
        priority_fee: 2 * Eth::Unit::GWEI,
        max_gas_fee: 69 * Eth::Unit::GWEI,
        gas_limit: 70_000
      )

      if transaction
        Airdrop.create!(user: user, amount: amount, tx_hash: transaction)
      end
    end

    private

    def amount
      @amount ||= begin
        _amount = request.caster.followers
        _amount = _amount * 1.2 if request.caster.followers > 1000
        _amount = _amount * 1.2 if request.caster.active
        _amount = _amount * 1.5 if request.caster.fid <= 20000
      end
    end

    def neynar_api_key
      @neynar_api_key ||= ENV["NEYNAR_API_KEY"] # Set your API key (you can use environment variables)
    end

    def client
      @client ||= Eth::Client.create(ENV["BASE_RPC_URL"])
    end

    def book
      @book ||= Eth::Contract.from_abi(name: "BOOK", address: book_address, abi: book_contract_abi["abi"])
    end

    def book_contract_abi
      @book_contract ||= JSON.parse(File.read("app/services/transfers/abi/BookABI.json"))
    end

    def book_address
      @book_address ||= ENV["BOOK_CONTRACT_ADDRESS"]&.downcase
    end

    def token_owner_key
      @token_owner_key ||= Eth::Key.new(priv: ENV["TOKEN_OWNER_KEY"])
    end
  end
end
