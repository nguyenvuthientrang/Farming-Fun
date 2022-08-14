/// @description Insert description here
// You can write your code in this editor
ds_crops_types = -1;
ds_crop_instances = -1;
//ds_crop_data = ds_grid_create(4,1);
//ds_grid_clear(ds_crop_data, -1);

enum crops {
	tomato,
	potato,
	carrot,
	artichoke,
	chilli,
	gourd,
	corn
}

create_crop_type(4, 40);  //tomato
create_crop_type(3, 35);  //potato
create_crop_type(2, 25);  //carrot
create_crop_type(4, 45);  //artichoke
create_crop_type(3, 30);  //chilli
create_crop_type(2, 20);  //gourd
create_crop_type(5, 50);  //corn

planting = true;
harvesting = false;
selectCrop = 0;

mx = 0;
my = 0;

cellSize = 32;