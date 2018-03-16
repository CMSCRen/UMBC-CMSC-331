ARRAY = {1,2,3}

A = 1
B = 1

R = 1
H = 1

STRA = "a"
STRB = "b"
STRC = "c"
STRD = "d"

FNAME = "dummy.txt"

TBL_NAME = {{'Hydrogen',1776},{'Helium',1868}
	 ,{'Lithium',1817},{'Phosphorus',1669}}


NUM_STRING = "-00"

CURR_STR = "dollars"
--1.
function sum(table)
    sum = 0
    for key,value in pairs(table) do
        sum = sum + value
    end
    return sum
end

function avg(array)
    if #array ~= 0 then
       average = sum(array)/(#array)
     else
       average = 0
     end
     return (average)
end
--avg called here
print("Average: " .. avg(ARRAY))
print()

--2.
function int_divide(a,b)
  subFrom = a
  toSub = b
  count = 0
  while (subFrom > 0) do
      subFrom = subFrom - toSub 
      count = count + 1
   end
   if subFrom ~= 0 then
      count = count - 1
    end
    return count
end

--int_divide called here
print("Int_Divide: " .. int_divide(A,B))
print()


--3.
m = require "math"
function cone_facts(r,h)
    volume = m.pi * m.pow(r,2) * h
    surface = m.pi * m.pow(r,2) + (m.pi * r) * m.sqrt(m.pow(r,2) + m.pow(h,2))
    return volume,surface
end

--cone_facts called here
v,sa = cone_facts(R,H)
print("Cone_facts: ")
print("V: " .. v .. " SA: " .. sa)
print()
--4.
function join(a,b,c,d)
printStr = ""
	 if a then
	 printStr = printStr .. a 
	 end
	 if b then
	 printStr = printStr .."," .. b
	 end
	 if c then
	 printStr = printStr .. "," .. c
	 end
	 if d then
	 printStr = printStr .. "," .. d
	 end
print("Join: " .. printStr)
end

--calling join here

join(STRA,STRB,STRC,STRD)
print()

--5.

function read_elements(f_name)
	 toreturn = {}
	 fptr = io.open(f_name, "r")
	 io.input(fptr)

	 if fptr then
	    line = io.read()
	 else
	     print("ERROR")
	 end
	 while line do
	 inner = {}  
	    for word in string.gmatch(line,"%a+") do 
	       table.insert(inner,word) 
	    end
	    table.insert(toreturn,inner)
	 line = io.read()
	 end
   return toreturn 
end

--calling read_elements here
dummy = read_elements(FNAME)
      for k,v in pairs(dummy) do
	      print ("Table: " .. k)
      	  for k2,v2 in pairs(v) do
     	   print (v2)
	  end
      end
print()
--6.
function sort_by_year(table_name)
   	 for passes in pairs(table_name) do	
   	 for k,v in pairs(table_name) do
	 if table_name[k+1] and (table_name[k][2] > table_name[k+1][2]) then
	    table_name[k],table_name[k+1] = table_name[k+1],table_name[k]
	 end
	 end
	 end

	     for k,v in pairs(table_name) do
	     print(table_name[k][1] .. "\t" .. table_name[k][2])
	     end

end
--calling sort_by_year here
sort_by_year(TBL_NAME)

--7.
function scan(num_string)
possdec = false
possoct = false
posshex = false
nonsense = false
--keys are valid digits so if char is a valid key , then it's a valid digit
DECDIGITS = {["1"] = 0,["2"] = 0,["3"] = 0,["4"] = 0,["5"] = 0,
	  ["6"] = 0,["7"] = 0,["8"] = 0,["9"] = 0,["0"] = 0}

OCTDIGITS = {["1"] = 0,["2"] = 0,["3"] = 0,["4"] = 0,
	  ["5"] = 0,["6"] = 0,["7"] = 0,["0"] = 1}

HEXDIGITS = {["1"] = 0,["2"] = 0,["3"] = 0,["4"] = 0,["5"] = 0,
	  ["6"] = 0,["7"] = 0,["8"] = 0,["9"] = 0,["0"] = 0,
	  ["a"] = 0,["b"] = 0,["c"] = 0,["d"] = 0,["e"] = 0,["f"] = 0,
	  ["A"] = 0,["B"] = 0,["C"] = 0,["D"] = 0,["E"] = 0,["F"] = 0,}

SIGNS = {["+"] = 0, ["-"] = 0}

-- remove +, - sign if there is one
   if SIGNS[num_string:sub(1,1)] then
   num_string = num_string:sub(2,#num_string)
   end

-- special cases
   if #num_string == 1 and num_string:sub(1,1) == "0" then
      print("Decimal")
      return
   end
   if #num_string == 2 and num_string:sub(1,1) == "0" 
   and num_string:sub(2,2) == "0" then
      print("Octal")
      return
   end
   if #num_string == 3 and num_string:sub(1,1) == "0" 
   and num_string:sub(2,2) == "x" and num_string:sub(3,3) == "0" then
      print("Hexadecimal")
      return
   end


--set flags
--if first digit not 0 then can only be decimal
      if num_string:sub(1,1) ~= "0" then
	      possdec = true
--if second digit is x then can only be hex	  
      elseif #num_string > 1 and num_string:sub(2,2) == "x" then
	      posshex = true
--if second digit is a valid octal digit but not 0, is octal
      elseif #num_string > 1 and OCTDIGITS[num_string:sub(2,2)] ~= 1 then
      	      possoct = true
      else
	nonsense = true
      end


	 for i = 1, #num_string do
    	   char = num_string:sub(i,i)
	   if possdec and not DECDIGITS[char] then
	      	 nonsense = true
	   end
	   if possoct and not OCTDIGITS[char] then
	      	 nonsense = true
	   end
	   if posshex and (not HEXDIGITS[char] and i ~= 2)then
	      	 nonsense = true
	   end
	   if nonsense then
	   print("NONSENSE")
	   return
	   end
	end
	 if possdec then
	    print("Decimal")
   	 end
	 if possoct then
	    print("Octal")
   	 end
	 if posshex then
	    print("Hexadecimal")
   	 end

end

--calling scan here
scan(NUM_STRING)
print()

--8.
function make_account(currency_string)
    local account = 0

    return function (amount)
    account = account + amount
    return account
    end,
    function (amount)
    account = account - amount
    return account
    end,
    function (amount)
    print("You have " .. account .. " " .. 
    currency_string .. " in your account") 
    return account
    end
end

--testing

deposit, withdraw, report= make_account(CURR_STR)
report()
deposit(10)
report()
withdraw(4)
report()