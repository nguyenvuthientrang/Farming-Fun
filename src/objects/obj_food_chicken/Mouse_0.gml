var tmp = min(max_amount-amount, global.ds_inventory[# 1, 8])

amount += tmp

global.ds_inventory[# 1, 8] -= tmp


