(ns rna-transcription)

(def mapping {
  \C \G
  \G \C
  \T \A
  \A \U
})

(defn transcibe [nucleotide]
  (assert (contains? mapping nucleotide))
  (mapping nucleotide))


(defn to-rna [rna]
  (apply str (map transcibe rna)))
