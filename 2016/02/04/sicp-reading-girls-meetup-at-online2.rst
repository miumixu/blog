オンラインSICP読書女子会 #2 (1.1.7~1.1.8)
=========================================

`オンラインSICP読書女子会
#2 <http://ladiespp.connpass.com/event/26232/>`__

ということで2回目です。

まずは平方根をニュートン法で求めるという話がありました。

.. sourcecode:: scheme

    (define (square x) (* x x))

    (define (average x y)
      (/ (+ x y) 2))

    (define (improve guess x)
      (average guess (/ x guess)))

    (define (good-enough? guess x)
      (< (abs (- (square guess) x)) 0.001))

    (define (sqrt-iter guess x)
      (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

    (define (sqrt x)
      (sqrt-iter 1.0 x))

練習問題 1.6
------------

これは前回の範囲で答えることができます。

.. sourcecode:: scheme

    (define (new-if predicate then-clause else-clause)
      (cond (predicate then-clause)
            (else else-clause)))

このような ``new-if`` 関数があったとして、次のように ``sqrt-iter``
を書いたらどうなるかという話ですね。

.. sourcecode:: scheme

    (define (sqrt-iter guess x)
      (new-if (good-enough? guess x)
              guess
              (sqrt-iter (improve guess x) x)))

``new-if`` 関数というのは特殊形式ではないため、
述語式が評価された後に結果式と代替式の
**どちらかを評価するわけではありません** 。
これは何を意味するかというと、次のような簡単な例を考えてみると理解しやすいです。

.. sourcecode:: scheme

    (new-if #t
            (println "true")
            (println "false"))

この例をREPLで評価してみると次のような出力を得ることができます。

.. sourcecode:: scheme

    "true"
    "false"

これは ``new-if`` 関数が ``if`` 特殊形式のように
**述語式を評価した後に結果式と代替式のどちらかのみを評価する**
わけではないということを意味しています。

また、 ``sqrt-iter``
関数は再帰関数であるという性質から、平方根を計算しようとした場合に無限ループに陥いることは明白です。

練習問題 1.7
------------

どのような数のときにうまくいかないかという話ですね。

(私はあまりよくわからなかったので後で勉強して補記するかもしれないです)

.. sourcecode:: scheme

    (define (average x y)
      (/ (+ x y) 2))

    (define (improve guess x)
      (average guess (/ x guess)))

    (define (good-enough? guess x)
      (< (abs (- guess (improve guess x))) 0.001))

    (define (sqrt-iter guess x)
      (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

    (define (sqrt x)
      (sqrt-iter 1.0 x))

練習問題 1.8
------------

少し悩むけど、基本的に答えは書いてあるようなものなので、今迄の平方根を計算するプログラムを修正したら動きます。

具体的には ``improve`` 関数に問題に書いてある式に落とし込んで、
``good-enough?``
関数も微修正します。(何を元にこの問題を解くかで多少変わりますが)

.. sourcecode:: scheme

    (define (improve guess x)
      (/ (+ (/ x (square guess))
            (* 2 guess))
         3))

    (define (good-enough? guess x)
      (< (abs (- guess (improve guess x))) 0.001))

    (define (cbrt-iter guess x)
      (if (good-enough? guess x)
          guess
          (cbrt-iter (improve guess x) x)))

    (define (cbrt x)
      (cbrt-iter 1.0 x))

結構、チャットでやるとカオス :black_joker: で楽しかったです。
という感じで2回目でした :smirk_cat:

.. author:: default
.. categories:: SICP
.. tags:: オンラインSICP読書女子会, SICP
.. comments::
