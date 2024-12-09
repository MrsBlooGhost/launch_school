s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
puts s.split(',').inspect
puts s.split(',', 2).inspect

# output:
# ["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
# ["abc def ghi", "jkl mno pqr", "stu vwx yz"]
# ["abc def ghi", "jkl mno pqr,stu vwx yz"]