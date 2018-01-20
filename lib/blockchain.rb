require 'date'
require 'digest/sha2'

class Blockchain

  attr_accessor :chain, :current_transactions

  CORRECT_LAST_4_DIGITS = '0000'

  class << self
    # Creates a SHA-256 hash of a given string
    #
    # @param   obj: <object> any object implemented to_s method
    # @return  <str> a SHA-256 hash of a object
    def compute_hash(obj)
      Digest::SHA256.hexdigest(obj.to_s)
    end

    # Simple Proof of Work Algorithm:
    # Find a number p' such that compute_hash(pp') contains leading 4 zeroes, where p is the previous p'
    # p is the previous proof, and p' is the new proof
    #
    # @param last_proof: <int>
    # @return: <int>
    def compute_proof_of_work(last_proof)
      proof = 0
      until valid_proof?(last_proof: last_proof, proof: proof)
        proof += 1
      end

      proof
    end

    private

    # Validates the Proof: Does compute_hash(last_proof, proof) contain 4 leading zeroes?
    #
    # @param last_proof: <int> Previous Proof
    # @param proof:      <int> Current Proof
    # @return: <bool> True if correct, False if not.
    def valid_proof?(last_proof:, proof:)
      guess_hash = compute_hash(last_proof.to_s + proof.to_s)
      guess_hash[-4..-1] == CORRECT_LAST_4_DIGITS
    end
  end
end