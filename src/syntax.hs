x :: Integer
x = 99

f :: Integer -> Integer
f r = r + 10

ff :: Integer -> Integer -> Integer
ff a b = (a + b) * 2

fff :: Integer -> Integer -> Integer
fff = \a b -> (a + b) * 2
-- fff = \a -> \b -> (a + b) * 2
-- fff a = \b -> (a + b) * 2

-- Inflix by default
(.+.) a b = (a + b) * 2

-- Parametric polymorphism

g :: a -> a
g x = x

h :: a -> b -> a
h x y = x

gg :: Num a => a -> a
gg x = x + 1

-- Data types

data Shape =
  Circle Integer
  | Rectangle Integer Integer
  | Triangle Integer Integer Integer
  deriving (Show, Eq)

pie :: Integer
pie = 3

perimeter :: Shape -> Integer
perimeter = \s -> case s of
                    Circle r -> r * 2 * pie
                    Rectangle w h -> (w + h) * 2
                    Triangle a b c -> a + b + c

perimeter2 :: Shape -> Integer
perimeter2 (Circle r) = r * 2 * pie
perimeter2 (Rectangle w h) = (w + h) * 2
perimeter2 (Triangle a b c) = a + b + c

-- Functions

hh :: (Integer -> Integer) -> Integer
hh w = 1 + w 88

-- type classes

class Equal a where
  (===) :: a -> a -> Bool

instance Equal Shape where
--  (===) :: Shape -> Shape -> Bool
  (===) (Circle r1) (Circle r2) = r1 == r2
  (===) (Rectangle w1 h1) (Rectangle w2 h2) = w1 == w2 && h1 == h2
  (===) (Triangle l1 l2 l3) (Triangle l1' l2' l3') = (l1 == l1') && (l2 == l2') && (l3 == l3')
  (===) _ _ = False

data ExactlyTwo a = ExactlyTwo a a
  deriving (Eq, Show)


