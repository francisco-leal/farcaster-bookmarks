require "eth"

module Transfers
  class Create
    def initialize(user, amount, caster)
      @amount = amount
      @user = user
      @caster = caster
    end

    def call
      transfer = Transfer.create!(
        user: user,
        amount: amount,
        readable_amount: amount.to_d,
        status: 'pending',
        caster: caster
      )

      client.call(book, "name")
      balance = client.call(book, "balanceOf", "0x33041027dd8F4dC82B6e825FB37ADf8f15d44053")

      transfer_hash = client.transfer_erc20_and_wait(
        book,
        "0x0914543c9716D8A4811187a78606A50cA81B9C14",
        10000000000000000000,
        sender_key: token_owner_key,
        priority_fee: 2 * Eth::Unit::GWEI,
        max_gas_fee: 69 * Eth::Unit::GWEI,
        gas_limit: 70_000
      )

      if transfer_hash
        transaction_details = client.eth_get_transaction_by_hash(transfer_hash)
        transfer.tx_hash = transfer_hash
        transfer.status = 'confirmed'
        transfer.block_number = transaction_details["result"]["block_number"]
        transfer.save!
      end
      
      transfer
    end

    private

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
