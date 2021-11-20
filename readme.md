if_1(
  if_1_1(
  )
)
if_2()

if_layer = 0
isIfOpens = [t,f...]
if_counts = [0,...]

进入if_1
isIfOpens[if_layer] == true
if_layer++ => 1
if_counts[if_layer]++ => [0,...]=>[0,1,0...]
isIfOpens[if_layer]=true => [t...]=>[t,t,f...]

进入if_1_1
isIfOpen[if_layer] == true
if_layer++ => 2
if_counts[if_layer]++ => [0,1,0...]=>[0,1,1,0...]
isIfOpens[if_layer]=true => [t,t,f...]=>[t,t,t,f...]

离开if_1_1
isIfOpen[if_layer]=>false => [t,t,t,f...] =>[t,t,f...]
if_counts[if_layer+1]=0 => [0,1,1,0...]=>[0,1,1,0...]
if_layer-- => 1

离开if_1
isIfOpen[if_layer]=>false => [t,t,f...] =>[t,f...]
if_counts[if_layer+1]=0 => [0,1,1,0...]=>[0,1,0...]
if_layer-- => 0

进入if_2
isIfOpens[if_layer] == true
if_layer++ => 1
if_counts[if_layer]++ => [0,1,0...]=>[0,2,0...]
isIfOpens[if_layer]=true => [t...]=>[t,t,f...]

离开if_2
isIfOpen[if_layer]=>false => [t,t,f...] =>[t,f...]
if_counts[if_layer+1]=0 => [0,1,0...]=>[0,1,0...]
if_layer-- => 0
