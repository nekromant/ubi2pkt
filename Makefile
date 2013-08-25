obj-m += block2mtd.o

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

voodoo: all
	-sudo rmmod ./block2mtd.ko
	sudo insmod ./block2mtd.ko block2mtd=/dev/sr0,65536,2048

