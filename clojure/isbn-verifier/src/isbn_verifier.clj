(ns isbn-verifier)

(defn sum [seq]
  (reduce + seq))

(defn valid? [l]
  (= 0
    (mod
      (sum
        (map #(reduce * %1)
          (map vector (seq l) (range 1 11))))
      11)))

(defn to-digit [char-digit]
  (if (= char-digit \X)
    10
    (- (int char-digit) 48)))

(defn parse [isbn]
  (reduce
    #(if (= %2 \-)
       %1
       (conj %1 (to-digit %2)))
    []
    (seq isbn)))

(defn good-check? [isbn]
  (every? #(not= %1 \X) (subs isbn 0 (- (count isbn) 1))))

(defn isbn? [isbn]
  (if (good-check? isbn)
    (valid? (parse isbn))
    false))
