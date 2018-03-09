(ns run-length-encoding)

(defn flush-encode-state [state]
  (let [n (state :n)
        current (state :current)]
    (cond
      (> n 1) (-> state
                  (update :acc #(str %1 n current))
                  (assoc :n 0)
                  (assoc :current nil))

      (> n 0) (-> state
                  (update :acc #(str %1 current))
                  (assoc :n 0)
                  (assoc :current nil))

      true state)))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  ([s]
    (->
      (reduce run-length-encode {:acc "" :n 0} s)
      flush-encode-state
      (get :acc)))

  ([state c]
    (if (= (state :current) c)
      (update state :n #(+ %1 1))
      (-> state
        flush-encode-state
        (assoc :n 1)
        (assoc :current c)))))

(defn digit? [c]
  (and (>= (int c) (int \0)) (<= (int c) (int \9))))

(defn ctoi [c]
  (- (int c) 48))

(defn bump-tally [state]
  (let [current (state :current)
        tally (state :tally)]
    (->> tally
        (* 10)
        (+ (ctoi current))
        (assoc state :tally))))

(defn times-str [n c]
  (apply str (repeat n c)))

(defn flush-decode-state [state]
  (let [tally (state :tally)
        current (state :current)]
    (if (> tally 0)
      (-> state
        (update :acc #(str %1 (times-str tally current)))
        (assoc :current nil)
        (assoc :tally 0))

      (-> state
        (update :acc #(str %1 current))
        (assoc :current nil)
        (assoc :tally 0))
    )
  )
)

(defn run-length-decode
  "decodes a run-length-encoded string"
  ([s]
    (-> (reduce run-length-decode {:tally 0 :acc ""} s)
        flush-decode-state
        (get :acc)))

  ([state c]
    (let [state2 (assoc state :current c)]
      (if (digit? c)
        (bump-tally state2)
        (flush-decode-state state2)
      )
    )
  ))
