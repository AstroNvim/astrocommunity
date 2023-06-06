# nvim-spider
**Repository:** https://github.com/chrisgrieser/nvim-spider

Use the `w`, `e`, `b` motions like a spider.

# Features
## Subword Motion 
  
 ```lua 
 -- positions vim's `w` will move to 
 local myVariableName = FOO_BAR_BAZ 
 --    ^              ^ ^ 
  
 -- positions spider's `w` will move to 
 local myVariableName = FOO_BAR_BAZ 
 --    ^ ^       ^    ^ ^   ^   ^ 
 ``` 
  
## Skipping Insignificant Punctuation
  
 ```lua 
 foo == bar .. "baz" 
 --  ^      ^    significant punctuation 
  
 foo:find("a") 
 -- ^    ^  ^  insignificant punctuation 
 ```
