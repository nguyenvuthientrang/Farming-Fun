var tmp = min(max_amount-amount, global.ds_inventory[# 1, 10])

amount += tmp

global.ds_inventory[# 1, 10] -= tmp
