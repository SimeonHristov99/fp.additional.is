import Data.List

main :: IO()
main = do
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 2), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 2)] == "English"
    print $ hardestSubject [("John", "Maths", 5), ("Kennedy", "English", 5), ("Joe", "Programming", 4), ("Claudia", "Programming", 6), ("Sam", "Maths", 4), ("Jenn", "English", 5)] == "Maths"

type Student = String
type Subject = String
type Note = Double
type Record = (Student, Subject, Note)

-- [p1=("Maths",4.5),p2=("English",2.0),("Programming",5.0)]
-- 4.5 > 2
-- [p1=("English",2.0),p2=("Programming",5.0)]
-- 2 < 5
-- [("English",2.0)]

average :: (Num a, Fractional a) => [a] -> a
average xs = sum xs / (fromIntegral $ length xs)

hardestSubject :: [Record] -> Subject
hardestSubject rs = foldl1 (\ s1 s2 -> if getAvgGrades s1 < getAvgGrades s2 then s1 else s2) subjects
 where
    subjects = nub $ map (\ (_, s, _) -> s) rs
    getAvgGrades subject = average [g | (_, s, g) <- rs, s == subject]

