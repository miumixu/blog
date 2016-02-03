オンラインSICP読書女子会 #1 (1.1.1~1.1.6)
=========================================

`オンラインSICP読書女子会 #1 <http://ladiespp.connpass.com/event/25518/>`_

これが開催された後から参加したので、私はこの部分を一緒にやってませんがやってみます。

ちなみに私はGaucheではなくてRacketにしました。Emacsでgeiserを使いたかったので、サポートされているものから選んだらRacketになりました。
(ChickenSchemeを最初に試したんですが、分数型をデフォルトで使えないみたいだったのでRacketに変更しました)

練習問題 1.1
------------

.. sourcecode:: scheme

    10 ;-> 10
    (+ 5 3 4) ;-> 12
    (- 9 1) ;-> 8
    (/ 6 2) ;-> 3
    (+ (* 2 4) (- 4 6)) ;-> 6
    (define a 3)
    (define b (+ a 1))
    (+ a b (* a b)) ;-> 19
    (= a b) ;-> #f
    (if (and (> b a) (< b (* a b)))
        b
        a) ;-> 4
    (cond ((= a 4) 6)
          ((= b 4) (+ 6 7 a))
          (else 25)) ;-> 16
    (+ 2 (if (> b a) b a)) ;-> 6
    (* (cond ((> a b) a)
             ((< a b) b)
             (else -1))
       (+ a 1)) ;-> 16

練習問題 1.2
------------

.. sourcecode:: scheme

    (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
       (* 3 (- 6 2) (- 2 7))) ;-> -37/150

練習問題 1.3
------------

.. sourcecode:: scheme

    (define (square x) (* x x))
    (define (sum-of-squares x y)
      (+ (square x)
         (square y)))

    (define (f a b c)
      (max (sum-of-squares a b)
           (sum-of-squares b c)
           (sum-of-squares c a)))
    (f 3 4 5) ;-> 41
    (f 4 5 3) ;-> 41
    (f 5 3 4) ;-> 41

練習問題 1.4
------------

.. sourcecode:: scheme

    (define (a-plus-abs-b a b)
      ((if (> b 0) + -) a b))
    (a-plus-abs-b 10 -10) ;-> 20
    (a-plus-abs-b 10 10) ;-> 20

練習問題 1.5
------------

.. sourcecode:: scheme

    (define (p) (p))
    (define (test x y)
      (if (= x 0) 0 y))
    (test 0 (p))

適用順序評価の場合
~~~~~~~~~~~~~~~~~~

この場合、以下のような実行結果になることが予想されます。

.. sourcecode:: scheme

    (test 0 (p))
    (test 0 ((p)))
    (test 0 (((p))))
    (test 0 ((((p)))))
    (test 0 (((((p))))))
    ...

適用順序評価の場合、 ``test`` 関数が展開されるよりも先に引数である
``(p)`` が評価されるため、無限ループに陥いります。

正規順序評価の場合
~~~~~~~~~~~~~~~~~~

.. sourcecode:: scheme

    (test 0 (p))
    (if (= 0 0) 0 (p))
    0

#. 正規順序評価の場合は ``(p)`` が評価されるよりも前に ``test``
   関数が展開されるはずなので、展開形となり ``if``
   特殊形式を含んだ式になります。
#. ``if``
   特殊形式の評価規則は適用順序評価、正規順序評価共に同じであると仮定していいので、述語式が評価された後に結果式と代替式の
   **どちらか** が評価されます。
#. 述語式を評価した結果として結果式が評価されるため、代替式を評価することなく綺麗に終えることができます。

かな。

.. author:: default
.. categories:: SICP
.. tags:: オンラインSICP読書女子会, SICP
.. comments::
