-module(rna_transcription).

-export([to_rna/1, test_version/0]).

to_rna(Dna) -> to_rna2(Dna, []).

to_rna2([], Acc) -> Acc;
to_rna2([Head|Tail], Acc) ->
  case el_to_rna([Head]) of
    error -> error;
    Rna -> to_rna2(Tail, Acc ++ Rna)
  end.

el_to_rna("C") -> "G";
el_to_rna("G") -> "C";
el_to_rna("T") -> "A";
el_to_rna("A") -> "U";
el_to_rna(_) -> error.

test_version() -> 2.
