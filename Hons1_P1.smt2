; declaring 16 variables
(declare-const x11 Int)(declare-const x12 Int)(declare-const x13 Int)(declare-const x14 Int)
(declare-const x21 Int)(declare-const x22 Int)(declare-const x23 Int)(declare-const x24 Int)
(declare-const x31 Int)(declare-const x32 Int)(declare-const x33 Int)(declare-const x34 Int)
(declare-const x41 Int)(declare-const x42 Int)(declare-const x43 Int)(declare-const x44 Int)
(declare-const xE Int)(declare-const xA Int)(declare-const xS Int)(declare-const xY Int)

(define-fun clue ((n1 Int) (n2 Int) (n3 Int) (n4 Int)) Int
   (
     if (= n1 4)
        1 ; combo is 4xxx so returns 1
        (if (= n1 3) ; else goes here
           2 ; combo is 3xxx so returns 2
           (if (= n1 2) ; else goes here
              (if (= n2 4)
                 2 ; combo is 24xx so returns 2
                 (if (= n2 3)
                    3 ; combo is 23xx so returns 3
                    (if (= n3 4)
                       2 ; combo is 2143 so returns 2
                       3 ; combo is 2134 so returns 3
                    )
                 )
              )
              ; this is where the else (n1 = 1) comes in
              (if (= n2 4)
                 2 ; combo is 14xx so returns 2
                 (if (= n2 3)
                    3 ; combo is 13xx so returns 3
                    (if (= n3 3)
                       4 ; combo is 1234 so returns 4
                       3 ; combo is 1243 so returns 3
                    )
                 )
              )
           )
        )
   )
)
; function clue over

; trying to solve puzzle:
(assert (< x11 5))(assert (> x11 0))(assert (< x12 5))(assert (> x12 0))(assert (< x13 5))(assert (> x13 0))(assert (< x14 5))(assert (> x14 0))
(assert (< x21 5))(assert (> x21 0))(assert (< x22 5))(assert (> x22 0))(assert (< x23 5))(assert (> x23 0))(assert (< x24 5))(assert (> x24 0))
(assert (< x31 5))(assert (> x31 0))(assert (< x32 5))(assert (> x32 0))(assert (< x33 5))(assert (> x33 0))(assert (< x34 5))(assert (> x34 0))
(assert (< x41 5))(assert (> x41 0))(assert (< x42 5))(assert (> x42 0))(assert (< x43 5))(assert (> x43 0))(assert (< x44 5))(assert (> x44 0))
(assert (< xE 5))(assert (> xE 0))(assert (< xA 5))(assert (> xA 0))(assert (< xS 5))(assert (> xS 0))(assert (< xY 5))(assert (> xY 0))
; line 47
(assert (distinct x11 x12 x13 x14))
(assert (distinct x21 x22 x23 x24))
(assert (distinct x31 x32 x33 x34))
(assert (distinct x41 x42 x43 x44))
(assert (distinct x11 x21 x31 x41))
(assert (distinct x12 x22 x32 x42))
(assert (distinct x13 x23 x33 x43))
(assert (distinct x14 x24 x34 x44))
(assert (distinct xE xA xS xY))

(assert (= (clue x11 x12 x13 x14) 1))
(assert (= (clue x21 x22 x23 x24) 2))
(assert (= (clue x31 x32 x33 x34) 3))
(assert (= (clue x11 x21 x31 x41) xE))
(assert (= (clue x12 x22 x32 x42) xA))
(assert (= (clue x13 x23 x33 x43) xS))
(assert (= (clue x14 x24 x34 x44) xY))
(assert (= x21 xE))
(assert (= x24 xY))
(assert (= x42 xA))
(assert (= x43 xS))


(check-sat)
(get-model)