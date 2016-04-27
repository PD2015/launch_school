require 'pry'
class Translation
  class InvalidCodonError < StandardError; end

  AMINO_ACIDS = {
    'Methionine' => ['AUG'],
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine' => ['UUA', 'UUG'],
    'Serine' => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine' => ['UAU', 'UAC'],
    'Cysteine' => ['UGU', 'UGC'],
    'Tryptophan' => ['UGG'],
    'STOP' => ['UAA', 'UAG', 'UGA']
  }

  def self.of_codon(codon)
    amino_acid = AMINO_ACIDS.detect { |_, v| v.include?(codon) }
    amino_acid[0] unless amino_acid == nil
  end

  def self.of_rna(strand)
    detected_aa = strand.scan(/.../).map { |c| self.of_codon(c) }
     
     self.codon_valid?(strand) 

      if detected_aa.include?('STOP')
        index_of_stop = detected_aa.index('STOP')
        detected_aa.slice(0..(index_of_stop -1))
      else
        detected_aa
      end

 
  end

  def self.codon_valid?(strand)

    aa_candidates = strand.scan(/.../)


    loop do 
      codon = aa_candidates.shift
      if AMINO_ACIDS.values.flatten.include?(codon) == false
        raise InvalidCodonError 
      else
        return true if aa_candidates.empty?
      end
    end

  end

end


# strand = 'carrot'
# p Translation.of_rna(strand)
# p Translation.of_codon('AUG')